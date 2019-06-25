# Maintainer: Maxime Borges <contact@maximeborg.es>

_setPrefix="/usr"
_setLibdir="$_setPrefix/lib"
_pkgbase=icu
_pkgmaj=50
_pkgmin=1
pkgrel=1

pkgname=lib$_pkgbase$_pkgmaj
pkgver=$_pkgmaj.$_pkgmin
pkgdesc="International Components for Unicode library, version 50"
arch=('x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5')

source=("http://download.icu-project.org/files/${_pkgbase}4c/${pkgver}/${_pkgbase}4c-${pkgver//./_}-src.tgz")

md5sums=('cf7bf9e56aa6c2057a8b6f464046483e')

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
