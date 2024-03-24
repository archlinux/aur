# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-tls-client
pkgname="${_pkgname}-git"
pkgver=1.0.1.r113.20240202.ab6c736
pkgrel=1
pkgdesc="An advanced HTTP library based on requests and tls-client."
arch=(
  'any'
)
url="https://pypi.org/project/tls-client/"
license=('MIT')
depends=(
  'python'
  'lib-tls-client'
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
replaces=(
  'python-tls-client-bin-git'
)
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

  ## Remove precompiled shared libraries -- we want to use them via a dependency:
  find "${pkgdir}/usr/lib"/python*/site-packages/tls_client/dependencies -mindepth 1 -maxdepth 1 -name 'tls-client-*.*' -delete

  ## Symlink dependencies:
  case "${CARCH}" in
    'aarch64')
      _libarch='arm64'
    ;;
    'amd64')
      _libarch='amd64'
    ;;
    'x86_64')
      _libarch='x86'
    ;;
    *)
      error "Architecture '${CARCH}' not supported."
      return 2
      _libarch="${CARCH}"
    ;;
  esac
  for _dependencydir in "${pkgdir}/usr/lib"/python*/site-packages/tls_client/dependencies; do
    ln -sv '/usr/lib/tls-client.so' "${_dependencydir}/tls-client-${_libarch}.so"
  done
  

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
