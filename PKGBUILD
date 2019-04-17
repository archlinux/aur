# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=itk-snap
pkgver=3.6.0
pkgrel=5
pkgdesc='Software to segment structures in 3D medical images'
arch=('x86_64')
url='http://www.itksnap.org'
license=('GPL3')
depends=(
	'ffmpeg'
	'fltk'
	'gdal'
	'glew'
	'insight-toolkit'
	'jsoncpp'
	'libogg'
	'libtheora'
	'netcdf'
	'openmpi'
	'proj'
	'pugixml'
	'python'
	'qt5-declarative'
	'qt5-x11extras'
	'unixodbc'
	'vtk'
)
optdepends=()
makedepends=('cmake' 'git')
source=("$pkgname::git+git://git.code.sf.net/p/itk-snap/src"
        "itkKernelFunction.h"
        "itksnap.png"
        "itksnap.desktop")
sha256sums=('SKIP'
            'f88fce76c3a0a3bf72deba15e901945f89df422db27e09b75fdd1a169a856e3d'
            'ee2f8698bf751cb3e1e6520e99c0c761f996fd3707f4155d126e7ecc0a6d6884'
            '2c23d817b14df70d9561ff601509f1e0899881e37598048e551dc2161f78b1b2')

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

