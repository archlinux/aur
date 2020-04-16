# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=hepmc3
pkgver=3.2.1
pkgrel=3
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators."
arch=('x86_64' 'i686')
url="http://hepmc.web.cern.ch/hepmc/"
license=('GPL3')
makedepends=('cmake')
optdepends=('root: ROOT I/O support')
source=("https://hepmc.web.cern.ch/hepmc/releases/HepMC3-${pkgver}.tar.gz"
        "https://gitlab.cern.ch/hepmc/HepMC3/-/commit/ba38f14d8f56c16cc4105d98f6d4540c928c6150.diff"
        "https://gitlab.cern.ch/hepmc/HepMC3/-/commit/090f0ab74fe7b19e96d0ce9f8fb7fe11a7046fec.diff"
        )
noextract=()
md5sums=('8cc6cc4f13fdf8be9ed677924daea250'
         'd8635566838595ff7d5884f0294bb960'
         '0d4842ad423c1e558cb888711902b275')

build() {
        cd "$srcdir/HepMC3-$pkgver"
        # bugfix for compilation with gcc>=9.2.1
        patch -p1 < ../ba38f14d8f56c16cc4105d98f6d4540c928c6150.diff
        # bugfix for crash in cross section class
        patch -p1 < ../090f0ab74fe7b19e96d0ce9f8fb7fe11a7046fec.diff
        
        mkdir -p build
        cd build
        cmake ../ -DROOT_DIR=/usr -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
        make
}

package() {
        cd "$srcdir/HepMC3-$pkgver"
        cd build
	make DESTDIR="$pkgdir/" install
}
