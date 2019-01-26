# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=nrsc5-git 
pkgver=r233.6c64409
pkgrel=2
pkgdesc="NRSC-5 (HD Radio) receiver for rtl-sdr"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/theori-io/nrsc5"
license=('GPL')
depends=('rtl-sdr' 'fftw' 'libao')
makedepends=('git' 'cmake') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

#use this for experimental branch
#source=('nrsc5::git+https://github.com/theori-io/nrsc5.git#branch=experimental')
#or this for the master branch 
source=('nrsc5::git+https://github.com/theori-io/nrsc5.git#branch=master')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	
	#CPU optimizations
	if $(grep -q 'sse3' -i /proc/cpuinfo); then
		_sse3="ON"
	else
		_sse3="OFF"
	fi
	if $(grep -q 'neon' -i /proc/cpuinfo); then
		_neon="ON"
	else
		_neon="OFF"
	fi

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_NEON="${_neon}" -DUSE_SSE="${_sse3}" .
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
