# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.12.1
pkgrel=2
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils')
options=('!libtool')
source=(
	http://rofi.roger-ferrer.org/eiciel/files/${pkgname}-${pkgver}.tar.bz2
	configure.ac.patch
	configure.patch
	xattr_manager.hpp.patch	
)
sha512sums=('f54fbb149eed7f8fd534b77ec5e2d0f579c68a39afd7417a2298d75c7e95c459b49fc8ccb66d0188956ffaadf3bcc8a3eb048425cb82fc875573eb131f4b0494'
            '8b20cdd57f73c13c429ba37a1196eae60eae3af64de28687c51ea52ec5a696e32ad045d544db157a810b4ad290b47827a4c81b0201e31ec20508a9dfc78d346b'
            '04daf4f326e51a9013f409064ee00714ecfc5870617b866a094dc33a04d84680d54ada3e8b0df722ca34262a06e5f96ca57f111621592d44b9dc11592cade2c2'
            '926461f759663b3329323665834473a4e3e3a8e64ae9fdf8456d2e972ab33a24f57cb066ca9a8fa2a4bbbafad0e160bb45b06c16179139051bf9bb11384c619a')


prepare() {
	msg2 "Applying fast fix (v1) for: attr/xattr->sys/xattr"
	patch -p1 < $srcdir/configure.ac.patch
	patch -p1 < $srcdir/configure.patch
	patch -p1 < $srcdir/xattr_manager.hpp.patch	

	cd "${srcdir}/${pkgname}-${pkgver}"
	msg2 "Applying fast fix for: aclocal>1.15"
	aclocal
	msg2 "Applying fast fix for: automake>1.15"
	automake
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  CXXFLAGS="-std=c++11"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
