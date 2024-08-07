# Maintainer: steelt <steeltitanium1 at gmail dot com>
_pkgname=Myxer
pkgname=myxer-git
pkgver=1.3.0.r0.gea53586
pkgrel=3
pkgdesc='A modern volume mixer for PulseAudio'
arch=('x86_64')
url='https://github.com/Aurailus/Myxer'
license=('GPL3')
depends=('gtk3' 'pulse-native-provider')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Aurailus/Myxer.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # https://github.com/VixenUtils/Myxer/pull/20
  cd "$_pkgname"
  sed -i '/^version = ""$/c version = "0.9.1"' Cargo.toml
}

build() {
  cd "$_pkgname"
  cargo build --locked --release
}

check() {
  cd "$_pkgname"
  cargo test --locked --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
