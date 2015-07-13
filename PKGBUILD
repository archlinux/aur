# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

pkgname=uswsusp-git
pkgver=0.r501.g668c5f7
pkgrel=7
pkgdesc='Userspace software suspend - git checkout'
arch=('i686' 'x86_64')
url='http://suspend.sourceforge.net/'
license=('GPL')
depends=('libx86' 'lzo2' 'pciutils')
makedepends=('git')
provides=('uswsusp')
conflicts=('uswsusp')
backup=('etc/suspend.conf')
install=uswsusp.install
source=('git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-utils.git'
        'uresume-hook'
        'uresume-install'
        'print-no-version.patch'
        'load-checksum-mismatch.patch'
        'no-deprecated-switch.patch'
        'no-inline.patch')
sha256sums=('SKIP'
            '2662d879ca7a2339233c8bdce123f0d686397093759ca54f162a3577603587b0'
            '9fe3e38301014b4c8597aec2041ad3c6d85e6935004cbd3ac93659d391db3157'
            'cdf29e41f35469b134bb6421ba109e8398e1f3e88ec4e1d41b015920e420ee44'
            'fe8d5c831302125fd92ba6e48cacaf0359925d41de5623be2b8525a0cdf1fcc6'
            'd8a4f646d0785adf038830f14564f20ea307a27f225c17eb581a2e4d5e0c8519'
            'fc303c78d3ae0794f8a267e9b8b9fec665b7413f396310d1a19efedcd2a1760d')

pkgver() {
	cd suspend-utils/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd suspend-utils/

	patch -Np1 < "${srcdir}/print-no-version.patch"
	patch -Np1 < "${srcdir}/load-checksum-mismatch.patch"
	patch -Np1 < "${srcdir}/no-deprecated-switch.patch"
	patch -Np1 < "${srcdir}/no-inline.patch"

	sed -i "s/^AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" configure.ac
	mkdir m4

	./autogen.sh

	# This code includes references to deprecaded API in libgcrypt. Finally
	# it has been removed from libgcrypt 1.6.0.
	# For the time being encrypt support is disabled. To reenable add
	# --enable-encrypt below and fix the code.

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-compress \
		--enable-threads \
		--disable-resume-static \
		--disable-static \
		--sysconfdir=/etc
	make
}

package() {
	cd suspend-utils/

	mkdir "${pkgdir}/etc"
	make DESTDIR="${pkgdir}/" install

	install -D -m0644 "${srcdir}/uresume-hook" "${pkgdir}/usr/lib/initcpio/hooks/uresume"
	install -D -m0644 "${srcdir}/uresume-install" "${pkgdir}/usr/lib/initcpio/install/uresume"
}

