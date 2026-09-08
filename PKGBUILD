# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=motu
pkgname=(motu motu-dkms)
pkgver=r33.g59afe80
pkgrel=2
pkgdesc='Kernel module for MOTU MIDI devices'
arch=(x86_64)
url='https://github.com/vampirefrog/motu'
license=(GPL-3.0-only)
makedepends=(git linux-headers)
_commit='59afe8082e191a91367579d7b0d6f5e14c4424ca'
source=(
  "$pkgbase::git+$url#commit=$_commit"
  Makefile
  dkms.conf
  replace-strncpy.patch
)
b2sums=('cc00f56887cef9e05bf5d14ab47782659776b45819dceb09aaf4a45718c26231975e42066b35112413d3bdc6b8c8279ef6386671c190aab4dde9a462ffc01690'
        '4e8d84050bd1622e7463ac8ea821161ea441cc3aa3d80c1c9bddfe55ac642fa606d3d740aba1af94726a04f8d42d9c3f4062f368d4a4162958633f42ee9fc04e'
        '465634006f0d65d67d67e80b1870b88128765493166c87a6190a7a752417f37c79270f0437c2d8fef5f745f398187d0d23ee328dcaaa1f3a7a406c759ff48404'
        '6ddcd42b3e17934a183b25883f471cc1c8d5e1065b2ae57ccf4f2d1eff9970144747d5f6a3dab977e7b7c05fd65e0dcda9b2aa492f21ec03b20038da054f337a')

pkgver() {
  cd "$pkgbase"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # overwrite upstream config
  cp -vr Makefile dkms.conf "$pkgbase"

  cd "$pkgbase"

  # strncpy has been deprecated
  patch -p1 -i "$srcdir/replace-strncpy.patch"
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
