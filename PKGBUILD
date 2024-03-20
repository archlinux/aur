# Maintainer: gigas002 <gigas002@pm.me>

pkgname=qimgv-qt6-kde-git
_pkgname=qimgv
pkgver=v1.0.3.alpha.r105.g70dc0ef
pkgrel=1
pkgdesc="Qt6 image viewer. Fast, configurable, easy to use. Supports video playback."
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://github.com/easymodo/qimgv"
license=('GPL3')
depends=('qt6-base' 'qt6-imageformats' 'qt6-svg' 'qt6-5compat' 'mpv' 'exiv2' 'opencv')
makedepends=('git' 'cmake' 'pkgconf' 'qt6-tools')
optdepends=('kimageformats: support for more image formats'
            'qt6-imageformats'
            'qt6-jpegxl-image-plugin: JPEG-XL support'
            'qt6-avif-image-plugin-git: AVIF support'
            )
provides=("qimgv")
conflicts=("qimgv")
patch="qt6.patch"
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -i ../../$patch
    install -d build
}

build() {
    # -DKDE_SUPPORT=ON is broken, app requires KDE6 migration
    cd "${srcdir}/${_pkgname}/build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DFORCE_QT6=ON \
        -DQT_DEFAULT_MAJOR_VERSION=6 \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
	make DESTDIR=${pkgdir} install
}
