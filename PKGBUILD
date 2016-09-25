# Maintainer: Richard Schütz <rschuetz@uni-koblenz.de>
pkgname=('xe-guest-utilities-git' 'xenstore-git')
pkgver=r40.83de571
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/xenserver/xe-guest-utilities"
license=('BSD')
makedepends=('git' 'go')
source=('git+https://github.com/xenserver/xe-guest-utilities.git' 'xe-guest-utilities.service')
sha256sums=('SKIP' 'beda5dbcc03529959984267a1a9748439beda3fcd24db26589848aa7023333a7')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgbase%-git}"
	make
}

package_xe-guest-utilities-git() {
	pkgdesc="Writes distribution version information and IP address to XenStore"
	depends=('lsb-release')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m755 build/obj/xe-daemon "${pkgdir}/usr/bin/xe-daemon"
	install -D -m755 mk/xe-linux-distribution "${pkgdir}/usr/bin/xe-linux-distribution"
	install -D -m644 mk/xen-vcpu-hotplug.rules "${pkgdir}/usr/lib/udev/rules.d/10-xen-vcpu-hotplug.rules"
	install -D -m644 "${srcdir}/xe-guest-utilities.service" "${pkgdir}/usr/lib/systemd/system/xe-guest-utilities.service"
}

package_xenstore-git() {
	pkgdesc="Utilities for interacting with XenStore from within a Xen virtual machine"
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m755 build/obj/xenstore "${pkgdir}/usr/bin/xenstore"
	ln -s xenstore "${pkgdir}/usr/bin/xenstore-exists"
	ln -s xenstore "${pkgdir}/usr/bin/xenstore-read"
	ln -s xenstore "${pkgdir}/usr/bin/xenstore-rm"
	ln -s xenstore "${pkgdir}/usr/bin/xenstore-write"
}
