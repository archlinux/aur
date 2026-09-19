# Maintainer: Rubin Simons <me@rubin55.org>

_branch=main
_pkgname=nvim-mcp
pkgname=${_pkgname}-git
pkgver=r323.986be68
pkgrel=1
pkgdesc='MCP server for Neovim, git main build'
arch=('x86_64' 'aarch64')
url="https://github.com/linw1995/${_pkgname}"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
checkdepends=('neovim')
optdepends=('neovim: Lua plugin that registers the RPC socket')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # build.rs reads these for `nvim-mcp --version`; the checkout is clean.
  export GIT_COMMIT_SHA="$(git rev-parse HEAD)"
  export GIT_DIRTY=false

  # aws-lc-sys compiles its C and assembly with the cc crate; LTO hides
  # those symbols from rust-lld and linking fails with undefined
  # aws_lc_*_EVP_AEAD_CTX_zero references.
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"

  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Integration tests drive a live Neovim instance and its LSP servers.
  cargo test --frozen --release -- --skip integration_tests
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/docs" docs/*.md
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
