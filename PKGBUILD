# Maintainer: Marti Raudsepp <marti@juffo.org>
# Co-Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# shellcheck disable=SC2164,SC2034

pkgname=ego
pkgver=1.2.0
pkgrel=1
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl' 'libxcb')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('50664bdc437cdb169891bdaf6af9114b1d85a95449463b96f20a9634d358d624cba644b070697062ac075eae3474c49b704e96d9784f94d38383fccdfd1380df')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Test test_check_user_homedir fails in RUA sandbox
  cargo test --frozen --release --all-features -- --skip=test_check_user_homedir
}

package() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"

  install -Dm644 "varia/ego.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ego.conf"
  install -Dm644 "varia/ego.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/ego.conf"
  install -dm750                    "$pkgdir/etc/sudoers.d"
  install -m644 "varia/ego.sudoers" "$pkgdir/etc/sudoers.d/50_ego"
  install -dm755                  "$pkgdir/usr/share/polkit-1/rules.d"
  install -m644 "varia/ego.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-ego.rules"

  install -Dm644 "varia/ego-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ego"
  install -Dm644 "varia/ego-completion.bash" "$pkgdir/usr/share/bash-completion/completions/ego"
  install -Dm644 "varia/ego-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ego.fish"
}
