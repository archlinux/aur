# Maintainer: AtefR

pkgname=fish-session-git
_pkgname=fish-session
pkgver=0.1.4.r0.g77d3e4e
pkgrel=3
pkgdesc='UI-first session manager for Fish shell with persistent PTY sessions (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/AtefR/fish-session'
license=('LicenseRef-Unlicensed')
depends=('fish')
makedepends=('cargo' 'rust' 'git')
provides=('fish-session')
conflicts=('fish-session')
source=("$_pkgname::git+https://github.com/AtefR/fish-session.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local described
  described=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null) || \
    described="v0.0.0-0-g$(git rev-parse --short=7 HEAD)"
  described=${described#v}
  printf '%s\n' "$described" | sed 's/-/.r/; s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "$srcdir/target/release/fish-session" "$pkgdir/usr/bin/fish-session"
  install -Dm755 "$srcdir/target/release/fish-sessiond" "$pkgdir/usr/bin/fish-sessiond"

  install -Dm644 "functions/fish_session.fish" \
    "$pkgdir/usr/share/fish/vendor_functions.d/fish_session.fish"
  install -Dm644 "conf.d/fish-session.fish" \
    "$pkgdir/usr/share/fish/vendor_conf.d/fish-session.fish"

  printf 'Unlicensed\n' > "$srcdir/LICENSE"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
