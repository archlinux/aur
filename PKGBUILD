# Maintainer:  AlphaJack <alphajack at tuta dot io>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pypiname="fastavro"
pkgname="python-${_pypiname}"
pkgver=1.12.2
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/${_pypiname}/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'python>=3.10'
  'python-cramjam'
  'python-lz4'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools'
  'cython'
)
checkdepends=(
  'python-pytest'
  'python-pandas'
  'python-zlib-ng'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('c8fb6402d569ea890a0657c6de06299b602a3483686a114154b2eec6e7441c27cfcfbaa52c4355078f22821a83beb0373cd749355286b418b44813f8e48e79b6')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest -k "not test_cython_python"
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
