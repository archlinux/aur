# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Co-Maintainer: Frank Tao <frank.tao@uwaterloo.ca>
pkgname=wayfire-wlroots-017-git
pkgver=0.8.0.r36.g4b7668b1
pkgrel=1
pkgdesc="3D wayland compositor, tracking wlroots 0.17, integrating the wlroots hidpi-xprop patch set"
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=('MIT')
depends=('cairo' 'pango' 'doctest' 'freetype2' 'glm' 'nlohmann-json'
         'libdrm' 'libevdev' 'libglvnd' 'libinput' 'libjpeg'
         'libpng' 'libxkbcommon' 'libxml2' 'pixman' 'polkit'
         'pkgconf' 'seatd' 'xcb-util-errors' 'xcb-util-renderutil'
         'xcb-util-wm' 'xorg-xwayland' 'wayland' 'wayland-protocols')
makedepends=('git' 'glslang' 'meson' 'ninja' 'cmake' 'vulkan-headers')
optdepends=('xorg-xeyes'
            'xorg-xwayland-hidpi-xprop: High DPI scaling of Xwayland applications')
provides=('wayfire' 'wayfire-git' 'wlroots=0.17' 'wlroots-hidpi-xprop-git' 'wf-config' 'wlroots-git' 'wf-config-git' 'libwlroots.so')
conflicts=("$pkgname" 'wlroots-git' 'wlroots' 'wf-config-git' 'wf-config')
replaces=()
options=()

source=('git+https://github.com/WayfireWM/wayfire#branch=track-wlroots'
        'https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4432.patch'
        '0001-xwayland-support-HiDPI-scale.patch'
        '0002-Fix-configure_notify-event.patch'
        '0003-Fix-size-hints-under-Xwayland-scaling.patch')
sha256sums=('SKIP'
            '3b087b933c15258ea722ac17b366949ef9dd6ca9cf991a3ca58ffe61012d77bd'
            'ec59d48108595c06537a5a1daae6f124cac5a783025e03417cb2c1b052b321d0'
            '1314d0ee63a4249698791d86cce5e6cdb4f005b81bbb1c6a747578d2a9223795'
            'c08dd62a1786eeb7506f1839bfcbba791502360392c929e620244f70c8ca5b61')

pkgver() {
	cd "$srcdir/wayfire"
  tag=$(git tag -l | awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -n|tail -n1)
  printf "$tag.r%s.g%s" "$(git rev-list --count v${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/wayfire/"
    git submodule update --init --recursive
    cd "$srcdir/wayfire/subprojects/wlroots/"
    git revert -n 18595000f3a21502fd60bf213122859cc348f9af
    git apply "$srcdir/4432.patch"
    patch -Np1 -i "$srcdir/0001-xwayland-support-HiDPI-scale.patch"
    patch -Np1 -i "$srcdir/0002-Fix-configure_notify-event.patch"
    patch -Np1 -i "$srcdir/0003-Fix-size-hints-under-Xwayland-scaling.patch"
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
        -Dprint_trace=false \
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
