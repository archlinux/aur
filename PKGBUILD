# Maintainer: Tobias Bachmann <tobachmann@gmx.de>

pkgname=python-indexed-gzip
pkgver=1.10.3
pkgrel=1
pkgdesc='Fast random access of gzip files in Python'
_name=indexed_gzip
arch=('aarch64' 'x86_64')
url='https://github.com/pauldmccarthy/indexed_gzip'
license=('BSD-3-Clause')
depends=(
  'python'
  'zlib'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16767d095350bbbf10b6c153385bd8b0971f5204ac78e157d8596acdcdc352da')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  local _site
  _site=$(python - <<<'import sysconfig; print(sysconfig.get_path("purelib"))')

  rm -rf "${pkgdir}${_site}/indexed_gzip/tests"
  rm -f  "${pkgdir}${_site}/indexed_gzip/"*.{c,h,pxd,pyx}

  install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
