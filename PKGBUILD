# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=stfl-git
pkgver=0.24.r4.gcc355eb
pkgrel=1
provides=('stfl')
conflicts=('stfl')
pkgdesc="Fork of stfl which adds a few bugfixes"
arch=('x86_64')
url="https://github.com/dennisschagt/stfl"
license=('GPL3')
depends=('ncurses')
makedepends=('git' 'patch' 'swig')
source=("${pkgname}::git+https://github.com/dennisschagt/stfl.git#branch=master"
        stfl-archlinux.patch)
sha256sums=('SKIP'
            'c7d7c787bcd287a776aad3b26e6a90a3b121c281125c34c7c35a87f36dcdc453')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 -i "${srcdir}"/stfl-archlinux.patch

  make prefix=/usr Makefile.deps
  make prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}"

  make prefix=/usr DESTDIR="${pkgdir}" install

#library symlink - FS#34890
  ln -s "/usr/lib/libstfl.so.0.24" "${pkgdir}"/usr/lib/libstfl.so.0
}
