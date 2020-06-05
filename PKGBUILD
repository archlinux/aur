# Based on nss-mdns pkg by
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Travis Willard <travis@archlinux.org>
# adds an automatic search name.local when name containss
# no . thus allowing domainless searches

pkgname=nss-mdns-domainless
pkgver=0.14.1
pkgrel=1
pkgdesc="glibc plugin providing host name resolution via mDNS (domainless allowed for .local)"
arch=('i686' 'x86_64' 'armv7h')
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
		'a2094101b735cade45048764ea594bdae2bfa9399837f3c852a5b264416e9c8c'
		'763fdbd346f6b7f54d5b680add7f9970c7cdae79c5f983aa9f4eafc305eef5d1'
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
