# Maintainer : David Runge <dave@sleepmap.de>

pkgname=patchbook-git
_pkg=patchbook
pkgver=r24.574b100
pkgrel=1
pkgdesc="Markup language and parser for writing and distributing patches for modular synthesizers."
arch=('any')
url="https://github.com/SpektroAudio/Patchbook"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver::git+https://github.com/spektroaudio/${_pkg}")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname-$pkgver"
  echo "#!/usr/bin/python3" > patchbook
  cat patchbook.py >> patchbook

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # script
  install -Dm755 patchbook "$pkgdir/usr/bin/patchbook"

  # examples
  install -d "${pkgdir}/usr/share/doc/${_pkg}"
  install -Dm644 Examples/* \
    "$pkgdir/usr/share/doc/${_pkg}/"

  # README
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/${_pkg}/README.md"
}
