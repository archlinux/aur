# Maintainer: Marco Ziliani (rylos)
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jesse Luehrs <archlinux@tozt.net>
#
# Fork rylos/rbw, branch `enhanced`: doy/rbw 1.15.0 + PRs #378 #359 #207 #323
# #376 #332 #388 + add/edit of every field, folders, trash, attachments and a
# persistent login with the API key. Based on the Arch extra/rbw PKGBUILD.

pkgname=rbw-enhanced
_pkgname=rbw
_commit=95237b4d3a1c60f95d71880189516b5dec4a62f6
pkgver=1.15.0.r48.g95237b4
pkgrel=1
pkgdesc='Unofficial Bitwarden client: TUI, full editing, howdy/fingerprint/PIN unlock, persistent login (rbw fork)'
arch=(x86_64)
url='https://github.com/rylos/rbw'
license=(MIT)
provides=("rbw=$pkgver")
conflicts=(rbw)
depends=(
  glibc
  libgcc
  pinentry
)
optdepends=(
  'libnotify: notification when the login expired'
  'polkit: unlock with system authentication (see /usr/share/doc/rbw-enhanced/polkit)'
  'howdy: face unlock through polkit'
  'fprintd: fingerprint unlock through polkit'
  'openssh: create ssh key items'
  'dotool: type credentials from rbw tui (or wtype, ydotool, xdotool)'
)
makedepends=(rust)
options=(!lto)
source=("$_pkgname-$_commit.tar.gz::https://github.com/rylos/rbw/archive/$_commit.tar.gz")
sha256sums=('7a3a8bdfa48ca00ae0b72a402bf023e37478005fcdf5562a2fec57c218a868e9')

# PORTABLE_CPU (e.g. x86-64-v3, set in ~/.config/pacman/makepkg.conf) replaces
# the native CPU flags of makepkg.conf, so one package runs on every machine
# of that level instead of only on the CPU it was built on.
_portable_flags() {
  local cpu=${PORTABLE_CPU:-}
  [[ -n $cpu ]] || return 0
  CFLAGS=${CFLAGS//-march=native/-march=$cpu}
  CFLAGS=${CFLAGS//-mtune=native/-mtune=generic}
  CXXFLAGS=${CXXFLAGS//-march=native/-march=$cpu}
  CXXFLAGS=${CXXFLAGS//-mtune=native/-mtune=generic}
  RUSTFLAGS=${RUSTFLAGS//target-cpu=native/target-cpu=$cpu}
  export CFLAGS CXXFLAGS RUSTFLAGS
}

prepare() {
  cd "$_pkgname-$_commit"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  _portable_flags
  cd "$_pkgname-$_commit"
  cargo build --frozen --release --all-features

  # generate shell auto-completions
  for completion in bash elvish fish nushell zsh; do
    cargo run --frozen --release --bin rbw -- \
      gen-completions "$completion" > "$completion-completions"
  done
}

check() {
  _portable_flags
  cd "$_pkgname-$_commit"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname-$_commit"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" target/release/rbw{,-agent}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md

  # polkit action for system authentication; the PAM side stays up to the
  # admin, see the guide next to it
  install -vDm644 -t "$pkgdir/usr/share/polkit-1/actions" contrib/polkit/net.rbw.unlock.policy
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/polkit" contrib/polkit/*

  # shell auto-completions
  install -vDm644 bash-completions "$pkgdir/usr/share/bash-completion/completions/rbw"
  install -vDm644 elvish-completions "$pkgdir/usr/share/elvish/lib/rbw.elv"
  install -vDm644 fish-completions "$pkgdir/usr/share/fish/vendor_completions.d/rbw.fish"
  install -vDm644 nushell-completions "$pkgdir/usr/share/nushell/vendor/autoload/rbw.nu"
  install -vDm644 zsh-completions "$pkgdir/usr/share/zsh/site-functions/_rbw"
}
