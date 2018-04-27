# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=itk-snap
pkgver=3.6.0
pkgrel=1
pkgdesc='ITK-SNAP is a software application used to segment structures in 3D medical images'
arch=('x86_64')
url='http://www.itksnap.org'
license=('GPL3')
depends=('insight-toolkit' 'vtk' 'qt5-base' 'fltk')
optdepends=()
makedepends=('cmake')
source=("$pkgname::git+git://git.code.sf.net/p/itk-snap/src"
        "itkKernelFunction.h"
        "itksnap.png"
        "itksnap.desktop")
sha512sums=('SKIP'
            '69010fb1d771ce28793a3f546dd7bf10b200d45755e44b77145c49af88291d89778753deb431a523c637ed7c954a73b172f4bbd52baf41b65594454acb6dcad2'
            'b5f1e7876a9d0cb7d1abb1f0c19147642b99511d8a052a91053affa51aabd9a3929288fbe7fa365c4ad7042f28edca4759a9f3fb8f48916d1e7ee2023b1e7591'
            'bd699dad2ff6704e56b9ac8073d92683060bf9b71ae2218c7dafd272210d8a402db1e08bedc3187e96bb74adb40a2b30b0da92bc34dd3ca40fe05e24d43d247b')

_release_commit='562f52acab8668bae681e206b20d559e59e2ef37'

prepare() {
	cd "$srcdir/$pkgname"
	
	git checkout $_release_commit

	# Replace relative with absolute location of the repo
	sed -i 's,../../c3d/git,git://git.code.sf.net/p/c3d/git,' .gitmodules

	git submodule init
	git submodule update

	mkdir build || :
	cd build

	# Ship a deprecated ITKv3 compatibility header
	# The v3 compatibility module will be soon removed from ITK 5.0,
	# so better to not add it as a dependency
	mkdir itkv3 || :
	cp "$srcdir/itkKernelFunction.h" itkv3/.

	cmake .. \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_CXX_FLAGS="-fPIC -I'$srcdir/$pkgname/build/itkv3' -DITKV3_COMPATIBILITY=1" \
		-DBUILD_OUTSIDE_INSIGHT_APPLICATIONS=ON \
		-DBUILD_TESTING=OFF \
		-DFLTK_FLUID_EXECUTABLE="/usr/bin/fluid"
}

build() {
    cd "$srcdir/$pkgname/build"
	make
}

package() {
    cd "$srcdir/$pkgname/build"
	make install DESTDIR="$pkgdir"

	install -D -m644 "$srcdir/itksnap.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/itksnap.png"
	install -D -m644 "$srcdir/itksnap.desktop" "${pkgdir}/usr/share/applications/itksnap.desktop"
}

