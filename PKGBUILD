# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=latency-tracker
pkgname=latency-tracker-git
pkgver=r413.465baa6
pkgrel=1
pkgdesc="Kernel module to track latencies between 2 events with timeout"
arch=('i686' 'x86_64')
url="https://github.com/efficios/latency-tracker"
license=('LGPL' 'MIT')
depends=('linux-rt')
makedepends=('git' 'linux-rt-headers')
install=${_pkgbasename}.install
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/efficios/latency-tracker.git")
md5sums=('SKIP')

pkgver() {
		cd "${srcdir}/${_pkgbasename}"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	make DESTDIR=$pkgdir
}

package() {
  cd "${srcdir}/${_pkgbasename}"
		for i in $(ls -d /usr/lib/modules/extramodules* | grep rt); do
			echo installing extra modules for detected rt kernel in: $i
			install -d "${pkgdir}/$i/latency-tracker"
			install -m644 *.ko "${pkgdir}/$i/latency-tracker"
		done  
}

