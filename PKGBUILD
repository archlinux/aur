# Maintainer: yuf <yuf at yufarch dot com>

pkgname='satysfi-language-server-git'
_pkgname="${pkgname%-git}"
pkgver=0.0.1.56.gc48b59c
pkgrel=1
pkgdesc='SATySFi Language Server'
arch=('x86_64')
url='https://github.com/monaqa/satysfi-language-server'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
makedepends=('cargo' 'git')
source=("${_pkgname}::git+https://github.com/monaqa/satysfi-language-server.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit 1
  (
    set -o pipefail
    echo "$(awk '/^version/ {print $3}' Cargo.toml | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}" || exit 1
  cargo build --release  --locked
}

check() {
  cd "${_pkgname}" || exit 1
  export CARGO_TARGET_DIR=test
  cargo test --release --frozen --all-features
}

package() {
  cd "${_pkgname}" || exit 1
  install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
