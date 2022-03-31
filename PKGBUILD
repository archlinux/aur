# Maintainer: andre.menrath@posteo.de
pkgname=sws
pkgver=2.13.0.0
pkgrel=1
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="https://www.sws-extension.org/"
license=('MIT')
depends=('reaper-bin>=6.53' 'taglib')
makedepends=('git' 'make' 'cmake' 'php' 'perl')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_commit=4ca0494874c3b38cac5372bc56505835e46150ac  # version 2.13.0.0
source=("git+https://github.com/reaper-oss/sws.git#commit=$_commit")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
	head -1 $srcdir/$pkgname/version.h.in | tr , . | cut -d' ' -f3
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_TAGLIB=YES
	cmake --build build
}

package() {
	mkdir -p "${pkgdir}/opt/REAPER/UserPlugins/"
	cp "${srcdir}/$pkgname/build/reaper_sws-x86_64.so" "${pkgdir}/opt/REAPER/UserPlugins/"
	mkdir -p "${pkgdir}/opt/REAPER/Scripts/"
	cp "${srcdir}/$pkgname/build/sws_python64.py" "${pkgdir}/opt/REAPER/Scripts/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/$pkgname/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
