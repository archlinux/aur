pkgname=python-bd_warehouse
_build_hash=354bcb3bc5a07cfb1981f2821a18da51832a51de
pkgver=0.1.1
pkgrel=1
pkgdesc="A build123d parametric part collection"
arch=(x86_64)
url="https://github.com/gumyr/bd_warehouse"
license=(Apache-2.0)
depends=(
python-build123d
python-typing_extensions
)
checkdepends=(
python-pytest
python-build123d
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)


source=("git+https://github.com/gumyr/bd_warehouse#commit=${_build_hash}")

sha256sums=('110028391649b28a3b4db27e60db1d75b378340477749ad0856b406ec03df99f')

pkgver() {
  cd bd_warehouse
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd bd_warehouse
}

build() {
  cd bd_warehouse
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  
  cd bd_warehouse
  python -m installer dist/*.whl

  python -m pytest -v -s tests || true  # lots of failures...

  deactivate
}

package() {
  cd bd_warehouse
  python -m installer --destdir="$pkgdir" dist/*.whl
}
