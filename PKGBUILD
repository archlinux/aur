# Maintainer:  dreieck

_pkgname='python-pandera'
_vcssuffix='-git'
pkgname="${_pkgname}${_vcssuffix}"
pkgver=0.18.0+1.r625.20231215.812b2a8a
pkgrel=1
pkgdesc="Provides a flexible and expressive API for performing data validation on dataframe-like objects to make data processing pipelines more readable and robust."
arch=(
  'any'
)
url="https://www.union.ai/pandera"
_giturl="https://github.com/unionai-oss/pandera"
license=(
  'MIT'
)
depends=(
  'python>=3.10'
  'python-numpy>=1.19.0'
  'python-multimethod'
  'python-packaging>=20.0'
  'python-pandas>=1.2.0'
  'python-pydantic'
  'python-typeguard>=3.0.2'
  # 'python-typing_extensions>=3.7.4.3' # If python version is <3.8
  'python-typing_inspect>=0.6.0'
  'python-wrapt'
)
optdepends=(
  'mypy'
  'python-dask'
  'python-frictionless<=4.40.8'
  'python-geopandas'
  'python-hypothesis>=5.41.1'
  'python-fastapi'
  'python-modin'
  'python-pandas-stubs'
  'python-pyspark>=3.2.0'
  'python-ray'
  'python-scipy'
  'python-shapely'
  'python-yaml>=5.1'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${_giturl}.git"  # Official upstream source
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  ### Remove file that gets ill-installed
  rm -v "${pkgdir}/usr/LICENSE.txt"

  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${_pkgname}" CODE_OF_CONDUCT.md README.md git.log
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
