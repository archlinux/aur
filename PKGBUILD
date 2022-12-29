# Maintainer: Chi_Tang <chitang@duck.com>
pkgname='nekoray-git'
pkgver=2.9
pkgrel=1
pkgdesc='Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)'
arch=('x86_64')
url='https://matsuridayo.github.io'
license=('GPL')
makedepends=('cmake' 'git' 'ninja' 'go')
depends=(
 'qt5-base' 'qt5-svg' 'qt5-tools' 'qt5-x11extras'
 'protobuf' 'yaml-cpp'
)

optdepends=(
    'v2ray-domain-list-community: geosite data for NekoRay'
    'v2ray-geoip: geoip data for NekoRay'
    # AUR
    'sing-geoip: geoip data for NekoBox'
    'sing-geosite: geosite data for NekoBox'
)

source=(
    'git+https://github.com/MatsuriDayo/nekoray.git'
    'nekoray.desktop'
)
sha512sums=('SKIP' 'c8ad5a0cf5d813e1e35b827f92d526c022d529d34dd4019066b550c8f0dbdb89b0fb62e6bfc650e8c18acac826591e858eff3b2e5e6c6f5014f0f4b50f1fa88b')

pkgver() {
	cd "${srcdir}/nekoray"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"
    cd "${srcdir}/nekoray"
   	git submodule init
   	git submodule update
    bash libs/get_source.sh
    NKR_PACKAGE=1 bash libs/build_deps_all.sh
    mkdir build
    cd build
    cmake -GNinja -DQT_VERSION_MAJOR=5 -DNKR_PACKAGE=ON ..
    ninja
    cd "${srcdir}/nekoray"
    GOOS=linux GOARCH=amd64 ./libs/build_go.sh
}

package() {
    mkdir -p "${pkgdir}/usr/lib/nekoray"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/share/applications"
    # assets
    cp "${srcdir}/nekoray.desktop" "${pkgdir}/usr/share/applications/nekoray.desktop"
    cp -a "${srcdir}/nekoray/res/public/nekoray.png" "${pkgdir}/usr/lib/nekoray/"
    cp -a "${srcdir}/nekoray/res/public/nekobox.png" "${pkgdir}/usr/lib/nekoray/"
    ln -s "/usr/lib/nekoray/nekoray.png" "${pkgdir}/usr/share/pixmaps/nekoray.png"
    ln -s "/usr/lib/nekoray/nekobox.png" "${pkgdir}/usr/share/pixmaps/nekobox.png"
    # core
    cp -a "${srcdir}/nekoray/deployment/linux64/nekoray_core" "${pkgdir}/usr/lib/nekoray/"
    cp -a "${srcdir}/nekoray/deployment/linux64/nekobox_core" "${pkgdir}/usr/lib/nekoray/"
    # app
    cp -a "${srcdir}/nekoray/build/nekoray" "${pkgdir}/usr/lib/nekoray/"
    ln -s  "/usr/lib/nekoray/nekoray" "${pkgdir}/usr/bin/nekoray"
}
