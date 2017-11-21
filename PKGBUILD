# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=tcmu-runner-git
pkgver=v1.3.0.rc4.r31.g7a8c1df
pkgrel=1
pkgdesc="A daemon that handles the userspace side of the LIO TCM-User backstore."
arch=('any')
url="https://github.com/open-iscsi/tcmu-runner"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'gcc')
source=("$pkgname"::"git://github.com/open-iscsi/tcmu-runner.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd ${pkgname}
	# Temporary fix for glib2 codegen bug
	PATH="$(echo $PATH | sed 's#:/bin:#:#g')"
	cmake ./ \
		-Dwith-glfs=false \
		-DSUPPORT_SYSTEMD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr/ \
		-DCMAKE_BUILD_TYPE=Release
	# Temporary fix for compile errors on Linux 4.13
	sed -i 's#<linux/uio.h>#<sys/uio.h>#g' ./target_core_user_local.h
	make
}

package() {
	cd "${pkgname}"

	# Install bins
	for bin in tcmu-runner tcmu-synthesizer consumer; do
		install -Dm755 $bin "${pkgdir}/usr/bin/$bin"
	done

	install -Dm644 tcmu-runner.conf \
		"${pkgdir}/etc/dbus-1/system.d/tcmu-runner.conf"

	install -Dm644 org.kernel.TCMUService1.service \
		"${pkgdir}/usr/share/dbus-1/system-services/org.kernel.TCMUService1.service"

	install -Dm644 tcmu-runner.service \
		"${pkgdir}/usr/lib/systemd/system/tcmu-runner.service"

	export DESTDIR="${pkgdir}/"
	make install

	cd "${pkgdir}/usr"
	for i in libtcmu.so libtcmu.so.2 tcmu-runner; do
		mv -v ./lib64/$i ./lib/
	done

	rmdir -v lib64

	# Install tcmu conf
	#install -Dm644 tcmu.conf \
	#	"${pkgdir}/etc/tcmu/tcmu.conf"
	#echo log_level = 4 >> "${pkgdir}/etc/tcmu/tcmu.conf"

	# Install libs
	#install -Dm644 libtcmu.so   "${pkgdir}/usr/lib/libtcmu.so"
	#install -Dm644 libtcmu.so.1 "${pkgdir}/usr/lib/libtcmu.so.1"

	# Install hendlers
	#for file in handler*.so; do
	#	install -Dm644 $file "${pkgdir}/usr/lib/tcmu-runner/$file"
	#done

	# Install headers
	# for file in libtcmu.h libtcmu_common.h tcmu-runner.h; do
	#	install -Dm644 $file "${pkgdir}/usr/include/$file"
	#done

	#install -Dm644 tcmu-runner.8 \
	#	"${pkgdir}/usr/share/man/man8/tcmu-runner.8"
	#gzip -9 "${pkgdir}/usr/share/man/man8/tcmu-runner.8"
}
