# Maintainer:  dreieck
# Contributor: Nils Werner <nils.werner@gmail.com>

_pkgname=crestic
pkgname="${_pkgname}-git"
pkgver=1.0.0+6.r123.20240618.4c735ad
pkgrel=1
pkgdesc="Configurable restic wrapper. Lastest git checkout."
arch=('any')
url="https://github.com/nils-werner/${_pkgname}"
license=('MIT')
depends=(
  'python>=3.6'
  'restic'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
# checkdepends=(
#   'python-pytest'
#   'python-pytest-cov'
#   'python-pytest-mock'
#   'python-pytest-mypy'
#   'python-pytest-pycodestyle' # Not available, so we skip `check()` for now.
# )
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname}"
  "${_pkgname}-doc"
)
source=(
    "${_pkgname}::git+${url}.git"
    "crestic-backup@.service"
    "crestic-backup@.timer"
    "crestic-forget@.service"
    "crestic-forget@.timer"
)
sha256sums=(
    "SKIP"
    "487bdee984708f7c8e3fdf300d372a9cf60ac212c3898231011d50b4bb2161e6"
    "be3b2461029a2d92329bcc1b42a8207f1c75ce03a6df86d72788ff2b8772ba70"
    "d8a94324994b2caae186f70f1463bee7b998547e31739c6e790f9fca37019022"
    "ea0050225c6527f8ebcc146f6dd60e15dede64b5820e25d94e511f7c01594ffc"
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

build () {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

# check() {
#   # `python-pytest-pycodestyle` is needed but not in the repositories or the AUR, so whe skip for now.
#   cd "${srcdir}/${_pkgname}"
# 
#   pytest
# }

package() {
  cd "${srcdir}"
  install -Dvm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/user/

  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm 0644 "${srcdir}/git.log" CHANGELOG.md README.md RELEASE.md -t "${pkgdir}/usr/share/doc/${_pkgname}"/
  install -Dvm 0644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  ln -svr "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE "${pkgdir}/usr/share/doc/${_pkgname}"/LICENSE

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
}
