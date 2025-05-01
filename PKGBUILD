# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Frank Tao <frank.tao@uwaterloo.ca>
_wlrootsver=0.18.2
pkgname=wayfire-hidpi-xprop-git
pkgver=0.9.0.r85.g33620c18
pkgrel=1
pkgdesc="3D wayland compositor, integrating the wlroots hidpi-xprop patch set"
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=('MIT')
depends=(
         # Wayfire
         'cairo' 'pango' 'libdrm' 'libevdev'
         'libglvnd' 'libjpeg' 'libpng'
         'libxkbcommon' 'pixman' 'polkit'
         'seatd' 'xorg-xwayland' 'wayland'
         'wf-config-git' 'yyjson' 'libinput'
         'glib2' 'systemd-libs' 'libxcb'

         # Linking Wayfire headers now requires this
         'glm'

         # wlroots
         'pkgconf' 'xcb-util-errors' 'xcb-util-renderutil'
         'xcb-util-wm' 'wayland' 'wayland-protocols'
         'libdisplay-info' 'wlroots-hidpi-xprop>=0.18'
         'wlroots-hidpi-xprop<0.19')
makedepends=('git' 'meson' 'ninja' 'cmake' 'vulkan-headers' 'doctest'
             'pkgconf' 'wayland-protocols' 'libxml2')
optdepends=('xorg-xeyes'
            'xorg-xwayland-hidpi-xprop: High DPI scaling of Xwayland applications')
provides=("wayfire=$pkgver" "wayfire-git=$pkgver" "${pkgname%-git}")
conflicts=('wayfire')
replaces=()
options=()

source=('git+https://github.com/WayfireWM/wayfire'
        'git+https://github.com/WayfireWM/wf-touch'
        'git+https://github.com/WayfireWM/wf-utils.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/wayfire"
  tag=$(git tag -l | awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -n|tail -n1)
  printf "$tag.r%s.g%s" "$(git rev-list --count v${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/wayfire/"
    git submodule init
    git config submodule.subprojects/wf-config.update none
    git config submodule.subprojects/wlroots.update none
    git config submodule.subprojects/wf-touch.url "$srcdir/wf-touch"
    git config submodule.subprojects/wf-utils.url "$srcdir/wf-utils"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/wayfire/"
    arch-meson \
        --buildtype=release \
        -Dxwayland=auto \
        -Duse_system_wlroots=enabled \
        -Duse_system_wfconfig=enabled \
        -Db_lto=true \
        -Db_pie=true \
        -Dprint_trace=false \
        build
    sed "/WF_SRC_DIR/d" -i build/config.h
    ninja -C build
}

package() {
    cd "$srcdir/wayfire"
    DESTDIR="$pkgdir/" ninja -C build install
    # XXX upstream should have fixed this by now
    rm -f $pkgdir/usr/include/wayfire/nonstd/safe-list.hpp
    install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop
    cp wayfire.ini $pkgdir/usr/share
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
