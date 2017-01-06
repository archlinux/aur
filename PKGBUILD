# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_gitname=libstrangle
# shellcheck disable=SC2034
pkgname=libstrangle-git
# shellcheck disable=SC2034
pkgdesc="Simple FPS Limiter"
# shellcheck disable=SC2034
pkgver=r60.c834bec
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
        )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'db3268bccb1444d87a5216ecbf1ead656289923e599b0a883817fe52bfd0f1e7'
            '40ca981cebef416abaa80247bc0a11b9bbf9e71e14172b178596c540aad9394b'
            '318401eaeeba7f87a304fda8b680ff45c9bcb266df1b5ea16477730b08ea106b')

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
