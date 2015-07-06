# Maintainer: m1kc <m1kc@yandex.ru>
# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=netatop-dkms
_pkgname=netatop
pkgver=0.5
pkgrel=2
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=modules
license=('GPL')
install='netatop-dkms.install'
depends=('atop' 'dkms')
conflicts=('netatop')
makedepends=('linux-headers')
source=("http://atoptool.nl/download/netatop-${pkgver}.tar.gz"
        "netatop-dkms.conf")
sha256sums=('cfac73cc346f949f1d31a63cf3c06b94e67fdaef9b14c7af4e7fd115a03f856a'
            '56e9094e396fcdabadde4db8a9f21945484e4db93359dc22f2fb76436b1b2ea9')
arch=('x86_64' 'i686')

build() {
	cd $srcdir/$_pkgname-$pkgver
	# build daemon, make sure that module can be built
	make all
	# remove these objects again, they'll be rebuilt by DKMS
	find -name '*.o' -exec rm -v '{}' ';'
	find -name '*.ko' -exec rm -v '{}' ';'
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
	install -D -m 644 "${srcdir}/netatop-dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

	# package remaining stuff
	cd $srcdir/$_pkgname-$pkgver
	install -D daemon/netatopd $pkgdir/usr/bin/netatopd
	install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
	install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8

	# auto-load
	mkdir -p $pkgdir/etc/modules-load.d
	echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf
}
