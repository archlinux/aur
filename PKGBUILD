# Maintainer : David Runge <dave@sleepmap.de>

pkgname=patchbook-git
_pkg=patchbook
pkgver=r24.574b100
pkgrel=3
pkgdesc="Markup language and parser for writing and distributing patches for modular synthesizers."
arch=('any')
url="https://github.com/SpektroAudio/Patchbook"
license=('MIT')
depends=('python')
source=("${pkgname}::git+https://github.com/spektroaudio/${_pkg}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
  cd "${pkgname}"
  echo "#!/usr/bin/python3" > patchbook
  cat patchbook.py >> patchbook
}

package() {
  cd "${pkgname}"
  # script
  install -Dm0755 "${_pkg}" "${pkgdir}/usr/bin/${_pkg}"

  # examples
  install -t "${pkgdir}/usr/share/doc/${_pkg}/" -Dm0644 Examples/*

  # license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"

  # README
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkg}/README.md"
}
