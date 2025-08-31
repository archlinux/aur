# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Co-Maintainer: Frank Tao <frank.tao@uwaterloo.ca>
# Co-Maintainer: Christopher Snowhill <kode54@gmail.com>
_wfconfig_version=0.7
pkgname=wayfire-git
pkgver=0.10.0.r2.g41fc08d0
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=(MIT)
depends=(
         # Wayfire
         'cairo' 'pango' 'libdrm' 'libevdev'
         'libglvnd' 'libjpeg' 'libpng'
         'libxkbcommon' 'pixman' 'polkit'
         'seatd' 'xorg-xwayland' 'wayland'
         'yyjson' 'libinput'
         'glib2' 'systemd-libs' 'libxcb'

         # Linking Wayfire headers now requires this
         'glm'

         # wlroots
         'pkgconf' 'xcb-util-errors' 'xcb-util-renderutil'
         'xcb-util-wm' 'wayland' 'wayland-protocols'
         'libdisplay-info'
         'wlroots0.19'
)
makedepends=('git' 'meson' 'ninja' 'cmake' 'vulkan-headers' 'doctest'
             'pkgconf' 'wayland-protocols' 'libxml2'
)
optdepends=('xorg-xeyes')
provides=("${pkgname%-git}" 'wayland-compositor'
          "wf-config=${_wfconfig_version}" "wf-config-git=${_wfconfig_version}")
conflicts=("${pkgname%-git}" 'wf-config')
replaces=()
options=()

source=('git+https://github.com/WayfireWM/wayfire'
	'git+https://github.com/WayfireWM/wf-config'
        'git+https://github.com/WayfireWM/wf-touch'
        'git+https://github.com/WayfireWM/wf-utils')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/wayfire"
    tag=$(git tag -l | awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -V|tail -n1)
    printf "$tag.r%s.g%s" "$(git rev-list --count v${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/wayfire/"
    git submodule init
    git config submodule.subprojects/wlroots.update none
    git config submodule.subprojects/wf-config.url "$srcdir/wf-config"
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
        -Duse_system_wfconfig=disabled \
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
    # XXX I thought upstream fixed this???
    rm -f $pkgdir/usr/include/wayfire/nonstd/safe-list.hpp
    install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop
    cp wayfire.ini $pkgdir/usr/share
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
