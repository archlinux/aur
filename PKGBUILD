# Maintainer: Afnan Enayet <afnan at afnan.io>

pkgname=hdrview-git
provides=('hdrview')
_pkgname=hdrview
pkgver=269.8436cf9
pkgrel=3
pkgdesc='HDRView is a simple research-oriented high-dynamic range image viewer with an emphasis on examining and comparing images, and including minimalistic tonemapping capabilities'
url='https://bitbucket.org/wkjarosz/hdrview'
arch=('x86_64')
license=('BSD')
makedepends=('cmake' 'git')
depends=('zlib')
sha256sums=('SKIP'
            '29450b60ca46062663ec603a0b68f8500cf882761654f756b81afb368845fdc5')

source=('git+https://bitbucket.org/wkjarosz/hdrview.git' 
        'hdrview-git.patch')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}

    # Apply patch to make sure missing icons paths aren't used
    patch --forward --strip=1 --input=${srcdir}/hdrview-git.patch

    # The preferred method of working with submodules in the AUR guidelines
    # doesn't seem to work recursively, so we use the "naive" method instead
    git submodule update --init --recursive
}

build() {
    cd ${_pkgname}
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

package() {
    # Create directories for icons, metadata
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/32x32/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/16x16/apps
    make -C ${_pkgname}/build DESTDIR="${pkgdir}/" install
}
