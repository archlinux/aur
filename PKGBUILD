# Maintainer: ckvsoft@gmail.com
# Contributor: soloturn@gmail.com
# Contributor: nblock <nblock [/at\] archlinux DOT us>

_basename=qrk
pkgname="$_basename"
pkgver=1.24.0.r5.gf10f78d
pkgrel=1
pkgdesc="A graphical cash register for small companies"
arch=('i686' 'x86_64')
url="https://www.ckvsoft.at"
license=('GPL')
depends=('crypto++' 'qrencode' 'pcsclite')
makedepends=('git' 'qt5-declarative' 'qt5-serialport')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git://git.code.sf.net/p/qrk-registrier-kasse/code")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  _upper_basename=$(echo ${_basename} | tr '[:lower:]' '[:upper:]')
  qmake-qt5 "${_upper_basename}.pro"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/{bin,lib,share/applications}
  install -D -m755 "bin/$_basename" "$pkgdir"/usr/bin/$_basename
  cp qrkcore/libQrkCore.so* "$pkgdir"/usr/lib/
  install -D -m644 "src/icons/logo.png" "$pkgdir/usr/share/pixmaps/$_basename.png"
  install -D -m644 "$srcdir/../$_basename.desktop" "$pkgdir/usr/share/applications/$_basename.desktop"
}

