# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.56.2
pkgrel=2
pkgdesc="An independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks. (w/o XWayland support)"
arch=('x86_64')
url='https://github.com/hyprwm/Hyprland'
license=('BSD-3-Clause')
groups=()
depends=('aquamarine'
         'cairo'
         'glib2'
         'glibc'
         'glslang'
         'hyprcursor'
         'hyprgraphics'
         'hyprland-guiutils'
         'hyprlang'
         'hyprutils'
         'hyprwire'
         'lcms2'
         'libdrm'
         'libei'
         'libgcc'
         'libglvnd'
         'libinput'
         'libstdc++'
         'libxcursor'
         'libxkbcommon'
         'lua'
         'mesa'
         'muparser'
         'pango'
         'pixman'
         're2'
         'readline'
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
            'xdg-desktop-portal-hyprland: xdg-desktop-portal backend for hyprland')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git"
        '91f29f23bb691462f8aa6171b964069aebc37910.patch')
sha256sums=('ea03f0db7d00093c41d1ffcedf116ab3e0ae51e23a8672d03f88c1e7f1b05da2'
            'SKIP'
            'c2106bb51bc3bfa46168070336df36f5104edf5e9e0b7f7ffb7f3d153c43ba34')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule deinit subprojects/tracy
  git submodule deinit subprojects/hyprland-protocols
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update

  git apply "$srcdir/91f29f23bb691462f8aa6171b964069aebc37910.patch"
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=ON -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=ON -D BUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
