# Maintainer: Arnaud Renevier <arno@renevier.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=3.1.0
pkgrel=5
pkgdesc="generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-docutils' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuzutech/blockdiag/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/yuzutech/blockdiag/commit/b051e49c1154f0166ddb5c51777f4da02087184f.patch")
sha512sums=('9933bf68f4a4dfa5c18b3940f2d54acf37743032e5be437bc93a9333f6a6c3d62a0125e30b9cda44619cae71b46d045af758afabab0fbe8b4e765345b45370f8'
            '76b51917285621ae7cfb922199386bece019dfe944d8ec165a8f4d2dd112d9fb2c6568b7f1652d597a4406baf9e2367a83f7e9ae6553a0e5d34fae6b389dbba4')

prepare() {
  cd blockdiag-$pkgver
  patch --forward --strip=1 --input=../b051e49c1154f0166ddb5c51777f4da02087184f.patch
}

build() {
  cd blockdiag-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd blockdiag-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest src/blockdiag/tests/
}

package() {
  cd blockdiag-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
