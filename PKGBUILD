# Maintainer: Ninso112 <Ninso112@pm.me>
pkgname=secfesc-git
pkgver=1.7.0.r0.g652bf0d
pkgrel=1
pkgdesc="Lightweight security state inspector for Linux (secfetch + secscan)"
arch=('any')
url="https://github.com/ake13-art/secfesc"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mock')
provides=('secfesc')
conflicts=('secfesc')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-/./g' ||
    printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  /usr/bin/python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  /usr/bin/python -m pytest || true
}

package() {
  cd "$pkgname"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
