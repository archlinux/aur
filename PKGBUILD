# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=soxt
pkgver=1.4.0
_soanydata_commit=3ff6e9203fbb0cc08a2bdf209212b7ef4d78a1f2
_sogui_commit=100612bf4016916dd686e2b6fecf8ac23d3db14d
pkgrel=1
pkgdesc='A high-level 3D graphics toolkit on top of OpenGL.'
arch=('i686' 'x86_64')
url='https://github.com/coin3d/soxt'
license=('GPL')
depends=('coin' 'libxi' 'libxmu' 'libxpm' 'openmotif')
makedepends=('cmake' 'doxygen')
source=("https://github.com/coin3d/soxt/archive/SoXt-$pkgver.tar.gz"
        "soanydata-$_soanydata_commit.tar.gz::https://github.com/coin3d/soanydata/archive/$_soanydata_commit.tar.gz"
        "sogui-$_sogui_commit.tar.gz::https://github.com/coin3d/sogui/archive/$_sogui_commit.tar.gz"
        "soxt-remove-cpack.patch::https://github.com/coin3d/soxt/commit/5183559.patch")
sha256sums=('46f091fc0e0e6bf78f6a4f59d984c12c93532f92c2a84081ff42d50bfe670fc7'
            'ede29d60d1b35e66193aaf115784f87867ab1658cb1d977fe75dfc0d0ffb3241'
            '605c649902c7be3549b9df7bfdd11d80f13f3aa09b8f0654bf99bcf66a1ee914'
            '6fd58fb1f0ddc385a4a93edae3e1a3bd5cf3ba68a89cd85095be5f3b1ac8db91')

prepare() {
    cd soxt-SoXt-$pkgver

    patch -Np1 -i ../soxt-remove-cpack.patch

    ln -rs ../soanydata-$_soanydata_commit data
    ln -rs ../sogui-$_sogui_commit src/Inventor/Xt/common
}

build() {
    mkdir -p build
    cd build

    cmake ../soxt-SoXt-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSOXT_BUILD_DOCUMENTATION=ON \
        -DSOXT_BUILD_DOC_MAN=ON \
        -DSOXT_BUILD_DOC_CHM=OFF

	make
}

package() {
	cd build

	make DESTDIR="$pkgdir" install

	# these files conflict with soqt, so rename them
	for FILE in components devices misc viewers; do
		mv "${pkgdir}/usr/share/man/man3/${FILE}.3" "${pkgdir}/usr/share/man/man3/soxt-${FILE}.3"
	done
}

