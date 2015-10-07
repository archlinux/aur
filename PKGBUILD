# Contributor: Andreas Boehler <andy dot boehler at gmx dot at>
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_gitname=mbm-gpsd
pkgname="${_gitname}-git"
pkgver=r46.cf61a6c
pkgrel=1
pkgdesc="GPS support files for Ericsson F3507g that provide an easy interface to gpsd"
arch=('i686' 'x86_64')
url="http://mbm.sourceforge.net/"
license=('GPL')
depends=('networkmanager' 'network-manager-applet' 'intltool' 'gtk-doc' 'libnl1')
makedepends=('git')
provides=("${_gitname}")
source=(
"git://mbm.git.sourceforge.net/gitroot/mbm/${_gitname}/"
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
}
md5sums=('SKIP'
         '1e1d4280d88490d2a14b7e076f29302a')
