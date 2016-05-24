# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=libstrangle-git
_gitname=libstrangle
pkgdesc="Simple FPS Limiter"
pkgver=r18.ce1bfe7
pkgrel=1
arch=('any')
makedepends=('gcc-multilib')

depends=()
optdepends=()
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
url="https://github.com/torkel104/libstrangle.git"
install=libstrangle.install
source=("${_gitname}::git+https://github.com/pyamsoft/libstrangle.git#branch=arch-build-unsupported-upstream"
        'libstrangle.install'
        '00-defer-ldconfig.patch'
        '01-fix-prefix.patch')
sha256sums=('SKIP'
            'db3268bccb1444d87a5216ecbf1ead656289923e599b0a883817fe52bfd0f1e7'
            '153ca9f521f014c2cdecc13ed60b8ab57321f02032abb004cd202e8e86a39baf'
            'bcd624c8c03ac2ab734e8e1e2678d4712d54ec721129576bc925a137898b1190')

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
