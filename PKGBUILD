# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=ego
pkgver=1.1.2
pkgrel=1
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('52e9be2de6158998e3fcc341837250ba9144d8bad078cf9a7f772b52ed56f3b8f23d1caea99e339948502718daa7bff429bb3ad21611030121286880dd1631fb')

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
