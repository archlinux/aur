# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=tcmu-runner
pkgver=v1.2.0
pkgrel=1
pkgdesc="A daemon that handles the userspace side of the LIO TCM-User backstore."
arch=('any')
url="https://github.com/open-iscsi/tcmu-runner"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'gcc')
source=("$pkgname"::"git://github.com/open-iscsi/tcmu-runner.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
	cd ${pkgname}
	cmake ./ -DCMAKE_INSTALL_PREFIX=/usr/
	make
}

package() {
	cd "${pkgname}"

	install -Dm755 tcmu-runner \
		"${pkgdir}/usr/bin/tcmu-runner"

	install -Dm755 tcmu-synthesizer \
		"${pkgdir}/usr/bin/tcmu-synthesizer"

	install -Dm644 tcmu-runner.conf \
		"${pkgdir}/etc/dbus-1/system.d/tcmu-runner.conf"

	install -Dm644 org.kernel.TCMUService1.service \
		"${pkgdir}/usr/share/dbus-1/system-services/org.kernel.TCMUService1.service"

	install -Dm644 tcmu-runner.service \
		"${pkgdir}/usr/lib/systemd/system/tcmu-runner.service"

	install -Dm644 tcmu.conf \
		"${pkgdir}/etc/tcmu/tcmu.conf"
	echo log_level = 4 >> "${pkgdir}/etc/tcmu/tcmu.conf"

	install -Dm644 libtcmu.so   "${pkgdir}/usr/lib/libtcmu.so"
	install -Dm644 libtcmu.so.1 "${pkgdir}/usr/lib/libtcmu.so.1"

	for file in handler_rbd.so handler_glfs.so handler_qcow.so handler_file_async.so handler_file_optical.so; do
		install -Dm644 $file "${pkgdir}/usr/lib/tcmu-runner/$file"
	done

	for file in libtcmu.h libtcmu_common.h tcmu-runner.h; do
		install -Dm644 $file "${pkgdir}/usr/include/$file"
	done

	install -Dm644 tcmu-runner.8 \
		"${pkgdir}/usr/share/man/man8/tcmu-runner.8"
	gzip -9 "${pkgdir}/usr/share/man/man8/tcmu-runner.8"
}
