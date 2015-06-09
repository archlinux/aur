# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

# This package does not include editor syntax files or the Qt CMake GUI.

pkgname=cmake30
pkgver=3.0.2
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=(i686 x86_64)
url="http://www.cmake.org/"
license=(custom)
depends=(curl libarchive shared-mime-info)
install=cmake.install
source=("http://www.cmake.org/files/v${pkgver%.*}/cmake-${pkgver}.tar.gz")
sha512sums=('de267bd6c5b318e48fae64c28947de009fb2413bdc6b4454b5e4bbb7d50b78aaef5d7e9d9655cfb9299aa5704fd3e4bbabc6816d3f378f76856f56ab161efe02')

build() {
    cd cmake-${pkgver}

    if in_array ccache "${BUILDENV[@]}"; then
        local ccache_arg='--enable-ccache'
    else
        local ccache_arg=''
    fi

    ./bootstrap \
        --prefix=/usr \
        --mandir=/share/man \
        --system-libs \
        --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN) \
        ${ccache_arg}
    make
}

package() {
    cd cmake-${pkgver}
    make DESTDIR="${pkgdir}" install

    install -Dm644 Copyright.txt \
        "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    mv "${pkgdir}"/usr/bin/ccmake{,-3.0}
    mv "${pkgdir}"/usr/bin/cmake{,-3.0}
    mv "${pkgdir}"/usr/bin/cpack{,-3.0}
    mv "${pkgdir}"/usr/bin/ctest{,-3.0}

    rm -r "${pkgdir}"/usr/share/aclocal/
}
