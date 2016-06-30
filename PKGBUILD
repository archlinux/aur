# Contributor: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup2-client
pkgver=2.0.29
pkgrel=1
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=("GPL")
makedepends=('gcc-libs' 'gcc' 'make')
depends=('wxgtk' 'crypto++' 'zlib')
conflicts=('urbackup2-client-no-gui' 'urbackup-client-no-gui' 'urbackup-client')
source=("https://www.urbackup.org/downloads/Client/${pkgver}/urbackup-client-${pkgver}.0.tar.gz"
	'btrfs_create_filesystem_snapshot'
	'btrfs_remove_filesystem_snapshot'
	'dattobd_create_filesystem_snapshot'
	'dattobd_remove_filesystem_snapshot'
	'defaults_client'
	'lvm_create_filesystem_snapshot'
	'lvm_remove_filesystem_snapshot')

md5sums=('2abba0a9a1339257aa127f055c5ea65b'
         'fcdef7852b3d847c5c2468a619e7fba9'
         'b5f82ed45105f9929e9b98eee8b288fc'
         '5a3c106ff05e9939902272c936b653eb'
         'b001546cc988ac8ea8646c9e1438316b'
         'b3442a7228cbb9ce56da85ba219ad925'
         'e17da398a0d4074a3aae23c46d93db0b'
         'b8972631f9633b24b711bc831c972d42')

CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
CXXFLAGS="${CFLAGS} -ansi"
MAKEFLAGS="-j$(nproc)"

build() {
	cd "${srcdir}/urbackup-client-${pkgver}.0"
	./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/urbackup-client-${pkgver}.0"
	make DESTDIR="${pkgdir}" install

	install -Dm644 urbackupclientbackend-debian.service \
		"${pkgdir}"/usr/lib/systemd/system/urbackupclientbackend.service
	install -Dm644 docs/urbackupclientbackend.1 \
		"${pkgdir}"/usr/share/man/man1/urbackupclientbackend.1

	cd "${srcdir}"
	install -Dm644 defaults_client "${pkgdir}/etc/default/urbackupclient"
	install -Dm700 btrfs_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
	install -Dm700 btrfs_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
	install -Dm700 lvm_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
	install -Dm700 lvm_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
	install -Dm700 dattobd_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
	install -Dm700 dattobd_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
}
# vim: ts=2
