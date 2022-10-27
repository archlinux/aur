# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=motu
pkgname=('motu' 'motu-dkms')
pkgver=r19.g516da18
pkgrel=1
pkgdesc='Kernel module for MOTU MIDI devices'
arch=('x86_64')
url='https://github.com/vampirefrog/motu'
license=('GPL3')
makedepends=('git' 'linux-headers')
_commit='516da186c9e2112cae84b3cf0d5979e23c52d62b'
source=(
  "$pkgbase::git+$url#commit=$_commit"
  'Makefile'
  'dkms.conf'
)
b2sums=('SKIP'
        '4e8d84050bd1622e7463ac8ea821161ea441cc3aa3d80c1c9bddfe55ac642fa606d3d740aba1af94726a04f8d42d9c3f4062f368d4a4162958633f42ee9fc04e'
        'ede461a5f32df0919186e0afe66e5d19511cbf527ff1eb31fedc414e4d6de1fb887a9cea288442fab0e7e0b6fe52d8eef1f6fc7c6a8c0b1262f8d681fa28f360')

pkgver() {
  cd "$pkgbase"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

  install -vDm644 \
    -t "$pkgdir/usr/src/$pkgbase-$pkgver" \
    "$pkgbase/motu.c" Makefile dkms.conf

  # Set name and version for DKMS template
  sed -e "s/@PKGBASE@/$pkgbase/" \
      -e "s/@PKGVER@/$pkgver/" \
      -i "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
}
