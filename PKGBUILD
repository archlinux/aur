# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-pykakasi
_pkgname=${pkgname#python-}
pkgver=2.2.1
pkgrel=7
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url='https://codeberg.org/miurahr/pykakasi'
license=(GPL-3.0-or-later)
depends=(
    python
    python-deprecated
    python-jaconv
    python-setuptools
    python-importlib-metadata
)
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-sphinx
    python-wheel
)
# source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
_src_name="${_pkgname/-/_}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_src_name}.tar.gz"
        "${_pkgname}-remove-klepto-1.patch::${url}/pulls/156.patch")
sha256sums=('3a3510929a5596cae51fffa9cf78c0f742d96cebd93f726c96acee51407d18cc'
            'b47d9c37d66afa7c58e51db96dd18e7a405b5b624308537f79b91242b69575ee')

prepare() {
  cd "${_src_name}"
  # remove build-time dependency on python-klepto
  patch -Np1 -i "../${_pkgname}-remove-klepto-1.patch"
}

build() {
  cd "${_src_name}"
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd "${_src_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # rename script in /usr/bin to pykakasi in order to avoid conflicts with the kakasi package
  mv "${pkgdir}"/usr/bin/{,py}kakasi

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/_build/text/*
}
