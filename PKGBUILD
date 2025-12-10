# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname='thunk_gen'
_gitname='stsp'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.8.r67.20251203.27b4a8e
pkgrel=1
pkgdesc="Thunk generator for C and assembler code."
arch=(
  'x86_64'
  'i686'
  'aarch64'
)
url="https://github.com/${_gitname}/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'bash'
  'glibc'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)
checkdepends=(
  'meson'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
# options+=('!strip')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  cd "${srcdir}"

  meson setup --prefix=/usr --buildtype=plain "${_pkgname}" build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E -e "^[[:space:]]*project[[:space:]]*\([[:space:]]*'thunk_gen'" meson.build | sed -E -e 's|^.*version:[[:space:]]*(.*)[[:space:],\)]|\1|' | tr -d \'\")"
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
  cd "${srcdir}"

  meson compile -C build
}

check() {
  cd "${srcdir}"

  meson test -C build
}

package() {
  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"

  cd "${srcdir}/${_pkgname}"

  for _docfile in 'git.log' 'README.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in LICENSE; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done

}
