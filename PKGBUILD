# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=nrsc5-git 
pkgver=r64.2480c15
pkgrel=1
pkgdesc="NRSC-5 (HD Radio) receiver for rtl-sdr"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/theori-io/nrsc5"
license=('GPL')
depends=('rtl-sdr' 'fftw' 'libao')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('nrsc5::git+https://github.com/theori-io/nrsc5.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	#CPU optimizations
	_use_sse="OFF"
	_use_neon="OFF"
	if $(grep -q 'sse' -i /proc/cpuinfo); then
		_use_sse="ON"
	fi
	if $(grep -q 'neon' -i /proc/cpuinfo); then
		_use_neon="ON"
	fi
	cmake -DUSE_NEON="${_use_neon}" -DUSE_SSE="${_use_sse}" -DCMAKE_INSTALL_PREFIX=/usr
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
