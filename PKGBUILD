# Contributor: Andreas Boehler <andy dot boehler at gmx dot at>
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_gitname=mbm-gpsd
_ghuser=pl4nkton
pkgname="${_gitname}-${_ghuser}-git"
pkgver=r51.4e8c57a
pkgrel=1
pkgdesc="GPS support files for Ericsson F3507g that provide an easy interface to gpsd (${_ghuser} fork with build fixes)"
arch=('i686' 'x86_64')
url="https://github.com/pl4nkton/mbm-gpsd"
license=('GPL')
depends=('networkmanager' 'network-manager-applet' 'intltool' 'gtk-doc' 'libnl1')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/${_ghuser}/${_gitname}.git/"
mbm-gpsd.service
)

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	unset CFLAGS
	unset CXXFLAGS
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make CFLAGS="-Wno-error"
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}" install
	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	cp "${srcdir}/mbm-gpsd.service" "${pkgdir}/usr/lib/systemd/system/"
	mv "${pkgdir}/var/run" "${pkgdir}/run"
	mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/var" "${pkgdir}/usr/sbin/"
}
md5sums=('SKIP'
'1c4fd254cd00834f644ab614a76f5c96')
md5sums=('SKIP'
         'c436e8bcf6b459f8f939e434aed0b9d4')
