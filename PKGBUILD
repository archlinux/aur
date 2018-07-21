# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of mate-utils package.
# https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/mate-utils

pkgname=mate-search-tool
__pkgname=mate-utils
pkgver=1.20.1
pkgrel=1
pkgdesc="Utility to search for files. Fork of gnome-search-tool, separated from MATE utils."
url="http://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=('gtk3' 'libsm')
makedepends=('intltool' 'itstool' 'libgtop')
conflicts=('mate-utils' 'gnome-search-tool')
provides=('gnome-search-tool')
source=(
	"https://pub.mate-desktop.org/releases/${pkgver%.*}/${__pkgname}-${pkgver}.tar.xz"
	"build-only-gsearchtool.patch"
	"dont-read-mate-setting.diff"
	"i-dont-need-help.patch"
)
sha256sums=(
	"6a1e0bba9c117f8ce81bb271d2182006524250fe9e31f2fc904f6403453020cf"
	"4cb1c2b986659859fbc5cfa6659026025d6785d4189a6b9964c965eba3987670"
	"94fd8ebd909886214f02688b04140d62c47f383bb8746b57bd8e92da1176b005"
	"af54d55508428deec00989966c36d5e00d8e7db61cf6e31febd3b636957bc755"
)

prepare()
{
	cd ${__pkgname}-${pkgver}

	patch -p0 -i "$srcdir/build-only-gsearchtool.patch"
	patch -p0 -i "$srcdir/dont-read-mate-setting.diff"
	patch -p0 -i "$srcdir/i-dont-need-help.patch"
}

build()
{
	cd ${__pkgname}-${pkgver}
	./configure \
		--prefix=/usr --libexecdir=/usr/lib/${_pkgbase} --sysconfdir=/etc \
		--enable-gdict-applet=no --enable-gtk-doc=no \
		--disable-maintainer-flags --disable-schemas-compile

	# https://bugzilla.gnome.org/show_bug.cgi?id=656231
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
}

package()
{
	cd ${__pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install

	cd ${pkgdir}/usr/bin
	ln -s mate-search-tool gnome-search-tool
}
