# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=worker
pkgver=4.4.0
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('57e8aa383755b0bb9125da984f3b409c0ec12fbf5b7cb5b2f6ac490be6a9d8b798d4f34a4efc6451bd313bdf4167db3251354803c7d6818277056a5e346d23ce'
            '0422772dfdd6fdd10f5a949caee97acc39c9926d31e5b1fdd020372af64c3b8a175551894bf2179800cd2dc65704065c82536d175c43f081e88219c7adcdeac5')


validpgpkeys=('F9299EE90A729029E71AF26B667132D0FBC52B37') # Ralf Hoffmann


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # We need to disable the optimizations because of a bug in gcc
  # (see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63140 for details)
  # Ralf added a gcc constraint check to avoid compiling bad optimized code.
  # Because we run a recent version of gcc, we disable the check, and
  # disable also the compiler optimizations completely. Because the code
  # uses some C++11 features, we need to set this explicitly.
  #
  # To bypass the pthread bug, the LDFLAGS is set here explicit until
  # the bug is solved. See here for more detail and progress:
  # https://sourceforge.net/p/workerfm/mailman/message/34136485/
  CPPFLAGS="-O0 -std=gnu++14" LDFLAGS=-pthread ./configure --enable-xft --prefix=/usr --disable-cxx-check

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
