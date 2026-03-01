# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="converter"
_pkgname="uup-converter"
pkgname="${_pkgname}-git"
pkgver=0.7.3.r63.20251026.dbc65de
pkgrel=1
pkgdesc="A basic UUP converter aimed at Linux and macOS users who don't have access to any Windows machine, but want or need to create an ISO image for latest Windows Insider version downloaded from UUP dump (uupdump.net)."
groups=('uup-dump')
arch=(
  'any'
)
_githost='git.uupdump.net'
_gituser='uup-dump'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("MIT")
depends=(
  'bash'

  'aria2'
  'cabextract'
  'chntpw'
  'findutils' # For 'find'
  'grep'
  'wimlib'    # For 'wimlib-imagex'

  'cdrtools' # 'genisoimage' or 'mkisofs' is needed by the script.
)
makedepends=(
  'git'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
  "uup-converter.sh"
)
sha256sums=(
  'SKIP'
  '50f3218e9b89d6956ed3bac141fd80f6c93e54367ee94bb06392eb760358cac3'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*scriptName=' convert.sh | awk -F= '{print $2}' | tr -d \"\' | awk -F# '{print $1}' | sed -E 's|UUP Converter v||')"
  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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
  printf '%s\n' " --> installing ..."

  install -Dvm755 -t "${pkgdir}/usr/lib/uup-converter"  convert.sh
  install -Dvm644 -t "${pkgdir}/usr/lib/uup-converter"  convert_ve_plugin
  install -Dvm755  "${srcdir}/uup-converter.sh"   "${pkgdir}/usr/bin/uup-converter"

  _docfiles=(
    "${srcdir}/git.log"
    readme.md
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
