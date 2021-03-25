# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=alternatives
pkgver=1.15
pkgrel=1
pkgdesc="A tool to maintain symbolic links determining default commands."
arch=('i686' 'x86_64')
url="https://github.com/fedora-sysv/chkconfig"
license=('GPL2')
depends=()
makedepends=()
checkdepends=('beakerlib')
conflicts=('chkconfig')
source=("https://github.com/fedora-sysv/chkconfig/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eac2af3e7fc42a3a60b28e04d98dcfbc5c5cb7f51eb02cb71329b6b71ef99d6e')

_srcdir="chkconfig-${pkgver}"

build() {
	cd "${_srcdir}"
	make alternatives
	
	cd "po"
	make
}

check() {
	cd "${_srcdir}"
	make check
}

package() {
	cd "${_srcdir}"
	
	install -dm755 "${pkgdir}/etc/alternatives"
	install -Dm755 "alternatives" -t "${pkgdir}/usr/bin/"
	ln -s "alternatives" "${pkgdir}/usr/bin/update-alternatives"
	install -dm755 "${pkgdir}/var/lib/alternatives"
	
	# Install manual
	pushd "po" && make DESTDIR="${pkgdir}" install && popd
	install -Dm644 "alternatives.8" -t "${pkgdir}/usr/share/man/man8"
	ln -s "alternatives.8" "${pkgdir}/usr/share/man/man8/update-alternatives.8"
	
	install -Dpm644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
