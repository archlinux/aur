# Maintainer: Ryan Schroeder <me at rk1024 dot net>

pkgname='empress'
pkgver='1.2.0'
pkgrel=1
pkgdesc='A D-Bus MPRIS daemon for controlling media players.'
arch=('i686' 'x86_64')
url='https://github.com/ray-kast/empress'
license=('AGPL-3.0-or-later')
makedepends=('git' 'cargo')
provides=('empress')
conflicts=('empress')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d862bef0c13182dfb836b690e2e724feba66cf671ce0e5cff7b6a7da5133bf4b')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
  scripts/install-services.sh -n /usr/bin/empress
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/empress -t "$pkgdir/usr/bin/"
  install -Dm644 target/empress.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 target/net.ryan_s.Empress1.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/empress/LICENSE-AGPL"
}

