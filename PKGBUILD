# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-tls-client
pkgname="${_pkgname}-bin-git"
pkgver=0.1.8.r79.20230105.d724121
pkgrel=1
pkgdesc="An advanced HTTP library based on requests and tls-client."
arch=(
  'aarch64'
  'amd64'
  'x86_64'
)
url="https://pypi.org/project/tls-client/"
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  # 'python-setuptools'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
source=(
  "${_pkgname}::git+https://github.com/FlorianREGAZ/Python-Tls-Client"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  ## Remove libraries that do not fit to our architecture
  case "${CARCH}" in
    'aarch64')
      _keeplibs='arm64'
    ;;
    'amd64')
      _keeplibs='amd64'
    ;;
    'x86_64')
      _keeplibs='x86'
    ;;
    *)
      error "Architecture '${CARCH}' not supported."
      return 2
      _keeplibs="${CARCH}"
    ;;
  esac
  printf '%s\n' "Removing binaries for other architectures ..."
  find "${pkgdir}/usr/lib"/python*/site-packages/tls_client/dependencies -mindepth 1 -maxdepth 1 -name 'tls-client-*.*' -not -name "*-${_keeplibs}.*" -delete

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
