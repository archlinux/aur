# Maintainer: Jason Pena <jasonpena@awkless.com>
# Contributor: Jason Pena <jasonpena@awkless.com>

: "${CARGO_HOME:=$SRCDEST/cargo-home}"
: "${CARGO_TARGET_DIR:=target}"
: "${RUSTUP_TOOLCHAIN:=stable}"
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

pkgname="ocd-git"
pkgver="0.8.0"
pkgrel=1
pkgdesc="Organize current dotfiles"
url="https://github.com/awkless/ocd"
arch=('x86_64')
license=("MIT")

depends=(
  'gcc-libs'
  'openssl'
)
makedepends=(
  'cargo'
  'git'
)

provides=("ocd=${pkgver%%.g*}")
conflicts=("ocd")

source=("ocd::git+$url.git")
sha256sum=('SKIP')

pkgver() {
  cd ocd
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ocd
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTONIG_SYSTEM_LIBONIG=1

  cd ocd
  VERGEN_GIT_SHA="Arch Linux"
  cargo build --release
}

check() {
  cd ocd
  cargo test --frozen
}

package() {
  cd ocd
  install -Dm755 "target/release/ocd" "$pkgdir/usr/bin/ocd"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  mkdir -p "$pkgdir/usr/share/man/man1"
  install -Dm644 "docs/ocd.1" "$pkgdir/usr/share/man/man1/ocd.1"
  install -Dm644 "docs/ocd-init.1" "$pkgdir/usr/share/man/man1/ocd-init.1"
  install -Dm644 "docs/ocd-clone.1" "$pkgdir/usr/share/man/man1/ocd-clone.1"
  install -Dm644 "docs/ocd-deploy.1" "$pkgdir/usr/share/man/man1/ocd-deploy.1"
  install -Dm644 "docs/ocd-undeploy.1" "$pkgdir/usr/share/man/man1/ocd-undeploy.1"
  install -Dm644 "docs/ocd-ls.1" "$pkgdir/usr/share/man/man1/ocd-ls.1"
  install -Dm644 "docs/ocd-rm.1" "$pkgdir/usr/share/man/man1/ocd-rm.1"
}
