# Maintainer: Marti Raudsepp <marti@juffo.org>
# Co-Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=ego
pkgver=1.1.7
pkgrel=2
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('48a6034fa6fe8d37aa17bc9b0e221de45faabfe9cc5fe27efeeb154ff9e83ad0803901ea98a17e9c66aff183d677cee5beb2c19c9695d9590c2f38139c1f5f77')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Test test_check_user_homedir fails in RUA sandbox
  cargo test --release --locked -- --skip=test_check_user_homedir
}

package() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --locked --root "$pkgdir/usr/" --path .
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"

  install -Dm644 "varia/ego.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ego.conf"
  install -Dm644 "varia/ego.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/ego.conf"
  install -dm750                    "$pkgdir/etc/sudoers.d"
  install -m644 "varia/ego.sudoers" "$pkgdir/etc/sudoers.d/50_ego"
  install -dm750                  "$pkgdir/usr/share/polkit-1/rules.d"
  install -m644 "varia/ego.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-ego.rules"

  install -Dm644 "varia/ego-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ego"
  install -Dm644 "varia/ego-completion.bash" "$pkgdir/usr/share/bash-completion/completions/ego"
  install -Dm644 "varia/ego-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ego.fish"
}
