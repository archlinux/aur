# Maintainer: Cody P Schafer < aur [at] codyps.com >
pkgbase=parallels-tools
pkgname=(parallels-tools parallels-tools-dkms)
pkgver=11.2.2.32651
pkgrel=3
pkgdesc="Parallels virtualization integration services & drivers"
arch=('x86_64')
url="https://parallels.com"
license=('custom: commercial')
depends=(bash sh zlib)
makedepends=(dir-dlagent dkms)
checkdepends=()
optdepends=()
provides=()
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
install=
options=()

XORG_VERSION=1.18

DLAGENTS+=("dir::/usr/bin/echo Install and configure dir-dlagent to specify CD-ROM location")
source=(
	dir://parallels-tools/tools/prltools.x64.tar.gz
	dir://parallels-tools/kmods/prl_mod.tar.gz
	dir://parallels-tools/tools/prlmouse.conf
	dir://parallels-tools/tools/xorg-prlmouse.rules
	dir://parallels-tools/tools/99prltoolsd-hibernate
	dir://parallels-tools/tools/mount.prl_fs.8
	dir://parallels-tools/installer/blacklist-parallels.conf
	dir://parallels-tools/installer/prltoolsd.sh
	dir://parallels-tools/installer/prltoolsd.service
	dir://parallels-tools/installer/prl-x11.sh
	dir://parallels-tools/installer/prl-x11.service
	dir://parallels-tools/installer/prlfsmountd.sh
	'0001-fix-for-4.9.y.patch'
)

sha1sums=('af32269e60b11704be9fca73ea9586da01b37ae2'
          '604bcee0d5c9ac6a347c6ce40792ddc7598f99dd'
          '8d7b264653f8167904d0328e1fc540fc0b7bc7eb'
          'a20911495461ed1950bee069d128fe6c7103c97d'
          'da5fcbc6a93f1d3939752838e53d1daea13307cb'
          '9af7dba4990c69493e6d60bd60bb684f36aee13f'
          'a5f638186352484b9153191ace3fb8a4ce826b1f'
          'c8042c5ada41dd17f2b67347871dff41c4bce9c9'
          'c50bf939719eba4ebb34e4bd8a0921e1cbe4d901'
          '82ab36a2876a1d30fad92ebf06d87b0d8d7210a8'
          'bd681d740b4a1a68adfd4f94afec5934c2ea69ac'
          '56d3fc7c9abb7c63b9c6356422261f0a87cf3b22'
          'dca57db6826f044d23fc26c0df3736a5dfb9ae6d')

prepare() {
	patch -p1 -i ../0001-fix-for-4.9.y.patch
}

package_parallels-tools() {
	cp -r "${srcdir}"/xorg.${XORG_VERSION}/usr "${pkgdir}"
	# xorg.7.1 is COMMON_TOOLS_DIR
	cp -r "${srcdir}"/xorg.7.1/usr/bin/{prlcc,prlcp,prlsga,prldnd} \
		"${pkgdir}/usr/bin"
	cp -r "${srcdir}"/xorg.7.1/usr/lib/libprl_wmouse_watcher.so \
		"${pkgdir}/usr/lib/libprl_wmouse_watcher.so.1.0.0"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib"
	cp -r "${srcdir}"/bin/*  "${pkgdir}/usr/bin"
	cp -r "${srcdir}"/sbin/* "${pkgdir}/usr/bin"
	cp -r "${srcdir}"/lib/*  "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/lib/compiz"

	install -d -m 0755 "${pkgdir}/usr/lib/xorg/modules/drivers"
	install -d -m 0755 "${pkgdir}/usr/lib/xorg/modules/input"
	cp -r "${srcdir}"/xorg.${XORG_VERSION}/x-server/modules/drivers/* "${pkgdir}/usr/lib/xorg/modules/drivers"
	cp -r "${srcdir}"/xorg.${XORG_VERSION}/x-server/modules/input/* "${pkgdir}/usr/lib/xorg/modules/input"

	install -m 0755 prlfsmountd.sh "${pkgdir}/usr/bin/prlfsmountd"

	install -d -m 0755 "${pkgdir}/etc/X11/xorg.conf.d"
	install -m 0644 prlmouse.conf "${pkgdir}/etc/X11/xorg.conf.d/50-prlmouse.conf"

	install -d -m 0755 "${pkgdir}/usr/share/man/man8"
	install -m 0644 mount.prl_fs.8 "${pkgdir}/usr/share/man/man8"

	install -d -m 0755 "${pkgdir}/etc/modprobe.d"
	install -m 0644 blacklist-parallels.conf "${pkgdir}/etc/modprobe.d"

	install -d -m 0755 "${pkgdir}/etc/init.d"
	install -m 0755 prltoolsd.sh "${pkgdir}/etc/init.d/prltoolsd"
	install -m 0755 prl-x11.sh "${pkgdir}/etc/init.d/prl-x11"

	install -d -m 0755 "${pkgdir}/usr/lib/systemd/system"
	install -m 0644 prltoolsd.service "${pkgdir}/usr/lib/systemd/system"
	install -m 0644 prl-x11.service "${pkgdir}/usr/lib/systemd/system"

	install -d -m 0755 "${pkgdir}/usr/lib/udev/rules.d"
	install -m 0644 xorg-prlmouse.rules "${pkgdir}/usr/lib/udev/rules.d/69-xorg-prlmouse.rules"

	install -d -m 0755 "${pkgdir}/etc/pm/sleep.d"
	install -m 0755 99prltoolsd-hibernate "${pkgdir}/etc/pm/sleep.d"

	# These have very strange /usr/local rpaths, strip them out
	chrpath -d "${pkgdir}/usr/lib/libglx.so.1.0.0"
	for b in prlshprint prl_wmouse_d prlshprof prlsga prl_nettool \
		prl_showvmcfg prlhosttime prldnd prlcc prl_snapshot prlcp \
		prltoolsd;
	do
		chrpath -d "${pkgdir}/usr/bin/$b"
	done
}

package_parallels-tools-dkms() {
	depends=('dkms')

	_dkms_dir="${pkgdir}"/usr/src/${pkgbase}-${pkgver}
	install -d -m 0755 "${_dkms_dir}"
	install -m0644 dkms.conf Makefile.kmods "${_dkms_dir}"
	cp -r prl_fs prl_fs_freeze prl_tg prl_eth "${_dkms_dir}"
}
