# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=0.14.3
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
sha512sums=('30622abc506f3892d283fa6e0cd9709b8cf22564b6139ebb7d0a42abd6b3b37fcbc6e5c99a40de67721ce0852d9d0998682763c0b06c64e6725bf65d1c18d06c'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('c009c46285bf6e1fb774c062a0c897e2b5915c071afb908ba1e297a89d42505b1d11b45af17053f218718ec8230df799b194fb3355e8053956c6346d638a0a34'
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
