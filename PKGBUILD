# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-mammoth
pkgver=1.11.0
pkgrel=1
pkgdesc="Convert Word documents (.docx files) to HTML"
arch=(any)
url="https://github.com/mwilliamson/python-mammoth"
license=(MIT)
provides=(mammoth)
conflicts=(mammoth)
depends=(
  python
  python-cobble
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-funk
  python-pytest
  python-precisely
  python-pyflakes
  python-spur
  python-tempman
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwilliamson/python-mammoth/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c89a093800e89be86e4c4d635bccf616f62e94072c8036c730a67f042f888429')

prepare() {
  cd "$pkgname-$pkgver"
  cp README.md README

}
build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # wrap the cli portion to avoid needing to install just for testing
  mkdir -p "$srcdir/fake-bin"
  cat > "$srcdir/fake-bin/mammoth" <<EOF
#!/usr/bin/env python3
from mammoth.cli import main
main()
EOF
  chmod +x "$srcdir/fake-bin/mammoth"
  export PATH="$srcdir/fake-bin:$PATH"
  PYTHONPATH="$PWD" python -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
