# Maintainer: Jake McGinty <jake@tonari.no>

pkgname=innernet-git
pkgver=v1.3.0.beta.3.r4.426916f
pkgrel=1
pkgdesc="A tool to manage WireGuard network topologies."
#epoch=0
arch=('x86_64')
url="https://github.com/tonarino/innernet"
license=('MIT')
depends=('sqlite')
conflicts=('innernet')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/tonarino/innernet")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^v[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  local pkgtag=$(echo "$tag" | tr '-' '.')
  echo "$pkgtag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "$pkgname"

  cargo build --release --locked
}

check() {
  cd "$pkgname"

  cargo test --release --locked
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/innernet" "$pkgdir/usr/bin/innernet"
  install -Dm755 "target/release/innernet-server" "$pkgdir/usr/bin/innernet-server"
  ln -s innernet "$pkgdir/usr/bin/inn"

  install -Dm644 "client/innernet@.service" "$pkgdir/usr/lib/systemd/system/innernet@.service"
  install -Dm644 "server/innernet-server@.service" "$pkgdir/usr/lib/systemd/system/innernet-server@.service"

  install -Dm644 "doc/innernet.8.gz" "$pkgdir/usr/share/man/man8/innernet.8.gz"
  install -Dm644 "doc/innernet-server.8.gz" "$pkgdir/usr/share/man/man8/innernet-server.8.gz"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

