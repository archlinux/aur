# Maintainer: James David Clarke <james@jamesdavidclarke.com>

pkgname=simulide2-bin
# Upstream calls this "2.0.0 - Unstable" and versions the actual builds by date
# (R260501 == 2026-05-01), so the build id is carried in the pkgver suffix.
_build=R260501
pkgver=2.0.0.r260501
pkgrel=1
pkgdesc='Real time electronic circuit simulator with PIC, AVR, Arduino and ESP32 support (SimulIDE 2 unstable series, binary release)'
arch=('x86_64')
url='https://simulide.com'
license=('AGPL-3.0-or-later' 'GPL-3.0-or-later')
# Upstream bundles Qt 5.15, KDE Frameworks and GStreamer, so only the libraries
# that the bundle itself does not ship are listed here.  The list is the
# transitive NEEDED closure of the executable and of every bundled Qt plugin.
depends=(
	'alsa-lib'      # libasound.so.2
	'e2fsprogs'     # libcom_err.so.2
	'fontconfig'    # libfontconfig.so.1
	'freetype2'     # libfreetype.so.6
	'gcc-libs'      # libstdc++.so.6, libgcc_s.so.1
	'glibc'
	'harfbuzz'      # libharfbuzz.so.0
	'libdrm'        # libdrm.so.2
	'libgpg-error'  # libgpg-error.so.0
	'libglvnd'      # libGL.so.1, libEGL.so.1
	'libice'        # libICE.so.6
	'libsm'         # libSM.so.6
	'libx11'        # libX11.so.6, libX11-xcb.so.1
	'libxcb'        # libxcb.so.1
	'mesa'          # libgbm.so.1
	'wayland'       # libwayland-client.so.0
	'zlib'          # libz.so.1
)
provides=("simulide2=${pkgver}")
conflicts=('simulide2')
# The shipped binaries are prebuilt and partly non-ELF payloads (ESP32 ROM
# images), so they must not be touched by the strip/debug machinery.
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/p/fls/SimulIDE_2-${_build}_Lin64.tar.gz"
        'simulide2.sh'
        'simulide2.desktop'
        'simulide2.xml')
sha256sums=('a4c959698d96716888feeb44d94dd9123fa4d50334ec2440eb00974166444dd6'
            '52736a5945c779d82761659e2adcb9f4251500dc91b891becce141ec93ad1ff7'
            'bb3ecc15eafe68996a9a7c6b8b713d11694935606edaf8e620d0c1ada6026251'
            '665230bc782e77b39344a8e2d00dd7d1c51b26206ae87d52ce69c21824ff1555')

_srcdir="SimulIDE_2-${_build}_Lin64"

prepare() {
	cd "${_srcdir}"

	# Both shipped executables are AppImages.  Unpacking them removes the FUSE
	# requirement without changing behaviour: SimulIDE's AppRun is a plain
	# symlink to usr/bin/simulide (the loader relies solely on the RUNPATH
	# "$ORIGIN/../lib" and on usr/bin/qt.conf), and QEMU's AppRun only re-execs
	# its own binary after resolving $0 with "readlink -f".
	./simulide --appimage-extract >/dev/null
	rm -f simulide

	cd data/bin
	./qemu-system-xtensa --appimage-extract >/dev/null
	rm -f qemu-system-xtensa
	mv squashfs-root qemu

	# Desktop integration files of the QEMU AppDir; meaningless once unpacked.
	rm -rf qemu/usr/share qemu/.DirIcon qemu/qemu.desktop qemu/qemu.png
}

package() {
	cd "${_srcdir}"

	install -d "${pkgdir}/opt/simulide2"

	# bin/qt.conf sets Prefix=../ and Plugins=plugins and the executable's
	# RUNPATH is "$ORIGIN/../lib", both resolved relative to bin/, so bin, lib,
	# plugins and translations have to stay siblings of each other.
	cp -a squashfs-root/usr/bin \
	      squashfs-root/usr/lib \
	      squashfs-root/usr/plugins \
	      squashfs-root/usr/translations \
	      "${pkgdir}/opt/simulide2/"

	# SimulIDE looks these up relative to the working directory, which the
	# /usr/bin/simulide2 wrapper sets to /opt/simulide2.
	cp -a data examples "${pkgdir}/opt/simulide2/"

	# "./data/bin/qemu-system-xtensa" is hardcoded in SimulIDE; point it at the
	# unpacked QEMU AppDir, whose AppRun resolves its own location from $0.
	ln -s qemu/AppRun "${pkgdir}/opt/simulide2/data/bin/qemu-system-xtensa"

	find "${pkgdir}/opt/simulide2" -type d -exec chmod 755 {} +
	find "${pkgdir}/opt/simulide2" -type f -exec chmod 644 {} +
	find "${pkgdir}/opt/simulide2" -type f -name '*.so*' -exec chmod 755 {} +
	chmod 755 "${pkgdir}/opt/simulide2/bin/simulide" \
	          "${pkgdir}/opt/simulide2/data/bin/qemu/AppRun" \
	          "${pkgdir}/opt/simulide2/data/bin/qemu/usr/bin/qemu-system-xtensa_exec"

	install -Dm755 "${srcdir}/simulide2.sh" "${pkgdir}/usr/bin/simulide2"
	install -Dm644 "${srcdir}/simulide2.desktop" \
		"${pkgdir}/usr/share/applications/simulide2.desktop"
	install -Dm644 "${srcdir}/simulide2.xml" \
		"${pkgdir}/usr/share/mime/packages/simulide2.xml"
	install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/simulide.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/simulide2.png"
}
