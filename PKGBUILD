# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: stefphd (https://aur.archlinux.org/account/stefphd)

_pkgname=resticpy
pkgname="${_pkgname}-git"
pkgver=1.1+3.r41.20220623.b52b1a0
pkgrel=1
pkgdesc="A Python wrapper for Restic (<https://restic.net/>) using a json configuration file."
arch=('any')
url="https://github.com/stefphd/ResticPy"
license=('GPL3')
depends=(
  'python>=3'
  'restic'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=(
  "${_pkgname}=1.2.1"
  "${_pkgname}<1.1+3.r41.20220623.b52b1a0"
) # Because this package was wrongly named `resticpy` (i.e. without `-git` suffix) beforehand.
source=("${_pkgname}::git+https://github.com/stefphd/ResticPy.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

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

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 "resticpy" "${pkgdir}/usr/bin/resticpy"

  for _docfile in 'git.log' 'example.json' 'README.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
