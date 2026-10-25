# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-schpet
pkgver=3.1.0
pkgrel=1
_commit=02571d34be662e5487204841fb80bf23ed79b4f0
pkgdesc="Linear without leaving the command line: list, start, and create PRs for linear issues. Agent friendly. (Built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/schpet/linear-cli"
license=('ISC')
depends=('glibc' 'gcc-libs')
provides=("linear-cli=$pkgver")
conflicts=('linear-cli' 'linear-cli-schpet-bin')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/schpet/linear-cli/archive/${_commit}.tar.gz")
sha256sums=('c0979330a392355b73605deeb87d0571a8051adb062626894ec439d6c59cd2ed')

prepare() {
  cd "${_pkgname}-${_commit}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${_commit}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${_pkgname}-${_commit}"

  install -Dm755 target/release/linear -t "${pkgdir}/usr/bin/"

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"

  target/release/linear completions bash > "${pkgdir}/usr/share/bash-completion/completions/linear"
  target/release/linear completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/linear.fish"
  target/release/linear completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_linear"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

