# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-ipoe-module-git
pkgver=r1179.b8b91d8
pkgrel=1
pkgdesc="Ipoe kernel module for accel-ppp running under linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('linux')
makedepends=('dkms' 'linux-headers' "accel-ppp-ipoe-dkms-git=$pkgver")
conflicts=('')
install='accel-ppp-ipoe-module-git.install'
source=('accel-ppp::git+git://git.code.sf.net/p/accel-ppp/code')
md5sums=('SKIP')
_extramodules=extramodules-4.2-ARCH
_pkgname=accel-ppp

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
	# dkms need modification to be run as user
	mkdir dkms
	cp -r /var/lib/dkms/accel-ppp-ipoe dkms
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
}

build() {
	_kernver="$(cat /usr/lib/modules/$_extramodules/version)"
	cd "$srcdir"
	# build ipoe module
	msg2 'Ipoe module'
	dkms --dkmsframework dkms.conf build "accel-ppp-ipoe/$pkgver" -k "$_kernver"
}
package() {
	_kernver="$(cat /usr/lib/modules/$_extramodules/version)"
	cd "dkms/accel-ppp-ipoe/$pkgver/$_kernver/$CARCH/module"
	install -dm0755 "$pkgdir/usr/lib/modules/$_extramodules"
	install -Dm0644 ipoe.ko "$pkgdir/usr/lib/modules/$_extramodules/"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

