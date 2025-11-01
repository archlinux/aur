# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=topgrade-git
pkgver=16.1.1.r5.g294a90a
pkgrel=1
pkgdesc="Upgrade all the things"
arch=('x86_64' 'aarch64')
url="https://topgrade-rs.github.io"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/topgrade-rs/topgrade.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  # Generate completions
  for shell in bash fish zsh; do
    ./"target/release/${pkgname%-git}" --gen-completion "${shell}" > "${pkgname%-git}.${shell}"
  done

  # Generate man page
  ./"target/release/${pkgname%-git}" --gen-manpage > "${pkgname%-git}.1"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "${pkgname%-git}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
  install -Dm644 config.example.toml -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
