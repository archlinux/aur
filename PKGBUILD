# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=git-xet
pkgver=0.2.1
pkgrel=1
pkgdesc='Git LFS plugin that uploads and downloads using the Xet protocol'
arch=('x86_64' 'aarch64')
url='https://github.com/huggingface/xet-core'
license=('Apache-2.0')
depends=('gcc-libs' 'git' 'git-lfs' 'glibc' 'libgit2' 'openssl' 'zlib')
makedepends=('cargo' 'cmake' 'git' 'pkgconf')
options=('!lto')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/huggingface/xet-core.git#tag=${pkgname}-v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}"

  cargo build --frozen --release --package git_xet --bin git-xet
}

check() {
  local testdir="${srcdir}/smoke-test"
  mkdir -p "${testdir}"
  cd "${testdir}"

  "${srcdir}/${pkgname}/target/release/git-xet" --version
  git init
  PATH="${srcdir}/${pkgname}/target/release:${PATH}" git xet track test
  grep -q 'test filter=lfs' .gitattributes
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/git-xet" "${pkgdir}/usr/bin/git-xet"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "git_xet/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
