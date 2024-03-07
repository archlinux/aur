# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-pykakasi
pkgver=2.2.1
pkgrel=6
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url='https://pypi.org/project/pykakasi'
license=(GPL3)
depends=(
    python-deprecated
    python-jaconv
    python-setuptools
)
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-sphinx
    python-wheel
)
_module="${pkgname#python-}"
_src_name="${_module/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_module::1}/${_module}/${_src_name}.tar.gz"
        "${_module}-remove-klepto-1.patch::https://codeberg.org/miurahr/${_module}/pulls/156.patch")
sha256sums=('3a3510929a5596cae51fffa9cf78c0f742d96cebd93f726c96acee51407d18cc'
            'b47d9c37d66afa7c58e51db96dd18e7a405b5b624308537f79b91242b69575ee')

prepare() {
  cd "${_src_name}"
  # remove build-time dependency on python-klepto
  patch -Np1 -i "../${_module}-remove-klepto-1.patch"
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
