# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname="gws2-git"
_reponame="gws2"
_binname="gws"
pkgver=0.1.0.r94.gb7a5d37
pkgrel=5
pkgdesc="Colorful KISS helper for git workspaces"
url="https://github.com/emlun/${_reponame}"
license=('GPL3')
arch=('any')
depends=('git')
makedepends=('rust' 'cargo')
provides=("gws")
conflicts=("gws")
source=("${_reponame}::git+https://github.com/emlun/${_reponame}.git#branch=master")
md5sums=('SKIP')
validpgpkeys=('BFD86BE9948C849A')

prepare() {
  git -C "${srcdir}/${_reponame}" verify-commit HEAD --raw |& grep -q "GOODSIG ${validpgpkeys[0]}" \
    || (echo 'Failed to verify commit signature' >&2; return 1)

  git -C "${srcdir}/${_reponame}" submodule update --recursive --init
}

pkgver() {
  cd "${srcdir}/${_reponame}/"
  git describe --long --tags --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  cargo build --release
  mkdir -p "${srcdir}/completions"
  for shell in bash fish zsh; do
    "${srcdir}/${_reponame}/target/release/${_binname}" completions "${shell}" > "${srcdir}/completions/${shell}"
  done
}

check() {
  cd "${srcdir}/${_reponame}"
  cargo test --release
}

package() {
  install -D -m 755 "${srcdir}/${_reponame}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -D -m 644 "${srcdir}/completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -D -m 644 "${srcdir}/completions/fish" "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -D -m 644 "${srcdir}/completions/zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
}
