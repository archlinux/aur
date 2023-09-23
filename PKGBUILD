# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Peter Lamby

_gitname='bs2b'
_pkgname="deadbeef-${_gitname}"
pkgname="${_pkgname}-git"
epoch=0
pkgver=r11.lib3.1.0.date20200322.git5200eae
pkgrel=1
pkgdesc="bs2b plugin for the DeaDBeeF music player."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/DeaDBeeF-Player/bs2b"
license=('Custom')
depends=(
  'deadbeef'
  'glibc'
  'libbs2b'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}<=11.5200eae") # Actually, 'deadbeef-bs2b' was the previous name of this package, while it always has been a `-git` package it was wrongly named. Thats why this replace line is here. 'deadbeef-bs2b' (as a wrongly named GIT package) is going to be removed, so 'deadbeef-bs2b-git' should replace it.
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _libver="$(ls -d 'libbs2b-3.1.0' | awk -F- '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  elif [ -z "${_libver}" ]; then
    error "libbs2b version could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.lib${_libver}.date${_date}.git${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm 755 d'db_bs2b.so' "$pkgdir/usr/lib/deadbeef/ddb_bs2b.so"

  install -Dvm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
