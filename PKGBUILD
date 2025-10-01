# Maintainer: Andrei Dumitrescu <andrei.dumitrescu@pm.me>

pkgname=pu-git
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform POSIX utilities for development workflows"
arch=('any')
url="https://github.com/asd-xiv/posix-utils"
license=('MIT')
depends=('sh')
optdepends=(
  'git: for pu-git-has-changed command'
  'pacman: for pu-install command on Arch Linux'
  'npm: for pu-npm-bundle command'
)
makedepends=('git')
provides=('pu')
conflicts=('pu')
source=("${pkgname%-git}::git+https://github.com/asd-xiv/posix-utils.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${srcdir}/${pkgname%-git}"

  # Run linting if shellcheck is available
  if command -v shellcheck >/dev/null 2>&1; then
    find src -type f ! -name '*.1' -exec shellcheck {} +
  fi
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Install all executable scripts from src/
  install -dm755 "${pkgdir}/usr/bin"
  for script in src/pu*; do
    if [[ -f "$script" && -x "$script" && ! "$script" =~ \.1$ ]]; then
      install -Dm755 "$script" "${pkgdir}/usr/bin/$(basename "$script")"
    fi
  done

  # Install man pages
  install -dm755 "${pkgdir}/usr/share/man/man1"
  for manpage in man/man1/*.1; do
    if [[ -f "$manpage" ]]; then
      install -Dm644 "$manpage" "${pkgdir}/usr/share/man/man1/$(basename "$manpage")"
    fi
  done

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
