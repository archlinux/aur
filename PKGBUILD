# Maintainer:  AlphaJack <alphajack at tuta dot io>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pypiname="fastavro"
pkgname="python-${_pypiname}"
pkgver=1.13.1
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
b2sums=('b9a44f24525396c7ece1f4148c7453ef14c6c7e41af1da683865f234e8de6074371be3a52f8e19c2c9bf56cd4fe4db4ebb50e7129b1aae44ce5a89feae5d4a09')

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
