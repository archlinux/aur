# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.12.1
pkgrel=3
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils')
options=('!libtool')
source=(
	http://rofi.roger-ferrer.org/eiciel/files/${pkgname}-${pkgver}.tar.bz2
	rename_attr-xattr_to_sys-xattr.patch
	gnome-3.36_avoid_cpp_nautilus-extension.patch::https://src.fedoraproject.org/rpms/eiciel/raw/39db553efacba0ed9272a533b829b3ba8d8ac315/f/eiciel-0.9.12.1-nautilus-exports.patch
)
sha512sums=('f54fbb149eed7f8fd534b77ec5e2d0f579c68a39afd7417a2298d75c7e95c459b49fc8ccb66d0188956ffaadf3bcc8a3eb048425cb82fc875573eb131f4b0494'
            'db612691b1fae68b476d1d244d6bd3e54a770994a50c7f3644c87da9dfe6b0ae4fc1d5a9b0f02b8ea4d3d8a7e8ff46178fe605e9ff283eeeed50d1c21cf84b53'
            'b391287588a9383fa051926a2597bff97bea70015efe2b427d51286a8087a4e4ed8afd677484799bb77eaaaf02cabb97742a8a8f2b539c0819d47e8424c0f845')


prepare() {
	msg2 "Applying: rename attr/xattr -> sys/xattr"
	patch -p1 < rename_attr-xattr_to_sys-xattr.patch

	msg2 "Applying: gnome-3.36 - avoid C++ nautilus-extension (instead use extern C)"
	patch -p0 < gnome-3.36_avoid_cpp_nautilus-extension.patch

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
