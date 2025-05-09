# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=alternatives
pkgver=1.33
pkgrel=1
pkgdesc="Fedora's tool to maintain symbolic links determining default commands."
arch=('i686' 'x86_64')
url='https://github.com/fedora-sysv/chkconfig'
license=('GPL-2.0-only')
depends=()
makedepends=()
checkdepends=('beakerlib')
conflicts=('chkconfig' 'dpkg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fedora-sysv/chkconfig/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c973a38d46d75ab2b411ab141e4c320a66dc4cc98832c3f2f6c5999531057861')

_srcdir="chkconfig-${pkgver}"

build() {
	cd "${_srcdir}"
	make alternatives

	cd 'po'
	make
}

check() {
	cd "${_srcdir}"
	make check
}

package() {
	cd "${_srcdir}"

	install -dm755 "${pkgdir}/etc/alternatives"
	install -Dm755 'alternatives' -t "${pkgdir}/usr/bin/"
	ln -s 'alternatives' "${pkgdir}/usr/bin/update-alternatives"
	install -dm755 "${pkgdir}/var/lib/alternatives"

	# Install manual
	pushd 'po' && make DESTDIR="${pkgdir}" install && popd
	install -Dm644 "alternatives.8" -t "${pkgdir}/usr/share/man/man8"
	ln -s 'alternatives.8' "${pkgdir}/usr/share/man/man8/update-alternatives.8"

	install -Dpm644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
