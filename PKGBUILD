# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
# Based on the river package of Arch Linux (Daurnimator, Andrea Feletto).

pkgname=river-fx
pkgver=0.5.2.fx3
pkgrel=1
pkgdesc='river (non-monolithic Wayland compositor) drawn with SceneFX: opacity, rounded corners, blur and shadows for window managers'
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/river-fx"
license=('0BSD' 'CC-BY-SA-4.0' 'GPL-3.0-only' 'MIT')
depends=(
    'glibc'
    'libevdev'
    'libinput'
    'libxkbcommon'
    'pixman'
    'scenefx'
    'wayland'
    'wlroots0.20'
    'xorg-xwayland'
)
makedepends=(
    'scdoc'
    'wayland-protocols'
    'zig'
)
# It is river, with one more protocol: it installs the same files.
provides=("river=${pkgver%.fx*}")
conflicts=('river' 'river-classic')

# From build.zig.zon
_zig_deps=(
  pixman-0.3.0-LClMnz2VAAAs7QSCGwLimV5VUYx0JFnX5xWU6HwtMuDX.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz
  wayland-0.7.0-lQa1kuP8AQD5dW7_o-VKLVD_QbqXe7Zob78r2su7Pyex.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.7.0.tar.gz
  wlroots-0.20.3-jmOlcsh0BACce9rpfvzUI4V3AalGg9GE0QQkvRFoHo1c.tar.gz::https://codeberg.org/ifreund/zig-wlroots/archive/v0.20.3.tar.gz
  xkbcommon-0.5.0-VDqIe8y3AgDU-cGL02xZplwABH3WbpTimrrgbgTgD_3g.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.5.0.tar.gz
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"

    # From Arch's river: translate-c does not find the libraries of the
    # headers it includes
    translate_c_libpath.patch

    "${_zig_deps[@]}"
)
noextract=("${_zig_deps[@]%%::*}")
sha256sums=('e638839a08a16e12d6bebf46ac3568b82988c60d6d8f9ebf9a35fa44d80bf7c9'
            'b2f4c707c8692a0821081abd20372d95b06a8be4d6cf93e4021b3492454546d8'
            '4b0b57ce37f7bb3a2c2fc76eec93d060830d2c92155bf2a6baa43d61ad05499e'
            '6eb33184b52f4b8f834c90f539dfb2fc0ec7ce5931896fadb4c3eab720b8c9b8'
            'd87f720c7a979ad45af7a2006f932d22b03c1d48996f67453e4fca7e308be02d'
            'c8fe98ed77d92d6ea8aa56017ee1da9bb504a4e1419bc382d0f9fb0bcc39221f')

_zig_flags=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --system ../zig-packages
    --build-id=sha1
    -Dcpu=baseline
    -Dpie
    -Doptimize=ReleaseSafe
    -Dxwayland
)

prepare() {
  for file in "${_zig_deps[@]%%::*}"; do
    mkdir -p "zig-packages/${file%%.tar.gz}"
    tar -f "$file" -C "zig-packages/${file%%.tar.gz}" -x --strip-components=1
  done

  cd "$pkgname-$pkgver"
  patch -p1 < ../translate_c_libpath.patch
}

build() {
  cd "$pkgname-$pkgver"
  DESTDIR="out" zig build "${_zig_flags[@]}" -Dversion-string="$pkgver"
}

check() {
  cd "$pkgname-$pkgver"
  zig build test "${_zig_flags[@]}"
}

package() {
  cd "$pkgname-$pkgver"

  cp -a out/* "$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSES/{0BSD.txt,MIT.txt}
}
