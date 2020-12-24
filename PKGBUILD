# Maintainer: m1kc <m1kc@yandex.ru>
# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=netatop-dkms
_pkgname=netatop
pkgver=3.1
pkgrel=2
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=('modules')
license=('GPL')
depends=('atop' 'dkms' 'bash' 'zlib')
conflicts=('netatop')
makedepends=()
source=("http://atoptool.nl/download/netatop-${pkgver}.tar.gz"
        "netatop-dkms.conf"
        "netatop-dkms.install")
install="netatop-dkms.install"
sha256sums=('736f43572c31a90748f023f0a5a814bff58d44c0c3f060d776cfd6e6e8435c62'
            '56e9094e396fcdabadde4db8a9f21945484e4db93359dc22f2fb76436b1b2ea9'
            '0cda5de65ab96445951e39decfc18b50aad90245f661eb58438ac402cd2496b7')
arch=('x86_64' 'i686')

prepare() {
	true
	#patch -d "${srcdir}/${_pkgname}-${pkgver}" -Np1 -i "${srcdir}"/netatop_kernel_5.5.patch
}

build() {
	warning "-------------------------------------------------------------------"
	warning "Package build will fail if there are no headers for currently"
	warning "loaded kernel or their versions mismatch (for example, you have"
	warning "updated the kernel but did not reboot yet)."
	warning "-------------------------------------------------------------------"

	cd $srcdir/$_pkgname-$pkgver
	# build daemon, make sure that module can be built
	make all
	# remove these objects again, they'll be rebuilt by DKMS
	find -name '*.o' -exec rm -v '{}' ';'
	find -name '*.ko' -exec rm -v '{}' ';'
	find -name 'modules.order' -exec rm -v '{}' ';'
	find -name 'netatop.mod' -exec rm -v '{}' ';'
}

package() {
	cd $srcdir/$_pkgname-$pkgver

#	if [[ `uname -r` =~ ^([0-9]\.[0-9]+)\.[0-9]+-[0-9]+(-.*)$ ]]
#	then
#		install -Dm 0744 module/netatop.ko $pkgdir/usr/lib/modules/extramodules-${BASH_REMATCH[1]}${BASH_REMATCH[2]}/netatop.ko
#	else
#		echo "Could not parse version `uname -r`; please report" >&2
#		exit 1
#	fi

	# fix references
	cd $srcdir/$_pkgname-$pkgver/module
	sed -i 's|../netatop.h|netatop.h|g' netatop.c
	sed -i 's|../netatopversion.h|netatopversion.h|g' netatop.c
	# copy module sources
	cd $srcdir/$_pkgname-$pkgver/module
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -RL * ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	# copy headers
	cd $srcdir/$_pkgname-$pkgver
	cp -L *.h ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	# copy dkms.conf
	sed -i "s|PACKAGE_VERSION=\"0.5\"|PACKAGE_VERSION=\"${pkgver}\"|g" "${srcdir}/netatop-dkms.conf"
	install -D -m 644 "${srcdir}/netatop-dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

	# package remaining stuff
	cd $srcdir/$_pkgname-$pkgver
	install -D daemon/netatopd $pkgdir/usr/bin/netatopd
	install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
	install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8
	install -D netatop.service $pkgdir/usr/lib/systemd/system/netatop.service

	# auto-load
	mkdir -p $pkgdir/etc/modules-load.d
	echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf

	warning "-------------------------------------------------------------------"
	warning "After install, DKMS will try to build the netatop module"
	warning "against every kernel you have installed. For the build to succeed,"
	warning "you must have header packages for every kernel. Header package"
	warning "for the stock kernel is called 'linux-headers', other usually"
	warning "follow the same naming scheme."
	warning "-------------------------------------------------------------------"
}
