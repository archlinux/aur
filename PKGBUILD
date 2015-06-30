# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=libcgroup
pkgver=0.41
pkgrel=2
pkgdesc='Library that abstracts the control group file system in Linux'
arch=('i686' 'x86_64')
url='http://libcg.sourceforge.net'
license=(LGPL)
backup=('etc/cgconfig.conf'
        'etc/cgrules.conf'
	'etc/cgsnapshot_blacklist.conf')
options=('!emptydirs' '!libtool')
install=libcgroup.install
source=("http://downloads.sourceforge.net/libcg/${pkgname}-${pkgver/rc/.rc}.tar.bz2"
	'cgconfig.service'
	'cgrules.service')
sha256sums=('e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51'
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

	install -D -m0644 samples/cgconfig.conf "${pkgdir}/etc/cgconfig.conf"
	install -D -m0644 samples/cgrules.conf "${pkgdir}/etc/cgrules.conf"
	install -D -m0644 samples/cgsnapshot_blacklist.conf "${pkgdir}/etc/cgsnapshot_blacklist.conf"

	install -D -m0644 ${srcdir}/cgconfig.service "${pkgdir}/usr/lib/systemd/system/cgconfig.service"
	install -D -m0644 ${srcdir}/cgrules.service "${pkgdir}/usr/lib/systemd/system/cgrules.service"

	rm -f ${pkgdir}/usr/lib/security/pam_cgroup.{la,so,so.0}
	mv ${pkgdir}/usr/lib/security/pam_cgroup.so.0.0.0 ${pkgdir}/usr/lib/security/pam_cgroup.so

	rm -rf ${pkgdir}/etc/rc.d

	# Make cgexec setgid cgred
	chown root:160 ${pkgdir}/usr/bin/cgexec
	chmod 2755 ${pkgdir}/usr/bin/cgexec
}

