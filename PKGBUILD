# Based on nss-mdns pkg by
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Travis Willard <travis@archlinux.org>
# adds an automatic search name.local when name containss
# no . thus allowing domainless searches

pkgname=nss-mdns-domainless
pkgver=0.10
pkgrel=7
pkgdesc="glibc plugin providing host name resolution via mDNS (domainless allowed for .local)"
arch=('i686' 'x86_64' 'armv7h')
url="http://0pointer.de/lennart/projects/nss-mdns/"
license=('LGPL')
depends=('glibc')
conflicts=('nss-mdns')
provides=("nss-dns=${pkgver}-${pkgrel}")
install=nss-mdns.install
source=("http://pkgs.fedoraproject.org/repo/pkgs/nss-mdns/nss-mdns-$pkgver.tar.gz/03938f17646efbb50aa70ba5f99f51d7/nss-mdns-$pkgver.tar.gz"
		"search-local.patch"
		)
md5sums=('03938f17646efbb50aa70ba5f99f51d7'
		'c8b707747ddaeb5c8ed3859e1aa6fa15'
		)
prepare(){
	local d=${srcdir}/${pkgname}-${pkgver}
	[ ! -h "$d" ] && ln -s ${pkgname%-domainless}-${pkgver} "$d"
	[ ! -d "$d" ] && echo "!!!!! cannot locate dir '$d'" && exit 666
	patch -Np0 -i "$srcdir/search-local.patch"
	}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-lynx
  make
}

package() {
  make -C"${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
