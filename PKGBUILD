# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname="paths-bookmarks-git"
pkgver=r126.8aa0f78
pkgrel=2
pkgdesc="Save often used directories like bookmarks"
arch=("x86_64")
url="https://github.com/sproott/pat.hs"
license=("MIT")
depends=("bash" "glibc" "gmp")
makedepends=("git" "stack")
optdepends=()
install="${pkgname}.install"
provides=("paths-bookmarks")
source=("${pkgname}::git+https://github.com/sproott/pat.hs.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "bin"
  stack --local-bin-path "bin/" install
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binary and shell integration scripts
  install -Dm755 "bin/paths" "${pkgdir}/usr/lib/paths/paths"
  install -Dm755 "bin/paths.sh" "${pkgdir}/usr/share/paths/paths.sh"
  install -Dm755 "bin/paths.fish" "${pkgdir}/usr/share/paths/paths.fish"
  install -Dm755 "bin/paths.zsh" "${pkgdir}/usr/share/paths/paths.zsh"
  sed -i 's|/usr/share/paths|/usr/lib/paths|g' \
    "${pkgdir}/usr/share/paths/paths.sh" \
    "${pkgdir}/usr/share/paths/paths.fish" \
    "${pkgdir}/usr/share/paths/paths.zsh"

  # Install shell completions
  install -Dm644 "bin/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/paths"
  install -Dm644 "bin/completions/fishcompletion.fish" "${pkgdir}/usr/share/fish/completions/paths.fish"
  install -Dm644 "bin/completions/zshcompletion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_paths"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/paths-bookmarks/README.md"
}
