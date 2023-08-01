# Maintainer: Ryan Schroeder <me at rk1024 dot net>

pkgname='empress'
pkgver='2.0.0'
_semver='2.0.0'
pkgrel=1
pkgdesc='A D-Bus MPRIS daemon for controlling media players.'
arch=('i686' 'x86_64')
url='https://github.com/ray-kast/empress'
license=('AGPL3')
makedepends=('git' 'cargo' 'jq' 'grep')
provides=('empress')
conflicts=('empress')
source=("$pkgname-$_semver.tar.gz::$url/archive/v$_semver.tar.gz")
sha256sums=('bb0189cf2482f0a60a29ac915e59c8133ef1c4bc1cd165419bc0b756fa7a9932')

prepare() {
  cd "$pkgname-$_semver"
}

build() {
  cd "$pkgname-$_semver"
  cargo build --release --locked
  scripts/install-services.sh -n /usr/bin/empress
}

check() {
  cd "$pkgname-$_semver"
  cargo test --release --locked

  binver="$(cargo metadata --format-version=1 --no-deps --manifest-path Cargo.toml | jq -r '.packages[] | select(.name == "empress") | .version')"
  if [[ "$_semver" != "$binver" ]]; then
    echo "Binary version is $binver (expected $_semver)" >&2
    exit -1
  fi
}

package() {
  cd "$pkgname-$_semver"
  install -Dm755 target/release/empress -t "$pkgdir/usr/bin/"
  install -Dm644 target/empress.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 target/net.ryan_s.Empress2.service -t "$pkgdir/usr/share/dbus-1/services/"
}

