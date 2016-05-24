# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=libstrangle-git
_gitname=libstrangle
pkgdesc="Simple FPS Limiter"
pkgver=r34.d945339
pkgrel=1
arch=('x86_64')
makedepends=('gcc-multilib')

depends=()
optdepends=()
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
url="https://github.com/torkel104/libstrangle.git"
install=libstrangle.install
source=("${_gitname}::git+${url}"
        'libstrangle.install'
        '00-defer-ldconfig.patch'
        '01-fix-prefix.patch')
sha256sums=('SKIP'
            'db3268bccb1444d87a5216ecbf1ead656289923e599b0a883817fe52bfd0f1e7'
            '40ca981cebef416abaa80247bc0a11b9bbf9e71e14172b178596c540aad9394b'
            'e42f778b669531493d5528df1848e3fc25510c472bcf56214336232d3e22507d')

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Resolve the version via git commit count
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Apply patches

  # Move ldconfig out of the make file, we will run it at install
  patch -p1 -i "${srcdir}/00-defer-ldconfig.patch"

  # Fix the prefix from /usr/local to /usr
  patch -p1 -i "${srcdir}/01-fix-prefix.patch"
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install to the $pkgdir as DESTDIR
  make DESTDIR="${pkgdir}" install
}
