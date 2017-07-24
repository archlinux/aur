# Maintainer: Cody P Schafer < aur [at] codyps.com >
pkgbase=parallels12-tools
pkgname=(parallels12-tools parallels12-tools-dkms)
pkgver=12.2.1.41615
pkgrel=2
pkgdesc="Parallels virtualization integration services & drivers"
arch=('x86_64')
url="https://parallels.com"
license=('custom: commercial')
depends=(bash sh zlib)
makedepends=(dir-dlagent dkms)
checkdepends=()
optdepends=()
provides=()
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
install=
options=()

XORG_VERSION=1.19

DLAGENTS+=("dir::/usr/bin/echo Install and configure dir-dlagent to specify CD-ROM location")
source=(
	dir://${pkgbase}/tools/prltools.x64.tar.gz
	dir://${pkgbase}/kmods/prl_mod.tar.gz
	dir://${pkgbase}/tools/prlmouse.conf
	dir://${pkgbase}/tools/xorg-prlmouse.rules
	dir://${pkgbase}/tools/99prltoolsd-hibernate
	dir://${pkgbase}/tools/mount.prl_fs.8
	dir://${pkgbase}/installer/blacklist-parallels.conf
	dir://${pkgbase}/installer/prltoolsd.sh
	dir://${pkgbase}/installer/prltoolsd.service
	dir://${pkgbase}/installer/prl-x11.sh
	dir://${pkgbase}/installer/prl-x11.service
	dir://${pkgbase}/installer/prlfsmountd.sh
	dir://${pkgbase}/installer/prl-functions.sh
)

sha1sums=('fdd278b5caee0647f1c062512fb83e1da4d5fdb2'
          'fa61d1eddb0d6c2130c3dbb9166e80b71c988584'
          '52a6c4b6cd493aac8c932a77a25efc17e0e075e5'
          '89aef4d9e61d5835e3133951fa34e889525ba7cc'
          '887812861a52271ea242b09fbfdf3b480cddc779'
          '75d753bfa2d352eec36bc0fcea2a6a6e068a85d3'
          'a927134a9c51af9c372c9fa388bbdec53c56d808'
          '3bba1a27f912f8c8ef6167f5b19244215251189c'
          '32b2028480668ca8f75888de0c681c74d613864f'
          '8a20a07b905a5dcdd0b182844ff781344b78a8b5'
          'ff52471a3c6acec6f4a59e2a8f2aff6a937bf09e'
          'b3e540bd8b1a96bfff81e1fd7f90ab978f504475'
          '524a64269bd1204415e7133e2e5ae821e5e03f2e')

package_parallels12-tools() {
	provides=(parallels-tools)
	conflicts+=(parallels-tools)

	install -d "${pkgdir}/usr/bin"

	cp -r "${srcdir}"/xorg.${XORG_VERSION}/usr "${pkgdir}"
	# xorg.7.1 is COMMON_TOOLS_DIR
	cp -r "${srcdir}"/xorg.7.1/usr/bin/{prlcc,prlcp,prlsga,prldnd,prltimesync,prltoolsd} \
		"${pkgdir}/usr/bin"

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

	install -d -m 0755 "${pkgdir}/usr/lib/parallels-tools/installer"
	install -m 0644 prl-functions.sh "${pkgdir}/usr/lib/parallels-tools/installer"

	# These have very strange /usr/local rpaths, strip them out
	#chrpath -d "${pkgdir}/usr/lib/libglx.so.1.0.0"
	#for b in prlshprint prlshprof prlsga prl_nettool \
	#	prl_showvmcfg prlhosttime prldnd prlcc prl_snapshot prlcp \
	#	prltoolsd;
	#do
	#	chrpath -d "${pkgdir}/usr/bin/$b"
	#done
}

package_parallels12-tools-dkms() {
	depends=('dkms')
	provides=(parallels-tools-dkms)
	conflicts=(parallels-tools-dkms)
	arch=(any)

	_dkms_dir="${pkgdir}"/usr/src/${pkgbase}-${pkgver}
	install -d -m 0755 "${_dkms_dir}"
	install -m0644 dkms.conf Makefile.kmods "${_dkms_dir}"
	cp -r prl_fs prl_fs_freeze prl_tg prl_eth "${_dkms_dir}"
}

# TODO:
#	- install script: udevadm control --reload-rules && udevadm trigger
#         Unless pacman does that for us already

