# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=static-web-server-git
pkgver=2.33.0.r2.g30a6409
pkgrel=1
pkgdesc="A cross-platform, high-performance and asynchronous web server for static files-serving"
arch=('i686' 'x86_64')
url="https://static-web-server.net/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cargo')
provides=("static-web-server=$pkgver")
conflicts=('static-web-server')
backup=('etc/default/static-web-server')
options=('!lto')
source=("git+https://github.com/static-web-server/static-web-server.git")
sha256sums=('SKIP')


prepare() {
  cd "static-web-server"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "static-web-server"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "static-web-server"

  #cargo test \
  #  --frozen
}

package() {
  cd "static-web-server"

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
