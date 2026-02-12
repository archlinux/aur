# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.53.3
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
         'hyprcursor'
         'hyprgraphics'
         'hyprland-guiutils'
         'hyprlang'
         'hyprutils'
         'hyprwire'
         'libdrm'
         'libgcc'
         'libglvnd'
         'libinput'
         'libstdc++'
         'libxcursor'
         'libxkbcommon'
         'mesa'
         'muparser'
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
            'xdg-desktop-portal-hyprland: xdg-desktop-portal backend for hyprland')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git"
        "116537b494b84ef3aea241db657a8b4bdaf3da9d.patch")
sha256sums=('b1caafacddf9fa796cf54b33cb85f1d9cc36357dcc93b5cdf929851f1fe01a72'
            'SKIP'
            'e3b4874c8c88f4bef7b1f3182a031f27be50019774400ac02e80384b28e2d480')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule deinit subprojects/tracy
  git submodule deinit subprojects/hyprland-protocols
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update

  git apply "$srcdir/116537b494b84ef3aea241db657a8b4bdaf3da9d.patch"
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=ON -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=ON -D BUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
