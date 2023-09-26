# Maintainer: hariseldon78 <hariseldon78 at gmail dot com>

pkgname=hyprland-persistent-workspaces-git
pkgver=0.29.1.r129.4f061753
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (persistent workspaces)"
arch=(x86_64 aarch64)
url="https://github.com/hariseldon78/Hyprland"
license=(BSD)
depends=(cairo
         gcc-libs
         glib2
         glibc
         glslang
         libdisplay-info
         libdrm
         libglvnd
         libinput
         libliftoff
         libx11
         libxcb
         libxcomposite
         libxfixes
         libxkbcommon
         libxrender
         opengl-driver
         pango
         pixman
         pixman
         polkit
         seatd
         systemd-libs
         vulkan-icd-loader
         vulkan-validation-layers
         wayland
         wayland-protocols
         xcb-proto
         xcb-util
         xcb-util-errors
         xcb-util-keysyms
         xcb-util-renderutil
         xcb-util-wm
         xorg-xinput
         xorg-xwayland)
depends+=(libdisplay-info.so)
makedepends=(cmake
             gdb
             git
             meson
             ninja
             vulkan-headers
             xorgproto)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=("git+https://github.com/hariseldon78/Hyprland.git"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://github.com/hyprwm/hyprland-protocols.git"
        "git+https://github.com/canihavesomecoffee/udis86.git"
        "git+https://github.com/wolfpld/tracy.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pick_mr() {
  git pull origin pull/$1/head --no-edit
}

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.wlroots.url                        "$srcdir/wlroots"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url             "$srcdir/udis86"
  git config submodule.subprojects/tracy.url              "$srcdir/tracy"
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi

  # Pick pull requests from github using `pick_mr <pull request number>`.

  make fixwlr
  sed -i '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
  # respect build flags to allow full RELRO
  sed -i '/CXX/ s|)|) $(CXXFLAGS)|;/CXX/ s|$| $(LDFLAGS)|;' hyprctl/Makefile
}

pkgver() {
  git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd Hyprland
  pushd subprojects/wlroots
  meson build/ --prefix="$srcdir/tmpwlr" --buildtype=release -Dexamples=false
  ninja -C build/
  mkdir -p "$srcdir/tmpwlr"
  ninja -C build/ install
  popd
  pushd subprojects/udis86
  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G Ninja
  cmake --build ./build --config Release --target all
  popd
  make protocols
  make release
  pushd hyprctl
  make all
}

package() {
  cd Hyprland
  find src -name '*.hpp' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/{}" \;
  pushd subprojects/wlroots/include
  find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
  popd
  pushd subprojects/wlroots/build/include
  # fix $srcdir reference
  sed -i '/ICONDIR/ s|".*"|"/usr/share/icons"|' config.h
  find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
  popd
  mkdir -p "$pkgdir/usr/include/hyprland/protocols"
  cp protocols/*-protocol.h "$pkgdir/usr/include/hyprland/protocols"
  pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  popd
  install -Dm0644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
  install -Dm0755 -t "$pkgdir/usr/bin" build/Hyprland
  install -Dm0755 -t "$pkgdir/usr/bin" hyprctl/hyprctl
  install -Dm0644 -t "$pkgdir/usr/share/hyprland" assets/*.png
  install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions" "example/hyprland.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/hyprland" "example/hyprland.conf"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
  install -Dm0755 -t "$pkgdir/usr/lib" "$srcdir/tmpwlr/lib/libwlroots.so.12032"
}
# vi: et ts=2 sw=2
