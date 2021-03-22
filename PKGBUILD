# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=ego
pkgver=1.1.1
pkgrel=1
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('ccb62a3933d10426c11e560268da7d07ed7fc573c147d4a5cfe590b11b426f1efe8e4b17ac9a523b411105a0ff1c3d915dc3c0a4e208444aa5fdc8a19f3c57f7')

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
