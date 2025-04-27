# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=motu
pkgname=('motu' 'motu-dkms')
pkgver=r23.g655c39e
pkgrel=2
pkgdesc='Kernel module for MOTU MIDI devices'
arch=('x86_64')
url='https://github.com/vampirefrog/motu'
license=('GPL-3.0-only')
makedepends=('git' 'linux-headers')
_commit='655c39e5d5f9ac7a83b1ab6fedb1c5aac0ff81ae'
source=(
  "$pkgbase::git+$url#commit=$_commit"
  'Makefile'
  'dkms.conf'
  'suppress-debug-output.patch'
)
b2sums=('9b78ef28e83de58f0b036a3f837826421cb01c3c31e9e98b45b216671c713e9052e058719dd89643d5d37f7e02cf28c6a07173d36ca90bff3bc713b32dcb0a68'
        '4e8d84050bd1622e7463ac8ea821161ea441cc3aa3d80c1c9bddfe55ac642fa606d3d740aba1af94726a04f8d42d9c3f4062f368d4a4162958633f42ee9fc04e'
        '465634006f0d65d67d67e80b1870b88128765493166c87a6190a7a752417f37c79270f0437c2d8fef5f745f398187d0d23ee328dcaaa1f3a7a406c759ff48404'
        '5e6bca7fd4e657c0b4b71f6d19e4d6824337baeae4aaaef17a54315b4c3b123792e5cfc9797488f4dd174d3c4d74f6c543d71b9885c498bffaac3a8ba2ccae30')

pkgver() {
  cd "$pkgbase"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # overwrite upstream config
  cp -vr Makefile dkms.conf "$pkgbase"

  # debug output is a tad excessive
  cd "$pkgbase"
  patch -p1 -i "$srcdir/suppress-debug-output.patch"
}

build() {
  cd "$pkgbase"

  make -C /usr/src/linux M="$PWD" modules
}

package_motu() {
  depends=('linux')

  cd "$pkgbase"

  local _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec strip --strip-debug {} +
  find "${pkgdir}" -name '*.ko' -exec zstd --rm {} +
}

package_motu-dkms(){
  depends=('dkms')
  conflicts=('motu')
  provides=('motu')

  cd "$pkgbase"

  # required files for dkms rebuild
  install -vDm644 \
    -t "$pkgdir/usr/src/$pkgbase-$pkgver" \
    motu.c Makefile dkms.conf

  # set name and version for dkms template
  sed -e "s/@PKGBASE@/$pkgbase/" \
      -e "s/@PKGVER@/$pkgver/" \
      -i "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
}
