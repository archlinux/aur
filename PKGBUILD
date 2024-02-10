# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=libcgroup
pkgver=3.1.0
pkgrel=0
pkgdesc='Library that abstracts the control group file system in Linux'
arch=('i686' 'x86_64')
url='https://github.com/libcgroup/libcgroup'
license=(LGPL)
backup=('etc/cgconfig.conf'
        'etc/cgrules.conf'
	'etc/cgsnapshot_blacklist.conf')
options=('!emptydirs' '!libtool')
optdepends=('pam: for pam_cgroup')
install=libcgroup.install
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
	'cgconfig.service'
	'cgrules.service')
validpgpkeys=('47A68FCE37C7D7024FD65E11356CE62C2B524099') # Tom Hromatka <tom.hromatka@oracle.com>
sha256sums=('976ec4b1e03c0498308cfd28f1b256b40858f636abc8d1f9db24f0a7ea9e1258'
            'SKIP'
            '808fc354abf36d7b6673dad790be275309ac57a2606d1be3732b9b3aeb5885eb'
            '6b1340ff6717f55e5e57dacc72accc0bfaed7e50ef31439271b6ddc893cbf671')

build() {
	cd "${srcdir}/${pkgname}-${pkgver/rc/.rc}"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-opaque-hierarchy=name=systemd

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver/rc/.rc}"

	make DESTDIR="${pkgdir}" pkgconfigdir="/usr/lib/pkgconfig" install

	install -D -m0644 samples/config/cgconfig.conf "${pkgdir}/etc/cgconfig.conf"
	install -D -m0644 samples/config/cgrules.conf "${pkgdir}/etc/cgrules.conf"
        install -D -m0644 samples/config/cgsnapshot_allowlist.conf "${pkgdir}/etc/cgsnapshot_allowlist.conf"
	install -D -m0644 samples/config/cgsnapshot_denylist.conf "${pkgdir}/etc/cgsnapshot_denylist.conf"

	install -D -m0644 ${srcdir}/cgconfig.service "${pkgdir}/usr/lib/systemd/system/cgconfig.service"
	install -D -m0644 ${srcdir}/cgrules.service "${pkgdir}/usr/lib/systemd/system/cgrules.service"

	rm -f ${pkgdir}/usr/lib/security/pam_cgroup.{la}

	rm -rf ${pkgdir}/etc/rc.d

	# Make cgexec setgid cgred
	chown root:160 ${pkgdir}/usr/bin/cgexec
	chmod 2755 ${pkgdir}/usr/bin/cgexec
}

