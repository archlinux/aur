# Maintainer: andre.menrath@posteo.de
pkgname=sws
pkgver=2.12.1.2
pkgrel=1
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="https://www.sws-extension.org/"
license=('MIT')
depends=('reaper-bin>=6.19' 'taglib')
makedepends=('git' 'gcc' 'make' 'cmake' 'php' 'perl')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_commit=145a0070185b7a3d19ea455eb64f1f71026d5cde  # version 2.12.1.2
source=("git://github.com/reaper-oss/sws.git#commit=$_commit"
		"reaper_plugin_functions.h")
sha256sums=('SKIP'
            '7fbe3a97f83281fbae98b70f99db880188dbaaeb0336acfebf51db548384e2ab')
install="$pkgname.install"

pkgver() {
	head -1 $srcdir/$pkgname/version.h.in | tr , . | cut -d' ' -f3
}

prepare() {
	cp "reaper_plugin_functions.h" "$srcdir/$pkgname/vendor"
	cd "$srcdir/$pkgname"
	git submodule update --init vendor/WDL
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
