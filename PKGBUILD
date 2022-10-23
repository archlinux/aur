# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytzdata
pkgname=python-pytzdata
pkgver=2020.1
pkgrel=7
pkgdesc="Official timezone database for Python."
arch=(any)
url="https://github.com/sdispater/pytzdata"
license=(MIT)
depends=(python python-cleo)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/sdispater/$_name/archive/$pkgver.tar.gz
  $pkgname-2020.1-pep517_build_system.patch::https://github.com/sdispater/pytzdata/pull/13/commits/5eb35d299371dd096b32d49b0d4570c6d93c343d.patch
)
sha512sums=('fd154bfbe90ce07a90f769063b772234036d2627c1e6d78a465d9ddbc894e50cb9d821c04ebff1a7cc6a327266f7843fe54e5592d37c41db023329d6e0f668c2'
            'b9219e1cd9aab3af73dc59d3a7a64e304c114ddcab530cb918475c5cfd9302a9737d347ca0cafeab9a3ced11609851e961dfcd8f89bed8293374e6187217306a')
b2sums=('6f07a7577edc87030fd70e720b32146e9044a8c6f74d0bafb9239ad666d0d6fd0ac7c3cca070914701af301b1a3368ace2985f8169b9747937fa6ed066be7302'
        '2f562a0b3b76b8f75f5f896e694003d1944b778087baf55536efa0be0a440f3608933e2d49d643f6b5ec2737fec6b1945bd3d3021da7a59987dc57fa5b77dc00')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-2020.1-pep517_build_system.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -av $_name/zoneinfo/* "$pkgdir/$site_packages/$_name/zoneinfo/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
