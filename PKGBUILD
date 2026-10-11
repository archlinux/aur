# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-tls-client
pkgname=${_pkgname}-git
pkgver=2.0.0+5.r188.20261010.62d2dba
pkgrel=1
pkgdesc="An advanced HTTP library based on requests and tls-client"
arch=('any')
url="https://github.com/FlorianREGAZ/Python-Tls-Client"
license=('MIT')
depends=('python' 'lib-tls-client')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('python-tls-client-bin-git')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"

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
  cd "$pkgname"

  git log > "${srcdir}/git.log"
}

build() {
  cd "$pkgname"
  HATCH_BUILD_NO_HOOKS=true python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  case "${CARCH}" in
    'aarch64')
      _libarch='linux-arm64'
    ;;
    'amd64'|'x86_64')
      _libarch='linux-ubuntu-amd64'
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

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
