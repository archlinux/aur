# Maintainer: Viktor Danov <orangeleaf12@gmail.com>
# SPDX-License-Identifier: 0BSD

pkgname=memoria-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Keep a project's documented mental model connected to its code"
arch=('x86_64')
url='https://github.com/viktordanov/rs-memoria'
license=('MIT')
depends=('glibc>=2.39' 'libgcc' 'git')
provides=("memoria=${pkgver}")
conflicts=('memoria')
options=('!strip' '!debug')
_archive="memoria-${pkgver}-${CARCH}-unknown-linux-gnu"
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.gz")
sha256sums=('09d4aa44aaf030e8538d7d5da27fd4daa5d7c516d20bae496bfe78e2ada0013c')

build() {
  cd "${_archive}"
  ./memoria completions bash > memoria.bash
  ./memoria completions zsh > _memoria
  ./memoria completions fish > memoria.fish
}

check() {
  cd "${_archive}"
  [[ $(./memoria --version) == "memoria ${pkgver}" ]]
  ./memoria --help > /dev/null
  test -s memoria.bash
  test -s _memoria
  test -s memoria.fish
}

package() {
  cd "${_archive}"
  install -Dm755 memoria "${pkgdir}/usr/bin/memoria"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 memoria.bash "${pkgdir}/usr/share/bash-completion/completions/memoria"
  install -Dm644 _memoria "${pkgdir}/usr/share/zsh/site-functions/_memoria"
  install -Dm644 memoria.fish "${pkgdir}/usr/share/fish/vendor_completions.d/memoria.fish"
}
