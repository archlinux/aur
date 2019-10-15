# Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Log in to xilinx.com
# 2. Go to https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html
# 3. Download "All OS installer Single-File Download" (.tar.gz) - WARNING: This file is about 19GB in size
# 4. Place the .tar.gz in the same directory as the PKGBUILD
# 5. Build!
#
# No refunds for broken AUR helpers, just use make(chroot)pkg.
#
# SOME MORE NOTES:
#
# This package is huge. The download alone is a 19GB .tar.gz, which decompresses to 20GB,
# and the final package (with compression disabled) is 28GB. Reserve at least 60GB when using makechrootpkg.
#
# It can also take about an hour to build, being mostly limited by I/O and single-thread
# performance. `namcap` takes another 30 minutes, make sure you're not running that automatically.
#
# It *also* requires a reasonably ugly hack to build: since package() is run under fakeroot,
# and the installer tries to access the home directory no matter what `--location` is set to,
# it fails during "Running post-install tasks" because it tries to access `/root`.
# To fix this, a tiny shared library (see spoof_homedir.c) is LD_PRELOADed. Its only job is to
# wrap the `getpwuid()` function and modify the original return value for uid==0.

pkgname=vivado
pkgver=2019.1
_more_ver=0524_1430
pkgrel=2
pkgdesc="FPGA/CPLD design suite for Xilinx devices"
url="https://www.xilinx.com/products/design-tools/vivado.html"
arch=('x86_64')
license=('custom')
depends=('ncurses5-compat-libs'
         'libpng12'
         'lib32-libpng12'
         'gtk2'
         'fxload'
         'digilent.adept.runtime'
         'digilent.adept.utilities'
         'xterm')

source=("file:///Xilinx_Vivado_SDK_${pkgver}_${_more_ver}.tar.gz"
        'spoof_homedir.c'
        'Xilinx-VivadoIDE.desktop'
        'Xilinx-SDK.desktop'
        'Xilinx-DocNav.desktop')

# checksum from https://www.xilinx.com/support/download.html
md5sums=('47388a71dc5962a4b8d76e752928616e'
         '69d14ad64f6ec44e041eaa8ffcb6f87c'
         'b7cad6d39ef5293d4f433b8c9959f486'
         '44bb51e1c8832f001cb7d21b90cb5796'
         '40d60bc80129f8e7fe7df56ec2605ebf')

options=('!strip')
PKGEXT=".pkg.tar"

prepare() {
	mkdir -p "$srcdir/installer_temp"

	sed -i "s/%VERSION%/$pkgver/g" *.desktop
}

build() {
	# build our getpwuid() wrapper library
	gcc -shared -fPIC -D "FAKE_HOME=\"$srcdir/installer_temp\"" spoof_homedir.c -o spoof_homedir.so -ldl
}

package() {
	cd "Xilinx_Vivado_SDK_${pkgver}_${_more_ver}"

	# LD_PRELOAD already contains libfakeroot.so, add our own library before that
	LD_PRELOAD="$srcdir/spoof_homedir.so:$LD_PRELOAD" ./xsetup \
		--batch Install \
		--agree XilinxEULA,3rdPartyEULA,WebTalkTerms \
		--edition 'Vivado HL WebPACK' \
		--location "$pkgdir/opt/Xilinx"

	# install udev rules
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/2019.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/2019.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/2019.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

	install -Dm644 "$srcdir/Xilinx-VivadoIDE.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/Xilinx-SDK.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/Xilinx-DocNav.desktop" -t "$pkgdir/usr/share/applications/"

	# clean up artefacts, remove leading $pkgdir from paths
	rm -rf "$pkgdir/opt/Xilinx/.xinstall/"
	find "$pkgdir/opt/Xilinx/" -name '*settings64*' -exec sed -ie "s|$pkgdir||g" '{}' \+
}

