pkgname=python-threejs_materials
_build_fragment="tag=v0.3.0"
pkgver=0.3.0
pkgrel=1
pkgdesc="A db to maintain materialx definitions"
arch=(any)
url="https://github.com/bernhard-42/threejs-materials"
license=(Apache-2.0)
depends=(
materialx
python-requests
openexr
python-pillow
usd
)
checkdepends=(
python-pytest
)
makedepends=(
git
make
python-build
python-installer
python-wheel
)

source=("git+https://github.com/bernhard-42/threejs-materials#${_build_fragment}")

sha512sums=('dc96d416e225960d730be5d6a4c172d3e910a60eeec31005a2d9068b2fa8d2094b0b8bc04309a6da87b068108e2300814ac1ae9580c2865aaefe652ad0fb0f67')

pkgver() {
  cd threejs-materials
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd threejs-materials
  sed '/^[ \t]*@python -m build/s/^/#/' -i Makefile
}

build() {
  cd threejs-materials
  make dist
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  
  cd threejs-materials
  python -m installer dist/*.whl

  LD_PRELOAD=/usr/lib/libjemalloc.so python -m pytest -v -s tests/

  deactivate
}

package() {
  cd threejs-materials
  python -m installer --destdir="$pkgdir" dist/*.whl
}
