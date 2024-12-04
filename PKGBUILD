# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=static-web-server
pkgver=2.34.0
pkgrel=1
pkgdesc="A cross-platform, high-performance and asynchronous web server for static files-serving"
arch=('i686' 'x86_64')
url="https://static-web-server.net/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
backup=('etc/default/static-web-server')
options=('!lto')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/static-web-server/static-web-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0b6ef64f68445c98f1ffd22265d5675e64157e572431fa4fd362970199d0b5e')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "systemd/etc_default_static-web-server" "$pkgdir/etc/default/static-web-server"
  install -Dm644 systemd/static-web-server.{service,socket} -t "$pkgdir/usr/lib/systemd/system"

  "$pkgdir/usr/bin/static-web-server" generate "$srcdir"
  install -Dm644 "$srcdir/completions/static-web-server.bash" "$pkgdir/usr/share/bash-completion/completions/static-web-server"
  install -Dm644 "$srcdir/completions/static-web-server.elv" -t "$pkgdir/usr/share/elvish/lib"
  install -Dm644 "$srcdir/completions/static-web-server.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 "$srcdir/completions/_static-web-server" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 "$srcdir/man"/static-web-server{,-generate}.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/static-web-server"
}
