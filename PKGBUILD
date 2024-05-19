# Maintainer: a821 at mail de
# Contributor: David Runge <dvzrv@archlinux.org>

_name=assertpy
pkgname=python-assertpy
pkgver=1.1
pkgrel=3
pkgdesc="Simple assertion library for unit testing in python with a fluent API"
arch=(any)
url="https://github.com/assertpy/assertpy"
license=(BSD-3-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "0001-setup-cfg.patch")
sha512sums=('e5c2b72756bff0fa12a2dbb15d8dee20267f5026b9f20f2150da8d2716303afbe7ac56dc27ce0f77a4c1ac5518b5f9127e4b34397148f6d5485da241d9b23aa5'
            '8f79e10711d2627124f59907385f61a4137109f6f4551a1957ca3569813c5f7cc06fb8f900dc6b3dbbc3e3aba0703005f9524ea6ee78ac34c5514c11aed56c08')
b2sums=('d1b500c8770ead974b278f323532ce6e9d53fc26a95c761582bce2948f6f5666adca03bda12d45c86646297b0180dbe563f7112a2722c7e95112073d4af3f3cb'
        'e4dbf8f2f6f75b2758c59e80864109c67bb3acabab6ef4ed559cd9bb7de8fa2bfb77e04581f04c73db022547e8b0f769a235d83249e3beb41216930fb543e59e')

prepare() {
  patch -d $_name-$pkgver -p1 < 0001-setup-cfg.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
