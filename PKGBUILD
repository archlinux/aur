# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.44.1
pkgrel=1
pkgdesc="An independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks. (w/o XWayland support)"
arch=('x86_64')
url='https://github.com/hyprwm/Hyprland'
license=('BSD-3-Clause')
groups=()
depends=('aquamarine'
         'cairo'
         'gcc-libs'
         'glib2'
         'glibc'
         'hyprcursor'
         'hyprlang'
         'hyprutils'
         'libdrm'
         'libglvnd'
         'libinput'
         'libxcursor'
         'libxkbcommon'
         'mesa'
         'pango'
         'pixman'
         'util-linux-libs'
         'wayland')
makedepends=('cmake'
             'git'
             'hyprwayland-scanner'
             'ninja'
             'python'
             'wayland-protocols')
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_hyprland-protocols::git+https://github.com/hyprwm/hyprland-protocols.git"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git")
sha256sums=('746326d0b1fff34e455250179e81556a93973b7ac76a0bcabc039009c9573d0e'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule deinit subprojects/tracy
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
