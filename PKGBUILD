# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="subword-nmt"
pkgver=0.3.8
pkgrel=1
pkgdesc="Unsupervised Word Segmentation for Neural Machine Translation and Text Generation"
arch=('any')
url="https://github.com/rsennrich/${pkgname}"
license=('MIT')
depends=(
  'python'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-setuptools'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-mock'
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1cec159a11e9b1aac0332663d175be57729b555169ee156583cf0d13e5a6e9b66188964faf25e5bd7aab6d3ff951d3d756ae4b62aa62acc68a7fe34156df0bed')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  rm -rf "${pkgdir}/${site_packages}/${pkgname//-/_}/tests"
  
  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}