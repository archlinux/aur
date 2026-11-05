# Maintainer: Qiumix <j487428862@gmail.com>
#
# Development build from the tip of the default branch. `pkgver()` derives the
# version from git, so this is rebuilt on every commit.

pkgname=niri-tracker-git
_pkgname=niri-tracker
pkgver=0.1.1.r9.g3e50a16
pkgrel=1
pkgdesc="Screen time tracking for the niri Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/Qiumix/niri-tracker"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git')
checkdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '%s.r%s.g%s' \
    "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Fetched here so the build phase needs no network. This is also what the
  # AUR expects: downloads happen in prepare/build, not in package.
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_PROFILE_RELEASE_STRIP=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --release --locked --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --locked --frozen
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 packaging/niri-tracker.service \
    "$pkgdir/usr/lib/systemd/user/niri-tracker.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/design.md "$pkgdir/usr/share/doc/$pkgname/design.md"
  install -Dm644 docs/protocol.md "$pkgdir/usr/share/doc/$pkgname/protocol.md"

  # The schema ships next to the binary so that `niri-tracker config init` can
  # write a `#:schema` line pointing at a path that really exists.
  install -d "$pkgdir/usr/share/niri-tracker"
  "$pkgdir/usr/bin/$_pkgname" schema > "$pkgdir/usr/share/niri-tracker/schema.json"

  # Completions are generated from the binary just installed, so they can never
  # describe a different set of flags than `--help` shows.
  install -d "$srcdir/completions"
  local shell
  for shell in bash zsh fish; do
    "$pkgdir/usr/bin/$_pkgname" completions "$shell" > "$srcdir/completions/$shell"
  done
  install -Dm644 "$srcdir/completions/bash" \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "$srcdir/completions/zsh" \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$srcdir/completions/fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
