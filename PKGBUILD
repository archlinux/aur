# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname='python-pytest-freezegun'
_pkgbase="${pkgname//python-/}"
pkgver=0.4.2
pkgrel=9
pkgdesc="Easily freeze time in pytest test + fixtures"
arch=('any')
license=('MIT')
url="https://github.com/ktosiek/pytest-freezegun"
depends=(
  'python-freezegun'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=(
  "$_pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "remove-old-pytest-support.patch"
)
sha512sums=('2bea7746e4e6a7f2a979cbc5c6d7a2576e0e2631a4e1d5abb7f27f76d6c32b0520a277474c092c5e05ce257f2ba19091918f67e28b7a2da1d5829037c6b70c55'
            'd4863396ec5ae2321d90382b1bb670187be1f9c87f3fcc43d52a97e9d7ab6d1c3b33504bc922f6380a1428059231f5f069dc9983b4c66f541e3fa48209b37833')

prepare() {
  cd "$_pkgbase-$pkgver"
  patch -Np1 -i ../remove-old-pytest-support.patch
}

build() {
  cd "$_pkgbase-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgbase-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "$_pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
