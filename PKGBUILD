# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=likwid-git
pkgver=r793
pkgrel=1
pkgdesc="Lightweight performance tools"
url="https://github.com/rrze-likwid/likwid"
arch=('x86_64' 'i686')
source=('git+https://github.com/RRZE-HPC/likwid.git')
license=('GPLv3')
depends=('lua' 'hwloc' 'perl-template-toolkit')
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
  sed -i "12s:/usr/local:/usr:; 13s:/man:/share/man:; 31s:/sbin:/bin:; 32s:/sbin:/bin:" config.mk
  sed -i "s:/sbin:/bin:" Makefile
  make
}

package() {
  cd ${srcdir}/likwid
  make PREFIX="${pkgdir}/usr" install

  # license
  install -Dm644 ${srcdir}/likwid/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
