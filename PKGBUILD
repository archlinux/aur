# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=likwid-git
pkgver=r2040
pkgrel=1
pkgdesc="Lightweight performance tools"
url="https://github.com/rrze-likwid/likwid"
arch=('x86_64' 'i686')
source=('git+https://github.com/RRZE-HPC/likwid.git')
license=('GPLv3')
depends=('lua' 'hwloc')
makedepends=('gcc' 'make' 'perl')
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'gnuplot: for likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'cuda: for cuda interface' )
conflicts=('likwid' 'likwid-svn')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/likwid
	echo "r"$(git rev-list --count master)
}

build() {
  cd ${srcdir}/likwid
	sed -i "14s:/usr/local:/usr:; 46s:/man:/share/man:;" config.mk
	sed -i "s:/sbin:/bin:" config.mk
  sed -i "s:/sbin:/bin:" Makefile
  make
}

package() {
  cd ${srcdir}/likwid
  make PREFIX="${pkgdir}/usr" install

  # license
  install -Dm644 ${srcdir}/likwid/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
