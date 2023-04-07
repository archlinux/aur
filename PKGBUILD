# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=1.0.0
pkgrel=2
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.14.3-remove_mock.patch
)
sha512sums=('22409c78a0bb858b1fc3cf8ed110885c366964af656ad06d3fe969565d91b6491599b7e65979fdee9d9a89a092eb87dad8d9e60101b5f1f4bda3f8a5b3539a77'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('31c6b14d382a2d1eb5d30062af1caed718978b452980e1ba7332da5970b4c804b727b244b5d027f1fdaa3ef5575ccfcd399d8210ad940852752fceab361f3324'
        '4cc08b683975b3400caa0d73efb986737971c1003f1c0632d7440c25c9f0cc661f847275753c6ba03dc214e303a3cfd1ea8d3fb2bb6824c7560945fe1f2ecb05')

prepare() {
  # remove use of mock: https://github.com/square/pylink/issues/149
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.14.3-remove_mock.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
