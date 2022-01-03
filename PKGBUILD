# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Co-Maintainer: Frank Tao <frank.tao@uwaterloo.ca>
pkgname=wayfire-git
pkgver=0.7.2.r20220103.0a921f7
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=('MIT')
depends=('cairo' 'pango' 'freetype2' 'glm' 'libdrm' 'libevdev' 'libglvnd' 'libinput' 'libjpeg' 'libpng' 'libxkbcommon' 'libxml2' 'pixman' 'polkit' 'pkgconf' 'seatd' 'wayland' 'wayland-protocols')
makedepends=('git' 'meson' 'ninja' 'cmake')
optdepends=('xorg-xwayland' 'xorg-xeyes')
provides=("${pkgname%-git}" 'wlroots-git' 'wf-config-git')
conflicts=("$pkgname" 'wlroots-git' 'wlroots' 'wf-config-git' 'wf-config')
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wayfire')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/wayfire"
    git tag -l | awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -n|tail -n1
}

build() {
    cd "$srcdir/wayfire/"
    arch-meson \
        --buildtype=release \
        -Dxwayland=auto \
        -Duse_system_wlroots=disabled \
        -Duse_system_wfconfig=disabled \
        -Db_lto=true \
        -Db_pie=true \
        build
    ninja -C build
    sed "/WF_SRC_DIR/d" -i build/config.h
}


package() {
    cd "$srcdir/wayfire"
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop 
    cp wayfire.ini $pkgdir/usr/share
}
