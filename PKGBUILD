# Maintainer: Michael Adler <therisen06@gmail.com>

_pkgname=notmuch-mailmover
pkgname=${_pkgname}-git
pkgver=v0.6.0.r9.g0f612d6
pkgrel=1
pkgdesc='notmuch-mailmover is a tool to move notmuch tagged mails into Maildir folders'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/michaeladler/notmuch-mailmover'
license=('Apache')
depends=('notmuch-runtime' 'lua')
makedepends=('git' 'cargo' 'pkgconf')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # man page
  install -Dm644 share/notmuch-mailmover.1.gz "$pkgdir/usr/share/man/man1/notmuch-mailmover.1.gz"

  # examples
  mkdir -p "$pkgdir/usr/share/doc/notmuch-mailmover"
  cp -d -R example "$pkgdir/usr/share/doc/notmuch-mailmover/"

  # shell completions
  install -Dm644 share/notmuch-mailmover.bash "$pkgdir/usr/share/bash-completion/completions/notmuch-mailmover"
  install -Dm644 share/_notmuch-mailmover "$pkgdir/usr/share/zsh/site-functions/_notmuch-mailmover"
  install -Dm644 share/notmuch-mailmover.fish "$pkgdir/usr/share/fish/vendor_completions.d/notmuch-mailmover.fish"
}
