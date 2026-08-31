# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xlibre-xserver
pkgname=(
	'xlibre-xserver'
	'xlibre-xserver-common'
	'xlibre-xserver-xephyr'
	'xlibre-xserver-xnest'
	'xlibre-xserver-xvfb'
	'xlibre-xserver-devel' # devel last due to some checks there
)
pkgver=25.1.9
pkgrel=1
arch=('x86_64')
license=(
	'BSD-3-Clause'
	'HPND'
	'HPND-sell-variant'
	'ICU'
	'ISC'
	'LicenseRef-Adobe-Display-PostScript'
	'LicenseRef-DEC-3-Clause'
	'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
	'MIT'
	'MIT-open-group'
	'NTP'
	'SGI-B-2.0'
	'SMLNJ'
	'X11'
	'X11-distribute-modifications-variant'
)
groups=('xlibre')
url="https://xlibre.net"
makedepends=(
	'libepoxy'
	'libpciaccess'
	'libunwind'
	'libx11'
	'libxaw'
	'libxcvt'
	'libxfont2'
	'libxi'
	'libxkbfile'
	'libxmu'
	'libxrender'
	'libxres'
	'libxshmfence'
	'libxtst'
	'libxv'
	'mesa'
	'mesa-libgl'
	'meson'
	'pixman'
	'systemd'
	'xcb-util'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'xorg-font-util'
	'xorg-util-macros'
	'xorg-xkbcomp'
	'xorgproto'
)
source=(
	https://github.com/X11Libre/xserver/archive/refs/tags/${pkgbase}-"${pkgver}".tar.gz
	xvfb-run # with updates from FC master
	xvfb-run.1
)
sha512sums=('ef3d142f1842b415ec4ee18cc8eb3d537700658717c1610e1c2ac20f35711807c140803bd36be4db719d1e40abdbd2eb3b0ca899c018361e3a3762a8b269f29a'
            '672375cb5028ba9cda286e317d17bd8c9a9039483e7f79c21f223fd08ba07655729e9f59a082f4b8f5d8de45a77a9e9affce1002fb8c6657e26ef1a490654e49'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22')

build() {
	# Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
	# With them, modules fail to load with undefined symbol.
	# See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
	export CFLAGS=${CFLAGS/-fno-plt}
	export CXXFLAGS=${CXXFLAGS/-fno-plt}
	export LDFLAGS=${LDFLAGS/-Wl,-z,now}

	arch-meson "xserver-${pkgbase}-${pkgver}" build \
		-D ipv6=true \
		-D xvfb=true \
		-D xnest=true \
		-D xcsecurity=true \
		-D xorg=true \
		-D xephyr=true \
		-D xfbdev=true \
		-D glamor=true \
		-D udev=true \
		-D udev_kms=true \
		-D dtrace=false \
		-D seatd_libseat=false \
		-D systemd_logind=true \
		-D suid_wrapper=true \
		-D linux_acpi=false \
		-D legacy_nvidia_padding=true \
		-D legacy_nvidia_340x=true \
		-D xkb_dir=/usr/share/X11/xkb \
		-D xkb_output_dir=/var/lib/xkb \
		-D libunwind=true

	# Print config
	meson configure build
	ninja -C build

	# fake installation to be seperated into packages
	DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

_install() {
	local src f dir
	for src; do
		f="${src#fakeinstall/}"
		dir="${pkgdir}/${f%/*}"
		install -m755 -d "${dir}"
		# use copy so a new file is created and fakeroot can track properties such as setuid
		cp -av "${src}" "${dir}/"
		rm -rf "${src}"
	done
}

package_xlibre-xserver-common() {
	pkgdesc="XLibre server common files"
	depends=(
		'xkeyboard-config'
		'xorg-setxkbmap'
		'xorg-xkbcomp'
	)
	provides=('xorg-server-common')
	conflicts=(
		'xlibre-xserver-common-beta'
		'xorg-server-common'
	)

	_install fakeinstall/usr/lib/xorg/protocol.txt
	_install fakeinstall/usr/share/man/man1/Xserver.1

	install -m644 -Dt "${pkgdir}/var/lib/xkb/" "xserver-${pkgbase}-${pkgver}"/xkb/README.compiled
	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver() {
	pkgdesc="XLibre X server"
	depends=(
		'dbus'
		'glibc'
		'libbsd'
		'libdrm'
		'libepoxy'
		'libgl'
		'libpciaccess'
		'libtirpc'
		'libunwind'
		'libxau'
		'libxcvt' # FS#52949
		'libxdmcp'
		'libxfont2'
		'libxshmfence'
		'nettle'
		'pixman'
		'sh'
		'systemd-libs'
		'xlibre-xserver-common'
	)
	# see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers
	# that drivers can depend on and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
	provides=(
		'X-ABI-EXTENSION_VERSION=11.0'
		'X-ABI-VIDEODRV_VERSION=28.0'
		'X-ABI-XINPUT_VERSION=26.0'
		'x-server'
		'xorg-server'
	)
	conflicts=(
		'glamor-egl'
		'nvidia-utils<=331.20'
		'xf86-video-modesetting'
		'xlibre-xserver-beta'
		'xorg-server'
	)
	replaces=(
		'glamor-egl'
		'xf86-video-modesetting'
	)

	_install fakeinstall/usr/bin/{X,Xorg,gtf,Xfbdev}
	_install fakeinstall/usr/lib/Xorg{,.wrap}
	_install fakeinstall/usr/lib/xorg/modules/*
	_install fakeinstall/usr/share/X11/xorg.conf.d/10-{nvidia,nvidia-modules,quirks}.conf
	_install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,gtf,Xfbdev}.1
	_install fakeinstall/usr/share/man/man4/{exa,fbdevhw,inputtestdrv,modesetting}.4
	_install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

	# distro specific files must be installed in /usr/share/X11/xorg.conf.d
	install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xephyr() {
	pkgdesc="A nested X server that runs as an X application"
	depends=(
		'glibc'
		'libepoxy'
		'libgl'
		'libtirpc'
		'libunwind'
		'libx11'
		'libxau'
		'libxdmcp'
		'libxfont2'
		'libxshmfence'
		'nettle'
		'pixman'
		'systemd-libs'
		'xcb-util'
		'xcb-util-image'
		'xcb-util-keysyms'
		'xcb-util-renderutil'
		'xcb-util-wm'
		'xlibre-xserver-common'
	)
	provides=('xorg-server-xephyr')
	conflicts=(
		'xlibre-xserver-xephyr-beta'
		'xorg-server-xephyr'
	)

	_install fakeinstall/usr/bin/Xephyr
	_install fakeinstall/usr/share/man/man1/Xephyr.1

	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xvfb() {
	pkgdesc="Virtual framebuffer X server"
	# xvfb-run is GPLv2, rest is MIT
	license=(
		'GPL-2.0-only'
		'MIT'
	)
	depends=(
		'glibc'
		'libgl'
		'libtirpc'
		'libunwind'
		'libxau'
		'libxdmcp'
		'libxfont2'
		'nettle'
		'pixman'
		'sh'
		'systemd-libs'
		'xlibre-xserver-common'
		'xorg-xauth'
	)
	provides=('xorg-server-xvfb')
	conflicts=(
		'xlibre-xserver-xvfb-beta'
		'xorg-server-xvfb'
	)

	_install fakeinstall/usr/bin/Xvfb
	_install fakeinstall/usr/share/man/man1/Xvfb.1

	install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
	install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xnest() {
	pkgdesc="A nested X server that runs as an X application"
	depends=(
		'glibc'
		'libtirpc'
		'libunwind'
		'libx11'
		'libxau'
		'libxdmcp'
		'libxext'
		'libxfont2'
		'nettle'
		'pixman'
		'systemd-libs'
		'xlibre-xserver-common'
	)
	provides=('xorg-server-xnest')
	conflicts=(
		'xlibre-xserver-xnest-beta'
		'xorg-server-xnest'
	)

	_install fakeinstall/usr/bin/Xnest
	_install fakeinstall/usr/share/man/man1/Xnest.1

	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-devel() {
	pkgdesc="Development files for the XLibre Xserver"
	depends=(
		'libpciaccess'
		'mesa'
		'pixman'
		'xlibre-xserver'
		'xorg-util-macros'
		'xorgproto'
	)
	provides=('xorg-server-devel')
	conflicts=(
		'xlibre-xserver-devel-beta'
		'xorg-server-devel'
	)

	rm fakeinstall/etc/X11/xorg.conf.d/10-nvidia-modules.conf.debian
	rm fakeinstall/etc/X11/xorg.conf.d/10-nvidia.conf.debian

	_install fakeinstall/usr/include/xorg/*
	_install fakeinstall/usr/lib/pkgconfig/xlibre-server.pc
	_install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
	_install fakeinstall/usr/share/aclocal/xorg-server.m4

	# license
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING

	# make sure there are no files left to install
	find fakeinstall -depth -print0 | xargs -0 rmdir
}
