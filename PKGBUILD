# Maintainer: Marvin1099
pkgname=pdn2ora-git
pkgver=0.1.1.r0.g3a2888f
pkgrel=1
pkgdesc="Convert Paint.NET (.pdn) files to OpenRaster (.ora) format (bundles python-pypdn and python-pyora)"
arch=('any')
url="https://codeberg.org/marvin1099/pdn2ora"
license=('AGPL3')
depends=('python' 'python-pillow' 'python-numpy' 'python-defusedxml' 'python-aenum')
makedepends=('git' 'python-pip')
source=("git+https://codeberg.org/marvin1099/pdn2ora.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pdn2ora"
  git describe --long --tags --abbrev=7 2>/dev/null | \
    sed 's/^v//;s/-/.r/;s/-/./' || \
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/pdn2ora"
  python -m pip install --root="$pkgdir" --prefix=/usr --no-build-isolation --no-deps .
  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps pypdn pyora
  find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} +
  find "$pkgdir" -type f -name direct_url.json -delete
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}
