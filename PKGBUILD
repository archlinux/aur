# Maintainer:  dreieck
# Contributor: Nils Werner <nils.werner@gmail.com>

_pkgbase="crestic"
_gitname="${_pkgbase}"
_githubuser="nils-werner"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${_pkgbase}-git"
  "${_pkgbase}-docs-git"
)
pkgver=1.1.0.r145.20250610.d69ef5e
pkgrel=1
pkgdesc="Configurable restic wrapper. Lastest git checkout. Split package: Software and documentation."
arch=('any')
url="https://github.com/${_githubuser}/${_gitname}"
license=('MIT')
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
source=(
    "${_pkgbase}::git+${url}.git"
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
  cd "${srcdir}/${_pkgbase}"

  git log > "${srcdir}/git.log"
}

pkgver () {
  cd "${srcdir}/${_pkgbase}"
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
  cd "${srcdir}/${_pkgbase}"
  python -m build --wheel --no-isolation
}

# check() {
#   # `python-pytest-pycodestyle` is needed but not in the repositories or the AUR, so whe skip for now.
#   cd "${srcdir}/${_pkgbase}"
# 
#   pytest
# }

package_crestic-git() {
  pkgdesc="Configurable restic wrapper. Lastest git checkout."
  depends=(
    'python>=3.6'
    'restic'
  )
  optdepends=(
    "crestic-docs: Documentation for this software."
  )
  provides=(
    "crestic=${pkgver}"
    "python-crestic=${pkgver}"
  )
  conflicts=(
    "crestic"
    "python-crestic"
  )

  cd "${srcdir}"
  install -Dvm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/system/
  install -Dvm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dvm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/user/

  cd "${srcdir}/${_pkgbase}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm 0644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

package_crestic-docs-git() {
  pkgdesc="Documentation for 'crestic'. Latest git checkout."
  provides=(
    "crestic-docs=${pkgver}"
  )
  conflicts=(
    "crestic-docs"
    "crestic-doc<=1.0.0+6.r123.20240618.4c735ad"  # Because we initially had 'crestic-doc' in the 'provides'-array of 'crestic-git', and now the package is split  out _and_ renamed to 'crestic-docs' (with 's' suffix).
  )
  replaces=(
    "crestic-doc<=1.0.0+6.r123.20240618.4c735ad"  # Because we initially had 'crestic-doc' in the 'provides'-array of 'crestic-git', and now the package is split  out _and_ renamed to 'crestic-docs' (with 's' suffix).
  )
  optdepends=(
    "crestic: The software this documentation is for."
  )

  cd "${srcdir}/${_pkgbase}"

  install -Dvm 0644 "${srcdir}/git.log" CHANGELOG.md README.md RELEASE.md -t "${pkgdir}/usr/share/doc/${_pkgbase}"/
  install -Dvm 0644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  ln -svr "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE "${pkgdir}/usr/share/doc/${_pkgbase}"/LICENSE

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgbase}/docs"
}
