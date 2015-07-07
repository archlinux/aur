# Maintainer: Foivos S. Zakkak <foivos at zakkak dot net>

pkgname=likwid-svn
pkgver=467M
pkgrel=1
pkgdesc="Lightweight performance tools"
arch=('i686' 'x86_64')
url="http://likwid.googlecode.com"
license=('GPLv3')
depends=()
makedepends=('subversion' 'make' 'gcc')
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'gnuplot: for likwid-perfscope'
            'feedgnuplot-git: for likwid-perfscope')
source=("$pkgname::svn+http://likwid.googlecode.com/svn/trunk")
sha256sums=('SKIP')
conflicts=(likwid, feedgnuplot-git)
provides=('likwid-topology'
          'likwid-perfctr'
          'likwid-pin'
          'likwid-bench'
          'likwid-mpirun'
          'likwid-powermeter'
          'likwid-memsweeper'
          'likwid-features')

pkgver() {
  cd "$pkgname"
  svnversion
}

build() {
  cd "$pkgname"

  sed -i -e "s,^\(PREFIX *= *\).*$,\1/usr#NOSPACE," \
      -e "s,^\(MANPREFIX *= *\$(PREFIX)\).*$,\1/share/man#NO SPACE," \
      -e "s,^\(ACCESSDAEMON *= *\$(PREFIX)\)/sbin\(.*\)$,\1/bin\2," config.mk
  sed -i "s,/sbin,/bin," Makefile

  make
}

package() {
  cd "$pkgname"
  make PREFIX="${pkgdir}/usr" install
}
