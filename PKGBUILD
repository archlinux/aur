pkgname=python-threejs_materials
_build_fragment="tag=v1.0.4"  # the repo has multiple tags on the same commit...
pkgver=1.0.3
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
python-pygltflib
python-numpy
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

b2sums=('754337b78c1f20d63d6e7f7ff4035ab64163b102a1b817e20d058b478a8e3b20fb47527d72b3a4cca607ab159ed3fa98bdbaa998e98fb4d9442b46686806b440')

pkgver() {
  cd threejs-materials
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd threejs-materials
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

  # disable some tests that fail because of missing display
  LD_PRELOAD=/usr/lib/libjemalloc.so python -m pytest -v -s tests/ \
	  --deselect "tests/test_convert.py::TestDisplacement::test_warning_logged" \
	  --deselect "tests/test_fixes.py::TestAlwaysBakeProcedural::test_bake_called_without_textures"

  deactivate
}

package() {
  cd threejs-materials
  python -m installer --destdir="$pkgdir" dist/*.whl
}
