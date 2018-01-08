# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=miredo
pkgver=1.2.6+139+g6eb5e5a
pkgrel=1
_commit='6eb5e5a417667d47dfca31f80d5f3debbc4c4e0e'
pkgdesc='Teredo client and server.'
arch=('x86_64')
url='https://www.remlab.net/miredo/'
license=('GPL')
depends=('judy' 'iproute2' 'libcap')
makedepends=('git')
backup=('etc/miredo/miredo.conf'
        'etc/miredo/miredo-server.conf'
        'etc/miredo/client-hook')
#validpgpkeys=('9480583353E334D2F03FE80CC3EC6DBEDD6D12BD')	# Rémi Denis-Courmont
#source=("http://www.remlab.net/files/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,'.asc'})
source=("git+http://git.remlab.net/git/miredo.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "${srcdir}/${pkgname}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib \
		--sbindir=/usr/bin \
		--with-Judy \
		--disable-assert \
		--disable-static \
		--enable-miredo-user
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	sed -i 's#/sbin/ip#/usr/bin/ip#' "${pkgdir}/etc/miredo/client-hook"
	rmdir "${pkgdir}/var/run" "${pkgdir}/var"
	echo 'u miredo - "Teredo IPv6 tunneling daemon"' |
		install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
