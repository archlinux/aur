# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="$_setPrefix/lib32"
_pkgbase=icu
_pkgmaj=51
_pkgmin=3
pkgrel=1

pkgname=lib32-$_pkgbase$_pkgmaj
pkgver=$_pkgmaj.$_pkgmin
pkgdesc="International Components for Unicode library, version 51"
arch=('x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('lib32-gcc-libs>=4.7.1-5')

source=("https://github.com/unicode-org/${_pkgbase}/releases/download/release-${pkgver//./-}/${_pkgbase}4c-${pkgver//./_}-src.tgz")

sha256sums=('cdc58f7b4ac62202770a3e29d9e7526e86bf9b8dfa3aebfa09f8263e315f3c58')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

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
  cp -a lib/libicu*51* "${pkgdir}${_setLibdir}"

  # Install the license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
