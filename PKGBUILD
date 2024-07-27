# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaARM
pkgname=python-${_base,,}
pkgver=0.3.11
pkgrel=1
pkgdesc="A minimalistic framework for numerical association rule mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-nltk python-plotly python-scikit-learn)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  numpy2.patch::${url}/pull/140.patch)
sha512sums=('dbf76e45ef9dbb77e5654d1eb14956aaaa8106836eafa6e2c5734b69dc55d3c584ab4b80bf02712118959c8444e04e8bb310df15c428ce3bd32f0aff2f559c18'
            '0c74946410ea3d2ee5723c5e1e76a5400134fcd7cb19aa55b21c432bc3d013a803b45b106bacd3af8b50c2f5987ed813041389a1a7bf2c6d6622577cc38333a0')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../numpy2.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ${_base,,}.1 -t "${pkgdir}/usr/share/man/man1/"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base,,}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
