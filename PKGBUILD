# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.40.0
pkgrel=2
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
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git"
        '0001-core-chase-hyprwayland-scanner.patch'
        '0001-patches-Add-wlroots-merge-request-to-support-liblift.patch')
sha256sums=('13a2f6da9afa5001bb745110d45d3a280a813ab5c9b838b0342cab461ff2ba7c'
            'SKIP'
            'SKIP'
            'SKIP'
            '7445eb076ae0aa13492ecf99097e93cf8940c83185a957a77fb063e7fbc92ac8'
            'e62c5b79ea37f0a69ba53b2537a21926c8efe126e1f63599dc6e6071cf3f0b1e')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule deinit subprojects/tracy
  git config submodule.subprojects/wlroots-hyprland.url "$srcdir/${pkgname}_wlroots-hyprland"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/${pkgname}_hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
  git -c protocol.file.allow=always submodule update
  patch -p1 -i "$srcdir/0001-core-chase-hyprwayland-scanner.patch"
  patch -p1 -i "$srcdir/0001-patches-Add-wlroots-merge-request-to-support-liblift.patch" -d "subprojects/wlroots-hyprland"
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=YES -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=true
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" MAKEFLAGS='-o installheaders' install
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
