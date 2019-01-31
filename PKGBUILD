# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=worker
pkgver=3.15.4
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('3ab508005eb192200e3e656c21ab816f8a6a4c311d1347b0a57171a2ab4b507d43975abc71711e0628614908b4effe7c146b76282de063e50b057b28f8924145'
            '96ffdca596b43b5df675d4b4821bc890d1f4296babb488eacd614a07d08866f870e9fb2bf8069ffbeafdd9257ddea1af3b29a1dcdc165e3af8190ee1ba5f1a3b')

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
  CPPFLAGS="-O0 -std=gnu++11" LDFLAGS=-pthread ./configure --enable-xft --prefix=/usr --disable-cxx-check

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
