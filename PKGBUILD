# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=relion-git
pkgver=r124.ce6420a
pkgrel=1
pkgdesc="REgularised LIkelihood OptimisatioN: employs an empirical Bayesian approach to refinement of 3D reconstructions or 2D class averages in electron cryo-microscopy"
arch=(x86_64)
url="https://github.com/3dem/relion"
license=('GPL')
depends=('fftw' 'tcsh' 'openmpi' 'fltk' 'cuda' 'evince')
optdepends=('ctffind4' 'gctf' 'unblur' 'summovie' 'resmap' 'motioncor2')
makedepends=('git' 'cmake' 'gcc')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}" 'relion')
source=("git+https://github.com/3dem/relion" "relion.sh" "relion.csh")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/relion"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/relion"
	mkdir -p build
	cd build	
	_NPROC=$(nproc --all)
#	export CC=/usr/bin/gcc-5
#	export CXX=/usr/bin/g++-5
	cmake ..
	make -j $_NPROC
}

package() {
	cd "$srcdir"
	install -d $pkgdir/opt/relion/bin  $pkgdir/opt/relion/lib $pkgdir/etc/profile.d/
#	cp -r * $pkgdir/opt/relion/.
	install -D -m755 $srcdir/relion/build/bin/* $pkgdir/opt/relion/bin/.
	install -D -m755 $srcdir/relion/build/lib/* $pkgdir/opt/relion/lib/.
	install -D -m755 $srcdir/relion.* $pkgdir/etc/profile.d/.
}
