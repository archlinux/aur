# Maintainer: user827 <user827@users.noreply.github.com>

pkgname=trctl
pkgdesc="A transmission daemon CLI"
url="https://github.com/user827/trctl.git"
pkgver=2.7.10
pkgrel=1
arch=('any')
license=('Apache')
source=("$pkgname::git+$url#tag=v${pkgver}?signed")
optdepends=('s-nail')
makedepends=('mold')
sha256sums=(SKIP)
validpgpkeys=(D47AF080A89B17BA083053B68DFE60B7327D52D6) # user827
options=(strip)

backup=(
"etc/$pkgname/completed.toml"
)

_release=release

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  #force update for 'rustup' package users (not necessary for 'rust' package users)
  pacman -Qo $(which cargo) | grep -q rustup && rustup update
  cargo fetch --locked --target  "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  mold -run cargo build --profile "$_release" --target-dir target
}

check() {
  cd "$pkgname"
  mold -run cargo test
  mold -run cargo test --doc
}

package() {
  cd "$pkgname"
  install -D -m644 configs/sysusers.conf "$pkgdir"/usr/lib/sysusers.d/"$pkgname".conf
  install -D -m644 configs/trmv.desktop "$pkgdir"/usr/share/applications/trmv.desktop
  install -D -m644 configs/trmv-magnet.desktop "$pkgdir"/usr/share/applications/trmv-magnet.desktop
  install -D -m644 configs/bittorrent.png "$pkgdir"/usr/share/pixmaps/trmv.png

  local _builddir=release
  if [ "$_release" = dev ]; then
      _builddir=debug
  fi
  install -D -m755 target/"$_builddir"/trmv "$pkgdir"/usr/bin/trmv
  install -D -m755 target/"$_builddir"/trctl "$pkgdir"/usr/bin/trctl

  install -D -m755 scripts/logging.sh "$pkgdir"/usr/lib/"$pkgname"/logging.sh
  install -D -m755 scripts/move.sh "$pkgdir"/usr/lib/"$pkgname"/move.sh
  install -D -m755 scripts/completed.sh "$pkgdir"/usr/lib/"$pkgname"/completed.sh
  install -D -m644 scripts/completed.toml "$pkgdir"/etc/"$pkgname"/completed.toml
  mkdir -p "$pkgdir"/usr/share/zsh/site-functions/
  #target/release/trctl gen-completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_trctl
  #chmod 644 "$pkgdir"/usr/share/zsh/site-functions/_trctl
  install -D -m644 scripts/_trctl "$pkgdir"/usr/share/zsh/site-functions/_trctl
}
