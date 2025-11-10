# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.52.1
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
         'hyprgraphics'
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
         're2'
         'tomlplusplus'
         'util-linux-libs'
         'wayland')
makedepends=('cmake'
             'git'
             'glaze'
             'hyprland-protocols'
             'hyprwayland-scanner'
             'ninja'
             'python'
             'wayland-protocols')
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'glaze: to build and install plugins using hyprpm'
            'hyprland-protocols: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm'
            'uwsm: to launch a systemd based session via hyprland-uwsm.desktop'
            'hyprland-guiutils: Hyprland might invoke this to show some dialogs and popups if available')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git")
sha256sums=('1b192a63fac88d713110d6f3226a01746224a9750e091c86de2bfc4e8188455d'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule deinit subprojects/tracy
  git submodule deinit subprojects/hyprland-protocols
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=ON -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=ON -D BUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build --prefix "$pkgdir/usr"
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
