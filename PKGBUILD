# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=miredo
pkgver=1.2.6+r158+g509603a
pkgrel=2
_commit='509603ab416cd8f57e9227d09a8a80289df1a9f1'
pkgdesc='Teredo client and server.'
arch=('x86_64')
url='https://www.remlab.net/miredo/'
license=('GPL')
depends=('judy' 'iproute2' 'libcap')
makedepends=('git')
backup=('etc/miredo/miredo.conf'
        'etc/miredo/miredo-server.conf'
        'etc/miredo/client-hook')
validpgpkeys=('9480583353E334D2F03FE80CC3EC6DBEDD6D12BD')	# Rémi Denis-Courmont
#source=("https://www.remlab.net/files/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,'.asc'})
source=("git+https://git.remlab.net/git/miredo.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/+/g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	# Miredo starts too early
	sed 's/^After=network.target$/Wants=network-online.target\nAfter=network-online.target nss-lookup.target/' -i "${srcdir}/${pkgname}/misc/miredo.service-in"
	sed '/^Description=.*$/a\After=network.target' -i "${srcdir}/${pkgname}/misc/miredo-server.service-in"
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
		--with-pic \
		--disable-assert \
		--disable-static \
		--disable-rpath \
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
