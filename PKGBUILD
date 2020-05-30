# Maintainer: Maxime Borges <contact@maximeborg.es>

_setPrefix="/usr"
_setLibdir="$_setPrefix/lib"
_pkgbase=icu
_pkgmaj=50
_pkgmin=2
pkgrel=1

pkgname=lib$_pkgbase$_pkgmaj
pkgver=$_pkgmaj.$_pkgmin
pkgdesc="International Components for Unicode library, version 50"
arch=('x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5')

source=("https://github.com/unicode-org/icu/releases/download/release-${_pkgmaj}-${_pkgmin}/icu4c-${_pkgmaj}_${_pkgmin}-src.tgz")
sha256sums=('87306f088a4c7c00b0adac6b84e8862fef81c18f8ec70a60cb03258062908440')

build() {
  export CC='gcc'
  export CXX='g++'
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'

  cd ${srcdir}/icu/source

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --libdir=${_setLibdir}
  make
}

package() {
  cd "${srcdir}/icu/source"

  # Copy only .so libs to the destination dir
  mkdir -p "${pkgdir}${_setLibdir}"
  cp -a lib/libicu*50* "${pkgdir}${_setLibdir}"

  # Install the license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
