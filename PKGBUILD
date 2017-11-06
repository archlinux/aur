# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.3.0
pkgrel=3
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=18.0.1" "cef-minimal"
)
makedepends=("make" "cmake")
optdepends=("pepper-flash: Flash support")
source=(
    	"https://github.com/bazukas/$pkgname/archive/${pkgver}.tar.gz"
    	"transparentpainting.patch"
)
sha256sums=('94ab4d2f83a6ad4bcea884240f770ca87cdea1b035228905ef0c10f7cc9f4e30'
            '76733b17029ab1e5873c02754751b666cc4e10d6ff771f6eb8ea3d321a6d2246')
prepare() {
	cd "$srcdir"/"$pkgname-${pkgver}"
	patch -p1 < $srcdir/transparentpainting.patch
}

build() {
    	cd "$srcdir"/${pkgname}-${pkgver}
    	mkdir -p ./build
    	cd ./build
    	cmake -D CEF_DIR="/opt/cef" ..
    	make clean
    	make -j4
}
package() {
    	mkdir -p "$pkgdir"/usr/lib/obs-plugins/
	mkdir -p "$pkgdir"/usr/share/obs/obs-plugins/$pkgname
	cp -R "$srcdir"/$pkgname-${pkgver}/build/build/$pkgname/bin/64bit/* "$pkgdir"/usr/lib/obs-plugins/
	mv "$pkgdir"/usr/lib/obs-plugins/libobs-linuxbrowser.so "$pkgdir"/usr/lib/obs-plugins/obs-linuxbrowser.so
	cp -R "$srcdir"/$pkgname-$pkgver/build/build/$pkgname/data/* "$pkgdir"/usr/share/obs/obs-plugins/$pkgname
}
