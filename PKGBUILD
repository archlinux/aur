# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="aur_check"
_gitname="aur-malware-check"
_pkgname="aur-malware-check"
pkgname="${_pkgname}-git"
pkgver=5.3.0.r109.20260707.9023c17
pkgrel=1
pkgdesc="Detection tools for the June 2026 atomic-lockfile AUR supply-chain attack and maybe other comprimised AUR packages. Consolidated from community Gists. Having this tool reporting nothing does not mean you are safe!"
arch=(
  'any'
)
_githost='github.com'
_gituser='lenucksi'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("GPL-3.0-only")
depends=(
  'python>=3.14'
)
makedepends=(
  'git'
)
optdepends=(
  "${_pkgname}-pacman-hook: To invoke the check script at each pacman installation."  # See https://github.com/lenucksi/aur-malware-check/tree/master/integration/pacman-hook if anyone wants to build a package containing the hook.
  "${_pkgname}-systemd: Systemd service for continuous monitoring."  # See https://github.com/lenucksi/aur-malware-check/tree/master/integration/systemd if anyone wants to build a package containing this service.
)
checkdepends=()
provides=(
  "aur-check=${pkgver}" # Because there is the AUR package 'aur-check' (https://aur.archlinux.org/packages/aur-check).
  "${_pkgname}=${pkgver}"
  "python-${_pyname}=${pkgver}"
  "python-${_pyname}-git=${pkgver}"
)
conflicts=(
  "aur-check"           # Because there is the AUR package 'aur-check' (https://aur.archlinux.org/packages/aur-check).
  "${_pkgname}"
  "python-${_pyname}"
  "python-${_pyname}-git"
)

source=(
  "${_gitname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
  "aur-malware-check.sh"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source
  'df9ae735e2e3681c4c94f5d188437599ab8469cbd6b1798bd7deb452b353097e'  # aur-malware-check.sh
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > "${srcdir}/git.log"
}

pkgver() {
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

package() {
  cd "${srcdir}/${_pkgname}"

  local _pysitepkgdir="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
  install -dvm755 "${pkgdir}/${_pysitepkgdir}"
  cp -rv aur_check "${pkgdir}/${_pysitepkgdir}"/

  install -dvm755 "${pkgdir}/usr/lib/aur_check"
  cp -rv data "${pkgdir}/usr/lib/aur_check"/

  install -Dvm755 "${srcdir}/aur-malware-check.sh" "${pkgdir}/usr/bin/aur-malware-check"

  _docfiles=(
    "${srcdir}/git.log"
    README.md
    CHANGELOG.md
    DEVELOPING.md
    SOURCES.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile[@]}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

