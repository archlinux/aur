# Maintainer: Ryan Schroeder <me at rk1024 dot net>

pkgname='empress'
pkgver='1.6.0'
_semver="${pkgver/+/-}"
pkgrel=2
pkgdesc='A D-Bus MPRIS daemon for controlling media players.'
arch=('i686' 'x86_64')
url='https://github.com/ray-kast/empress'
license=('AGPL-3.0-or-later')
makedepends=('git' 'cargo')
provides=('empress')
conflicts=('empress')
source=("$pkgname-$_semver.tar.gz::$url/archive/v$_semver.tar.gz")
sha256sums=('baa2ccf9700b7fd3830b6b69d58eb31e7e5ccdeb82878de01fd9d25eac9ba422')

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

