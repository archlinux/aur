# Maintainer: Afnan Enayet <afnan at afnan.io>

pkgname=hdrview-git
provides=('hdrview')
_pkgname=hdrview
pkgver=269.8436cf9
pkgrel=2
pkgdesc='HDRView is a simple research-oriented high-dynamic range image viewer with an emphasis on examining and comparing images, and including minimalistic tonemapping capabilities'
url='https://bitbucket.org/wkjarosz/hdrview'
arch=('x86_64')
license=('BSD')
makedepends=('cmake' 'git')
sha256sums=('SKIP'
            '29450b60ca46062663ec603a0b68f8500cf882761654f756b81afb368845fdc5'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

source=('git+https://bitbucket.org/wkjarosz/hdrview.git' 
        'hdrview-git.patch'
        'git+https://github.com/cxong/tinydir.git'
        'git+https://github.com/docopt/docopt.cpp.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/syoyo/tinydngloader.git'
        'git+https://github.com/mitsuba-renderer/openexr.git'
        'git+https://github.com/mitsuba-renderer/zlib.git'
        'git+https://github.com/wjakob/nanogui.git')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}

    # Apply patch to make sure missing icons paths aren't used
    patch --forward --strip=1 --input=${srcdir}/hdrview-git.patch

    # Set up submodules as per the wiki's guidelines here:
    # https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules
    git submodule init
    git config --local submodule.ext/tinydir.url ${srcdir}/tinydir
    git config --local submodule.ext/docopt.url ${srcdir}/docopt.cpp
    git config --local submodule.ext/spdlog.url ${srcdir}/spdlog
    git config --local submodule.ext/openexr.url ${srcdir}/openexr
    git config --local submodule.ext/zlib.url ${srcdir}/zlib
    git config --local submodule.ext/nanogui.url ${srcdir}/nanogui

    # Initialize submodules' recursive submodules
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
