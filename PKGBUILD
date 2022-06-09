# Maintainer: Dylan Delgado <dylan1496@live.com>
pkgname=sherpa-git
pkgver=v3.0.0alpha1.r354.g21a28e795
pkgrel=1
pkgdesc="A particle physics package for Monte Carlo simulation of collider events - git version"
arch=('x86_64' 'i686')
url="http://sherpa.hepforge.org"
conflicts=('sherpa')
provides=('sherpa')
license=('GPL3')
depends=('lhapdf' 'fastjet' 'hepmc' 'hepmc2' 'openmpi' 'openloops' 'rivet')
source=('git+https://gitlab.com/sherpa-team/sherpa.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sherpa"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir/sherpa"
        autoreconf -i
	./configure --prefix=/usr --enable-hepmc2=/usr --enable-hepmc3=/usr --enable-fastjet=/usr --enable-lhapdf=/usr --enable-lhole --enable-openloops=. --enable-mpi --enable-openloops=/usr/lib/openloops --enable-rivet=/usr CXXFLAGS=-std=c++11
	make
}

package() {
	cd "$srcdir/sherpa"
	make DESTDIR="$pkgdir/" install
        for i in init_nlo.sh plot_stats.sh; do
            mv $pkgdir/usr/bin/$i $pkgdir/usr/share/SHERPA-MC/
        done
}
