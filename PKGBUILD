# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>

_url="http://dev.gentoo.org/~williamh/dist"
_pkgname=udev-init-scripts

pkgname=udev-openrc
pkgver=31
pkgrel=1
pkgdesc="OpenRC udev startup scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('base' 'openrc-base')
depends=('openrc' 'udev')
source=("${_url}/${_pkgname}-${pkgver}.tar.gz"
	"kmod-static-nodes.initd")
sha256sums=('f8113922f0e062527268da6cc0d8168e64c61e353f6e84292fc64d7c6e4bffae'
            '3ecbe7761b92a123a5a3d395ec3d9e090b0dfba7910a5987b4a2298c20a7e571')

package(){
        cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	for f in ${pkgdir}/etc/init.d/*;do
		sed -e "s|#!/sbin/openrc-run|#!/usr/bin/openrc-run|" \
			-e "s|/bin/udevadm|/usr/bin/udevadm|g" \
			-e "s|/sbin/udevd|/usr/bin/udevd|g" \
			-i "$f"
	done
	install -d "${pkgdir}/etc/runlevels/sysinit"

	ln -sf "/etc/init.d/udev" "${pkgdir}/etc/runlevels/sysinit/udev"
	ln -sf "/etc/init.d/udev-trigger" "${pkgdir}/etc/runlevels/sysinit/udev-trigger"

	# kmod-static-nodes
	install -Dm755 ${srcdir}/kmod-static-nodes.initd ${pkgdir}/etc/init.d/kmod-static-nodes

	ln -sf "/etc/init.d/kmod-static-nodes" "${pkgdir}/etc/runlevels/sysinit/kmod-static-nodes"
}
