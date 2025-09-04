# Maintainer: zaps166 <mumei6102@gmail.com>

_reponame=qdre

pkgbase=qdre
pkgname=(
    qdre-core-git
    qdre-gui-git
    qdre-compositor-git
    qdre-compositor-autostart
    qdre-desktop-git
    qdre-viewer-git
)
pkgver=0.0.0.r105.ca63c24
pkgrel=1
arch=('x86_64')
groups=('qdre')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
makedepends=('ninja' 'clang' 'llvm' 'lld' 'git' 'pkgconf' 'qt6-tools' 'cmake' 'fakeroot')
source=("git+https://gitlab.com/zaps166/$_reponame.git#branch=master"
        "qdre-compositor.desktop")
sha256sums=(SKIP
            17f77a274e94217d0e7b2712580b0e19569f61b3b9d67e8eb890ed80763ae39c)
options=(!lto) # It's handled in CMakeLists.txt

prepare() {
    mkdir -p build
}

pkgver() {
    cd $_reponame
    echo -n "0.0.0.r$(git rev-list --all --count).$(git rev-parse --short HEAD)"
}

build() {
    cmake -S $_reponame -B build \
        -GNinja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTS=OFF \
        -DGIO_X11_STARTUP_INFO=OFF \
        -DAPPS_QDRE_Desktop=ON \
        -DAPPS_QDRE_Viewer=ON \
        -DAPPS_QDRE_Compositor=ON \
        -DADDITIONS_QDRE_Applets=OFF \
        -DCMAKE_BUILD_TYPE=Release
    time ninja -C build
}

# check() {
#     ctest --test-dir build -V
# }

package_qdre-core-git() {
    depends=('qt6-base' 'glib2')
    DESTDIR="${pkgdir}" ninja -C build qdre-common-core/install
    DESTDIR="${pkgdir}" ninja -C build qdre-gio-core/install
}

package_qdre-gui-git() {
    depends=('qdre-core-git' 'exiv2')
    DESTDIR="${pkgdir}" ninja -C build qdre-common-gui/install
    DESTDIR="${pkgdir}" ninja -C build qdre-gio-gui/install
}

package_qdre-compositor-git() {
    pkgdesc='Lightweight X11 compositor with dconf settings'
    depends=('qdre-core-git' 'libxcb')
    optdepends=('xfwm4-z166: silences a lot of error logs')
    DESTDIR="${pkgdir}" ninja -C build qdre-compositor/install
    DESTDIR="${pkgdir}" ninja -C build qdre-x11-helpers/install
}
package_qdre-compositor-autostart() {
    pkgdesc='Autostart for QDRE Compositor'
    depends=('qdre-compositor-git')
    install -D -m 644 "${srcdir}/qdre-compositor.desktop" "${pkgdir}/etc/xdg/autostart/qdre-compositor.desktop"
}

package_qdre-desktop-git() {
    pkgdesc='Lightweight X11 and Wayland desktop with wallpaper and icons in grid layout'
    depends=('qdre-gui-git' 'layer-shell-qt')
    optdepends=('xfce4-terminal: default terminal'
                'engrampa: archive support'
                'zensu: run as administrator')
    install='qdre-desktop.install'
    DESTDIR="${pkgdir}" ninja -C build qdre-desktop/install
    DESTDIR="${pkgdir}" ninja -C build qdre-io-extensions/install
}

package_qdre-viewer-git() {
    pkgdesc='Lightweight image viewer'
    depends=('qdre-gui-git' 'exiv2')
    optdepends=('qt6-imageformats: more image formats'
                'kimageformats: more image formats')
    DESTDIR="${pkgdir}" ninja -C build qdre-viewer/install
}
