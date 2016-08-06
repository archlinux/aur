# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_gitname=libstrangle
# shellcheck disable=SC2034
pkgname=libstrangle-git
# shellcheck disable=SC2034
pkgdesc="Simple FPS Limiter"
# shellcheck disable=SC2034
pkgver=r43.5f0f377
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
makedepends=('gcc-multilib')

# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('libstrangle')
# shellcheck disable=SC2034
conflicts=('libstrangle')
# shellcheck disable=SC2034
license=('GPL3')
url="https://github.com/torkel104/libstrangle.git"
# shellcheck disable=SC2034
install=libstrangle.install
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}"
        'libstrangle.install'
        '00-defer-ldconfig.patch'
        '01-fix-prefix.patch'
        '02-link-libdl.patch'
        )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'db3268bccb1444d87a5216ecbf1ead656289923e599b0a883817fe52bfd0f1e7'
            '40ca981cebef416abaa80247bc0a11b9bbf9e71e14172b178596c540aad9394b'
            'e42f778b669531493d5528df1848e3fc25510c472bcf56214336232d3e22507d'
            '97843d9d4af7ab2f81c02f9e9e3f74d253d044ccd57917f5cd28e92b21426a10')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Couldn't cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Resolve the version via git commit count
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Couldn't cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Apply patches

  # Move ldconfig out of the make file, we will run it at install
  patch -p1 -i "${srcdir}/00-defer-ldconfig.patch"

  # Fix the prefix from /usr/local to /usr
  patch -p1 -i "${srcdir}/01-fix-prefix.patch"

  # Link against the libdl
  patch -p1 -i "${srcdir}/02-link-libdl.patch"
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Couldn't cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Install to the $pkgdir as DESTDIR
  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install
}
