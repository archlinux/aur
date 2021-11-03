# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch-git
_pkgname=${pkgname%-git}
pkgver=r385.a1c4f03
pkgrel=2
pkgdesc="Painless compression and decompression in the terminal"
arch=('x86_64')
url="https://github.com/ouch-org/ouch/"
license=('MIT')
makedepends=('git' 'cargo')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  GEN_COMPLETIONS=1 cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"

  cd target/release/build/ouch-*/out/completions
  sed -i "s/':output -- The resulting file. It's extensions can be used to specify the compression formats:_files'/\":output -- The resulting file. It's extensions can be used to specify the compression formats:_files\"/" _ouch

  install -Dm0644 ${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm0644 ${_pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm0644 _${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
