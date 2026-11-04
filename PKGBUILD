# Maintainer: prietus <prietus@live.com>
pkgname=aurgus-git
pkgver=0.1.0.r7.g4fff586
pkgrel=1
pkgdesc="AUR helper that audits PKGBUILDs before building them (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/aurgus"
license=('GPL-3.0-or-later')
depends=('pacman' 'git' 'coreutils')
makedepends=('cargo')
optdepends=('sudo: privilege elevation'
            'doas: privilege elevation'
            'gnupg: import PGP keys needed to verify sources')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  local v
  if v=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$v" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 completions/aurgus.bash "$pkgdir/usr/share/bash-completion/completions/aurgus"
  install -Dm644 completions/_aurgus "$pkgdir/usr/share/zsh/site-functions/_aurgus"
  install -Dm644 completions/aurgus.fish "$pkgdir/usr/share/fish/vendor_completions.d/aurgus.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
