# Maintainer: amixra <duckrelay at duck dot com>
pkgname='edxdlr-git'
pkgver=r43.f8b336a
pkgrel=1
pkgdesc="edx Downloader course video tool (This is working!)"
arch=('any')
url="https://github.com/neuronalism/edxdlr"
license=('GPL')
depends=('python-beautifulsoup4' 'python-html5lib' 'python-six' 'python-requests' 'python-tqdm')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('edx-dl')
source=('edxdlr::git+https://github.com/neuronalism/edxdlr.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/edxdlr/README.md
  find . -name '*.py' -exec install -Dvm 755 -t "$pkgdir"/opt/edxdlr {} +
  mkdir -p "$pkgdir"/usr/bin
  echo '#!/bin/sh' > "$pkgdir"/usr/bin/edxdlr
  echo 'exec python /opt/edxdlr/edxdlr.py "$@"' >> "$pkgdir"/usr/bin/edxdlr
  chmod 755 "$pkgdir"/usr/bin/edxdlr
}
