# Maintainer: éclairevoyant
# Contributor: Kyle Keen <keenerd at gmail dot com>

pkgname=libvolk-git
pkgver=3.0.0.r18.4ed9334
pkgrel=1
pkgdesc="The Vector-Optimized Library of Kernels from Gnuradio"
arch=(i686 x86_64)
url="https://libvolk.org/"
license=(GPL3)
depends=(boost-libs gcc-libs orc python-six)
makedepends=(boost cmake git python-mako)
provides=("libvolk=${pkgver%%.r*}")
conflicts=(libvolk)
source=("$pkgname::git+https://github.com/gnuradio/volk.git"
        "git+https://github.com/google/cpu_features.git")
b2sums=('SKIP'
        'c2784a6e4b9eab658acc7f967f0ca869148da9d0c75f0df7130ff585b17fb8600a755784aa3eccec80005a8900448be379b92c6c92e0dcce8491fac6a59e7dd2')

prepare() {
	cd $pkgname
	git submodule init
	git config submodule.cpu_features.url "$srcdir/cpu_features"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $pkgname \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

check() {
	export PYTHON=python3
	if [[ "$CARCH" == "x86_64" ]]; then
		make -C build test
	fi
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
