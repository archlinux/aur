# Maintainer: dreieck

_pkgname='deodexer'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.2.r9.20180513.89db6e6
pkgrel=1
pkgdesc="A simple tool that uses vdexExtractor to deodex Android 8.0+ ROMs."
arch=(
  'any'
)
license=('GPL-3.0-or-later')
url='https://github.com/chenxiaolong/deodexer'
depends=(
  'python>=3'
  'sh'
  'vdex-extractor'
  'zipalign'
)
makedepends=(
  'git'
)
optdepends=()
replaces=()
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  "${_pkgname}::git+${url}.git"
  'deodexer.sh'
)
sha256sums=(
  'SKIP'                                                              # Main git source
  'd3bce1de57a0f58657e2e8c0ee959d06e816fe5ef68b1df00a66d665b586fb05'  #  deodexer.sh
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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

  # Install software.
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}"  'deodexer.py'
  install -Dvm755 "${srcdir}/deodexer.sh"  "${pkgdir}/usr/bin/deodexer"

  # Install documentation.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/git.log" 'README.md'

  # Install license.
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
