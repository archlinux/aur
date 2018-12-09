# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.7
pkgrel=1
pkgdesc='3D video player with multi-display support'
arch=('i686' 'x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(https://bino3d.org/releases/bino-1.6.7.tar.xz{,.sig})
sha512sums=('ae8f72b200100664b9fd55963371ce64a2f39e240676494d69b422d662f2295560ba458eb04707b82f88d3c6b3fab98a1ecb40d74799300f96b8eb8be680c9b8'
	'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/CXXFLAGS -fPIE/& -fPIC/' configure
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# libglewmx* env variables are to fix compilation issue
	# when both glew and glew1.6 are installed
	# details at https://gitlab.marlam.de/marlam/bino/issues/1
	libglewmx_CFLAGS="$(pkg-config --cflags glew)" libglewmx_LIBS="$(pkg-config --libs glew)" ./configure \
				--prefix=/usr \
	            --with-qt-version=5 \
	            #--with-xnvctrl # Enable NVIDIA Quadro SDI output
	sed -i '/am__append_.* = -DGLEW_MX/d' src/Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
