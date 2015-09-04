pkgname=tano
pkgver=1.2.1
pkgrel=2
pkgdesc="An open-source cross-platform IP TV player based on Qt and libvlc"
arch=('i686' 'x86_64')
url="http://projects.tano.si/en/player"
license=('GPL')
depends=('libvlc-qt>=0.8.0')
makedepends=('cmake>=2.8.6')
source=("http://sourceforge.net/projects/tano/files/Tano%20Player/$pkgver/${pkgname}_${pkgver}_src.tar.gz")
md5sums=('2d62faa5b8624b13ea9e1df66d64c05c')

_optimal_make_jobs() {
	if [ -r /proc/cpuinfo ]; then
		local core_count=$(grep -Fc processor /proc/cpuinfo)
	else
		local core_count=0
	fi

	if [ $core_count -gt 1 ]; then
		echo -n $[$core_count-1]
	else
		echo -n 1
	fi
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	msg 'Running cmake...'
        cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDEFAULT_DATA_DIR=/usr/share/tano -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4

	msg 'Running make...'
	make -j$(_optimal_make_jobs)
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
