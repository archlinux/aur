# Maintainer:  dreieck


_pkgname='optimal-congress'
_vcssuffix='-git'
pkgname="${_pkgname}${_vcssuffix}"
pkgver=0.5.1.r58.20231221.282e33e
pkgrel=1
pkgdesc="Command line tool to find an optional, personal chedule for the 37th Chaos Communication Congress (37C3) 2023."
arch=(
  'any'
)
url="https://github.com/top-on/optimal-congress"
license=(
  'MIT'
)
depends=(
  'python>=3.10'
  'python-pydantic>=2.5.2'
  'python-typer>=0.9.0'
  'python-pytz>=2023.3.post1'
  'python-pulp>=2.7.0'
  'python-pandas'
  'python-pandera>=0.18.0'
  'python-requests'
)
makedepends=(
  'git'
  'python-poetry'
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pkgname//-/_}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname//-/_}"
)
source=(
  "${_pkgname}::git+${url}.git"  # Official upstream source
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

  install -D -m644 -v CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -D -m644 -v README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 -v git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -m644 -v LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
