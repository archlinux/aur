# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.41.2
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (w/o XWayland support)"
arch=('x86_64')
url='https://github.com/hyprwm/Hyprland'
license=('BSD-3-Clause')
groups=()
depends=('cairo'
         'gcc-libs'
         'glib2'
         'glibc'
         'hyprcursor'
         'hyprlang'
         'hyprutils'
         'libdisplay-info'
         'libdrm'
         'libglvnd'
         'libinput'
         'libliftoff'
         'libxkbcommon'
         'opengl-driver'
         'pango'
         'pixman'
         'seatd'
         'systemd-libs'
         'tomlplusplus'
         'util-linux-libs'
         'wayland')
makedepends=('cmake'
             'git'
             'hwdata'
             'hyprwayland-scanner'
             'meson'
             'ninja'
             'wayland-protocols')
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_wlroots-hyprland::git+https://github.com/hyprwm/wlroots-hyprland.git"
        "${pkgname}_hyprland-protocols::git+https://github.com/hyprwm/hyprland-protocols.git"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git")
sha256sums=('4e6e6b98c4f52be94b77cd0487552713ff0ddaa348b58e4d6e0ced56636f8606'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule deinit subprojects/tracy
  git config submodule.subprojects/wlroots-hyprland.url "$srcdir/${pkgname}_wlroots-hyprland"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/${pkgname}_hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=YES -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=true
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build --prefix "$pkgdir/usr"
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
