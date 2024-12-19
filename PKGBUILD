# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.46.1
pkgrel=2
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
             'hyprwayland-scanner'
             'ninja'
             'python'
             'wayland-protocols')
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm'
            'uwsm: to launch a systemd based session via hyprland-uwsm.desktop')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_hyprland-protocols::git+https://github.com/hyprwm/hyprland-protocols.git"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git"
        '0001-fix-8759.patch')
sha256sums=('07ab3bea6531101ecc3851cf29ea11150c1524e67556c59fa2fb0c217cdad702'
            'SKIP'
            'SKIP'
            'fb2e59ffe92438b059b14e89dfa7893b32b4cb5c04a69fb8b84d70c2ada4f274')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule deinit subprojects/tracy
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/${pkgname}_hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update

  # https://github.com/hyprwm/Hyprland/issues/8759
  patch -p1 < "$srcdir/0001-fix-8759.patch"
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
