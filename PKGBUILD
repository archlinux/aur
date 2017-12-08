# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.3.0
pkgrel=4
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=20.0.1" "cef-minimal"
)
makedepends=("make" "cmake")
optdepends=("pepper-flash: Flash support")
source=(
    	"${pkgname}::git+https://github.com/bazukas/${pkgname}.git"
    	"transparentpainting.patch"
    	"autoreload.patch"
)
sha256sums=('SKIP'
            '76733b17029ab1e5873c02754751b666cc4e10d6ff771f6eb8ea3d321a6d2246'
            'f2b01597083c7af97c56fd68d0d6211448481891ea5e2f3352dabb69bfeb20a6')
prepare() {
	cd "$srcdir"/"${pkgname}"
	git checkout ${pkgver}
	patch -p1 < $srcdir/transparentpainting.patch
	patch -p1 < "${srcdir}"/autoreload.patch
}

build() {
    	cd "${srcdir}"/${pkgname}
    	mkdir -p ./build
    	cd ./build
    	cmake -D CEF_DIR="/opt/cef" ..
    	make clean
    	make -j4
}
package() {
	mkdir -p "${pkgdir}"/usr/lib/obs-plugins/
	mkdir -p "${pkgdir}"/usr/share/obs/obs-plugins/${pkgname}
	cp -R "${srcdir}"/${pkgname}/build/build/${pkgname}/bin/64bit/* "${pkgdir}"/usr/lib/obs-plugins/
	mv "${pkgdir}"/usr/lib/obs-plugins/libobs-linuxbrowser.so "${pkgdir}"/usr/lib/obs-plugins/obs-linuxbrowser.so
	cp -R "${srcdir}"/${pkgname}/build/build/${pkgname}/data/* "${pkgdir}"/usr/share/obs/obs-plugins/${pkgname}
}
