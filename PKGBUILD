# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=fht-share-picker
pkgname="$_pkgname-git"
pkgver=r999ca73
pkgrel=1
pkgdesc='A Wayland XDG screencast output picker'
groups=('fht-desktop')
arch=('x86_64')
url="https://github.com/nferhat/$_pkgname"
license=('GPL-3.0-or-later')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=(
  'git'
  'cargo'
  'cairo'
  'pango'
  'graphene'
  'gdk-pixbuf2'
)
depends=(
  'gtk4'
  'glibc'
  'glib2'
  'gcc-libs'
  'libadwaita'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  echo "r$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
