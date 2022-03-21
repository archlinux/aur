# Maintainer: Ryan Schroeder <me at rk1024 dot net>

pkgname='empress'
pkgver='1.6.0+beta.2'
_semver="${pkgver/+/-}"
pkgrel=1
pkgdesc='A D-Bus MPRIS daemon for controlling media players.'
arch=('i686' 'x86_64')
url='https://github.com/ray-kast/empress'
license=('AGPL-3.0-or-later')
makedepends=('git' 'cargo')
provides=('empress')
conflicts=('empress')
source=("$pkgname-$_semver.tar.gz::$url/archive/v$_semver.tar.gz")
sha256sums=('1fcd6b3a8b88ff7399e25ebaf450da55f4cfa824657504be17577cd30f85268d')

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
}

package() {
  cd "$pkgname-$_semver"
  install -Dm755 target/release/empress -t "$pkgdir/usr/bin/"
  install -Dm644 target/empress.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 target/net.ryan_s.Empress1.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/empress/LICENSE-AGPL"
}

