# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="quectel-cm"
_pkgname="${_projectname}"
pkgname="${_pkgname}-git"
pkgver=1.6.0.24.r3_kmilo17pet.20210805.2c623ff
pkgrel=2
pkgdesc="Quectel Connect Manager tool. For Quectel WWAN modems."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)

_gitprotocol='git+https'
_githost='github.com'
_gituser='kmilo17pet'
#_gituser='bonbon2106'  # If this is used, needs to set `CC=gcc` or similar.
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("LicenseRef-Public-Domain_only_for_Quectel-Customers")
depends=(
  'glibc'
  'net-tools' # for 'ifconfig'
)
makedepends=(
  'git'
)
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}"
  "COPYING.txt"
)
sha256sums=(
  'SKIP'
  '8efed9485ecc8167d33dbfab508db3cd1e33d1d17347a0e94e8ed03558630d32'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|^xasm-||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _ver="$(grep -iE '^[[:space:]]*\[V[0-9a-z\._-]*\]' ReleaseNote.txt | head -n1 | sed -E -e 's|^[[:space:]]*\[V([0-9a-z\._-]*)\].*$|\1|' | tr '-' '.')"
  _fork="${_gituser}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}_${_fork}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> building ..."
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."

  install -Dvm755 -t "${pkgdir}/usr/bin"  quectel-CM quectel-mbim-proxy quectel-qmi-proxy
  ln -svr "${pkgdir}/usr/bin/quectel-CM" "${pkgdir}/usr/bin/quectel-cm"


  _docfiles=(
    "${srcdir}/git.log"
    README.md
    ReleaseNote.txt
  )
  _licensefiles=(
    "${srcdir}/COPYING.txt"
    "${srcdir}/${_pkgname}/NOTICE"
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
