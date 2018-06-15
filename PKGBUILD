# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=likwid-git
pkgver=r1606
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
            'openmpi: for likwid-mpirun')
conflicts=('likwid' 'likwid-svn')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/likwid
	echo "r"$(git rev-list --count master)
}

build() {
  cd ${srcdir}/likwid
	sed -i "13s:/usr/local:/usr:; 25s:/man:/share/man:; 58s:/sbin:/bin:; 59s:/sbin:/bin:" config.mk
  sed -i "s:/sbin:/bin:" Makefile
  make
}

package() {
  cd ${srcdir}/likwid
  make PREFIX="${pkgdir}/usr" install

  # license
  install -Dm644 ${srcdir}/likwid/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
