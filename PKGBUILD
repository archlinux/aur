# Author: Foxe Chen <chen.foxe@gmail.com>
# Maintainer: Oleg Chernovskiy <kanedias@gmx.net>
pkgname=swayclip-git
_pkgname=swayclip
_github_owner='64-bitman'
_github_base="https://github.com/${_github_owner}"
pkgver=0.2.1.r11.gedce2e4
pkgrel=1
pkgdesc='Clipboard manager for Sway and other Wayland compositors'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('json-c' 'sqlite' 'wayland')
makedepends=('git' 'meson' 'pkgconf' 'python' 'scdoc' 'wayland')
provides=('swayclip')
conflicts=('swayclip')
source=(
  "git+${_github_base}/${_pkgname}.git"
  "git+${_github_base}/xstructs.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$_pkgname"
  rm -rf subprojects/xstructs
  cp -a "$srcdir/xstructs" subprojects/xstructs
}

build() {
  local meson_options=(
    --buildtype=plain
    --prefix=/usr
    --sysconfdir=/etc
    --wrap-mode=nodownload
    -Dman-pages=true
    -Dswctl=true
  )

  meson setup "${meson_options[@]}" build "$_pkgname"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
