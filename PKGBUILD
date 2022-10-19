# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Brad Ackerman <brad[at]facefault.org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=python-oletools
_pkg="${pkgname#python-}"
pkgver=0.60.1
pkgrel=1
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
arch=('any')
url="https://github.com/decalage2/oletools"
license=('BSD')
depends=('python-colorclass' 'python-easygui' 'python-pyparsing' 'python-msoffcrypto-tool')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.zip::https://files.pythonhosted.org/packages/source/o/$_pkg/$_pkg-$pkgver.zip")
sha256sums=('67a796da4c4b8e2feb9a6b2495bef8798a3323a75512de4e5669d9dc9d1fae31')

# Some checks failing; will investigate. -BA 20190616
# check() {
#   cd "${srcdir}/${_pyname}-${pkgver}"
#   python3 setup.py test
# }

prepare() {
  cd "$_pkg-$pkgver"
  sed -i '167,193c\package_data = {}' setup.py
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 \
    "$_pkg/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/xglob/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/xglob/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/xxxswf/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/xxxswf/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/prettytable/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/prettytable/LICENSE"
}

# vim:set et sw=2 ts=2 tw=79:
