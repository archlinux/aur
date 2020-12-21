# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=worker
pkgver=4.6.1
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('f5977bc2c84c1eebb0058d63c7d10a0b39fa3c3bace09b6adac82f6a17bd9df8b1e2ba8138d764899895b69493493245cb6f7aff15014471a109a023fe203e57'
            'caacd8b94d8f30f081a06a2bac1f9c26cba95ce5a1ca4878b638970773b9e492c5342fbb15e2628aed483864b8ec86afb7ff0ebc3ec501dea256b7b658b1d123')

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
