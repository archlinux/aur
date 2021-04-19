# Maintainer: Pierre Carru <aur@carru.fr>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=libcgroup-git
_pkgname=libcgroup
pkgver=0.42.2.r81.g11a38f7
pkgrel=1
pkgdesc='Library that abstracts the control group file system in Linux'
arch=('i686' 'x86_64')
makedepends=('cmake')
url='https://github.com/libcgroup/libcgroup'
license=(LGPL)
backup=('etc/cgconfig.conf'
        'etc/cgrules.conf'
	'etc/cgsnapshot_blacklist.conf')
options=('!emptydirs' '!libtool')
install=libcgroup.install
provides=('libcgroup')
conflicts=('libcgroup')
source=("$_pkgname"::'git+https://github.com/libcgroup/libcgroup#branch=main'
	'cgconfig.service'
	'cgrules.service')
sha256sums=('SKIP'
            '808fc354abf36d7b6673dad790be275309ac57a2606d1be3732b9b3aeb5885eb'
            '6b1340ff6717f55e5e57dacc72accc0bfaed7e50ef31439271b6ddc893cbf671')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	./bootstrap.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-opaque-hierarchy=name=systemd

	make
}

package() {
	cd "$_pkgname"

	make DESTDIR="${pkgdir}" pkgconfigdir="/usr/lib/pkgconfig" install

	install -D -m0644 samples/cgconfig.conf "${pkgdir}/etc/cgconfig.conf"
	install -D -m0644 samples/cgrules.conf "${pkgdir}/etc/cgrules.conf"
	install -D -m0644 samples/cgsnapshot_blacklist.conf "${pkgdir}/etc/cgsnapshot_blacklist.conf"

	install -D -m0644 ${srcdir}/cgconfig.service "${pkgdir}/usr/lib/systemd/system/cgconfig.service"
	install -D -m0644 ${srcdir}/cgrules.service "${pkgdir}/usr/lib/systemd/system/cgrules.service"

	rm -f ${pkgdir}/usr/lib/security/pam_cgroup.{la,so,so.0}
	mv ${pkgdir}/usr/lib/security/pam_cgroup.so.0.0.0 ${pkgdir}/usr/lib/security/pam_cgroup.so

	# Make cgexec setgid cgred
	chown root:160 ${pkgdir}/usr/bin/cgexec
	chmod 2755 ${pkgdir}/usr/bin/cgexec
}

