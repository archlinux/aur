# Maintainer: Marti Raudsepp <marti@juffo.org>
# Co-Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=ego
pkgver=1.1.6
pkgrel=1
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('ed81f4d558d586331d514b9daf8283896acb30f26f2eb2e4df310e50db6374127692f0418c9f865c9b914cac6b2c71df8028c456dea70b78985dfa05533f394d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --root "$pkgdir/usr/" --path .
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"

  install -Dm644 "varia/ego.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ego.conf"
  install -dm750                    "$pkgdir/etc/sudoers.d"
  install -m644 "varia/ego.sudoers" "$pkgdir/etc/sudoers.d/50_ego"
  install -dm750                  "$pkgdir/usr/share/polkit-1/rules.d"
  install -m644 "varia/ego.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-ego.rules"

  install -Dm644 "varia/ego-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ego"
  install -Dm644 "varia/ego-completion.bash"  "$pkgdir/usr/share/bash-completion/completions/ego"
  install -Dm644 "varia/ego-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ego.fish"
}
