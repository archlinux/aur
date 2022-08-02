# Based on nss-mdns pkg by
# Maintainer: Robin Becker <robin@reportlab.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Travis Willard <travis@archlinux.org>
# adds an automatic search name.local when name containss
# no . thus allowing domainless searches

pkgname=nss-mdns-domainless
pkgver=0.15.1
pkgrel=1
pkgdesc="glibc plugin providing host name resolution via mDNS (domainless allowed for .local)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://0pointer.de/lennart/projects/nss-mdns/"
license=('LGPL')
depends=('glibc')
conflicts=('nss-mdns')
provides=("nss-dns=${pkgver}-${pkgrel}")
install=nss-mdns.install
source=("https://github.com/lathiat/nss-mdns/releases/download/v$pkgver/nss-mdns-$pkgver.tar.gz"
		"search-local.patch"
		)
sha256sums=(
		'ddf71453d7a7cdc5921fe53ef387b24fd0c3c49f4dcf94a2a437498596761a21'
		'99174415719b247c7ce6947a80544a5c9b1cf534e349fd52091e507f4cc6d187'
		)
prepare(){
	local d=${srcdir}/${pkgname}-${pkgver}
	[ ! -h "$d" ] && ln -s ${pkgname%-domainless}-${pkgver} "$d"
	[ ! -d "$d" ] && echo "!!!!! cannot locate dir '$d'" && exit 666
	cd "$d/src"
	patch -i "$srcdir/search-local.patch"
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
