# Maintainer: Aaron Blasko <blaskoazzolaaaron[at]gmail[dot]com>
# Contributor: Eddie02345 <Eddie02345@users.noreply.github.com>
_pkgname="seuil"
pkgname="$_pkgname-git"
pkgver=1.0.1.r3.gcd18317
pkgrel=1
pkgdesc="Pass Galaxy Buds audio between a Samsung phone and Linux over Samsung Continuity"
arch=('x86_64')
url="https://github.com/Eddie02345/seuil"
license=('GPL-3.0-or-later')
depends=('bluez' 'bluez-utils' 'bluez-deprecated-tools' 'dbus' 'pipewire' 'pipewire-pulse' 'libpulse' 'playerctl')
makedepends=('cargo' 'git' 'rust')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname" "$_pkgname-bin")

source=("$_pkgname::git+$url.git" seuil.service)
sha256sums=('SKIP' 'c6dafe60aa18090696237eb0881a7e9cec27bf37c329ba3639f57b5a158cb08c')

pkgver() {
  cd "$_pkgname"
  local _tag=$(git tag -l --contains $(git describe --tags --abbrev=0) --sort=-v:refname | head -n1 | sed 's/^v//')
  printf "%s.r%s.g%s" "$_tag" $(git rev-list --count --cherry-pick "v${_tag}...HEAD") $(git rev-parse --short=7 HEAD)
}

build() {
  cd "$_pkgname/daemon"
  # Rust does not consume CFLAGS/LDFLAGS. makepkg's -flto=auto link flag breaks
  # ring's pregenerated assembly objects, so clear the C build environment.
  CFLAGS="" CXXFLAGS="" LDFLAGS="" RUSTFLAGS="" \
    cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 daemon/target/release/seuil "$pkgdir/usr/bin/seuil"
  install -Dm644 "$startdir/seuil.service" "$pkgdir/usr/lib/systemd/user/seuil.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/PROTOCOL_SPEC.md "$pkgdir/usr/share/doc/$pkgname/PROTOCOL_SPEC.md"
}
