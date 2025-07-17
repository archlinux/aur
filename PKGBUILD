# Maintainer: June Schroeder <me at june dash s dot net>

pkgname='empress'
pkgver='3.0.3'
_semver='3.0.3'
pkgrel=1
pkgdesc='A D-Bus MPRIS daemon for controlling media players.'
arch=('i686' 'x86_64')
url='https://github.com/ray-kast/empress'
license=('AGPL-3.0-or-later')
makedepends=('git' 'cargo' 'jq' 'grep')
provides=('empress')
conflicts=('empress')
source=("$pkgname-$_semver.tar.gz::$url/archive/v$_semver.tar.gz")
sha256sums=('802190ae683485ed367d55233b9e96eb53dbc4fb1a17977fa891de8e4d0ad659')

prepare() {
  cd "$pkgname-$_semver"
  # If you're reading this: uncomment below to run the server with the log level
  # set to TRACE:
  # sed -i 's:/path/to/empress server:\0 -vvv:' etc/{club.bnuy.Empress,empress}.service.in
}

build() {
  cd "$pkgname-$_semver"
  cargo build --release --locked
  cargo build-man -z
  scripts/install-services.sh -n /usr/bin/empress
}

check() {
  cd "$pkgname-$_semver"
  cargo test --release --locked

  binver="$(cargo metadata --format-version=1 --no-deps --manifest-path Cargo.toml \
    | jq -r '.packages[] | select(.name == "empress") | .version')"

  if [[ "$_semver" != "$binver" ]]; then
    echo "Binary version is $binver (expected $_semver)" >&2
    exit -1
  fi
}

package() {
  cd "$pkgname-$_semver"
  install -Dm755 target/release/empress -t "$pkgdir/usr/bin/"
  install -Dm644 target/empress.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 target/club.bnuy.Empress.service -t "$pkgdir/usr/share/dbus-1/services/"
  for section in man/man?; do
    install -Dm644 "$section"/* -t "$pkgdir/usr/share/man/man${section##man/man}"
  done
}

# vim:set ft=sh:
