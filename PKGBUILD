# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgname=wayland-git
pkgver=1.13.90.2010.9b78be6
pkgrel=1
pkgdesc='A computer display server protocol.'
arch=(i686 x86_64)
url='http://wayland.freedesktop.org'
provides=("wayland=${pkgver}")
license=('MIT')
depends=('libffi' 'libxml2' 'expat')
makedepends=('git')
conflicts=('wayland')
source=(git://anongit.freedesktop.org/wayland/wayland)
sha1sums=('SKIP')

pkgver() {
	cd wayland

	for i in major_version minor_version micro_version; do
		local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
	done

	echo $_major_version.$_minor_version.$_micro_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
    cd wayland

    ./autogen.sh --prefix=/usr \
				 --disable-documentation \
				 --disable-static
    make
}

package() {
    cd wayland
    make DESTDIR="${pkgdir}" install
    install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
