# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=triangle
pkgname=python-${_base}
pkgver=20220202
pkgrel=3
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/${_base}"
arch=(any)
license=(LGPL3)
depends=(python-numpy) # triangle
makedepends=(python-build python-installer python-setuptools cython python-wheel git)
optdepends=('python-matplotlib: for Matplotlib rendering')
source=(git+${url}.git?#tag=v${pkgver}
  git+${url}-c.git
  drop-python36.patch::${url}/pull/66.patch
  python311-compatibilty.patch::${url}/pull/67.patch)
sha512sums=('SKIP'
  'SKIP'
  'a3d405d64cb6f2bb6896acfaef72859294acd95d55c09a2bfef2f49fbe2fc7b98fa955e8b4ff6b2dd49c38e23ef8a88e69b01b09b39f9aa6fb709d264236701d'
  '52d55f0ea2e97c852ebb26dd0e395018bbc8e58b6230567a92d2aeb590eb08da851eaa0e88df3e2d89454e921fec4f8fe51367dc59b6d4a28fbbbcbf70503742')

prepare() {
  cd ${_base}
  # https://github.com/drufat/triangle/issues/69
  patch -p1 -i ../drop-python36.patch
  patch -p1 -i ../python311-compatibilty.patch
  git submodule init
  git config submodule.libs/c.url "${srcdir}/${_base}-c"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
