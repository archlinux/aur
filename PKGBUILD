# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Frank Tao <frank.tao@uwaterloo.ca>
_wlrootsver=0.18
pkgname=wayfire-hidpi-xprop-animation-track-wlroots-git
pkgver=0.9.0.r42.g8d6c5f52
pkgrel=1
pkgdesc="3D wayland compositor, integrating the wlroots hidpi-xprop patch set, currently tracking wlroots 0.18. Follows soreau\'s animation branch."
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=('MIT')
depends=('cairo' 'pango' 'doctest' 'freetype2' 'glm' 'nlohmann-json'
         'libdrm' 'libevdev' 'libglvnd' 'libinput' 'libjpeg'
         'libpng' 'libxkbcommon' 'libxml2' 'pixman' 'polkit'
         'pkgconf' 'seatd' 'xcb-util-errors' 'xcb-util-renderutil'
         'xcb-util-wm' 'xorg-xwayland' 'wayland' 'wayland-protocols'
         'libdisplay-info' 'wlroots-hidpi-xprop>=0.18'
         'wlroots-hidpi-xprop<0.19' 'wf-config-git')
makedepends=('git' 'glslang' 'meson' 'ninja' 'cmake' 'vulkan-headers' 'boost')
optdepends=('xorg-xeyes'
            'xorg-xwayland-hidpi-xprop: High DPI scaling of Xwayland applications')
provides=("wayfire=$pkgver" "wayfire-git=$pkgver" "wayfire-hidpi-xprop-track-wlroots-git=$pkgver" "${pkgname%-git}")
conflicts=('wayfire')
replaces=()
options=()

source=('git+https://github.com/soreau/wayfire'
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
    install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop
    cp wayfire.ini $pkgdir/usr/share
}
