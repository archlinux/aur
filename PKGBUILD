# Maintainer: Markus Koch <markus@notsyncing.net>
# Contributor: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Log in to xilinx.com
# 2. Go to https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html
# 3. Download "Vivado 2021.1: Lab Edition - Linux (TAR/GZIP)"
# 4. Place the .tar.gz in the same directory as the PKGBUILD
# 5. Build!
#
# No refunds for broken AUR helpers, just use make(chroot)pkg.
#
# SOME MORE NOTES:
#
# This package requires a reasonably ugly hack to build: since package() is run under fakeroot,
# and the installer tries to access the home directory no matter what `--location` is set to,
# it fails during "Running post-install tasks" because it tries to access `/root`.
# To fix this, a tiny shared library (see spoof_homedir.c) is LD_PRELOADed. Its only job is to
# wrap the `getpwuid()` function and modify the original return value for uid==0.
# Also, this package conflicts with the main Vivado installation due to the duplication of the udev rules, but this shouldn't be a problem as these tools are included in it. Thanks!
#
# CREDIT WHERE CREDIT IS DUE:
#
# All the heavy lifting for this install script was done by xiretza when creating the 'vivado'
# package. I only adapted it to work with the lab edition.

pkgname=vivado-lab-edition
_srcname=Xilinx_Vivado_Lab_Lin
pkgver=2021.1
_more_ver=0610_2318
pkgrel=1
pkgdesc="FPGA/CPLD Lab Tools for Xilinx devices"
url="https://www.xilinx.com/products/design-tools/vivado.html"
arch=('x86_64')
license=('custom')
depends=('gtk2')
optdepends=('fxload'
            'digilent.adept.runtime'
            'digilent.adept.utilities')
conflicts=('vivado')
source=("file:///${_srcname}_${pkgver}_${_more_ver}.tar.gz"
        'spoof_homedir.c')

# checksum from https://www.xilinx.com/support/download.html
md5sums=('2548424763ce4358dcb89258e89e5824'
         '69d14ad64f6ec44e041eaa8ffcb6f87c')

# takes forever for probably minimal gain
options=('!strip')

prepare() {
	mkdir -p "$srcdir/installer_temp"
}

build() {
	# build our getpwuid() wrapper library
	gcc -shared -fPIC -D "FAKE_HOME=\"$srcdir/installer_temp\"" spoof_homedir.c -o spoof_homedir.so -ldl
}

package() {
	cd "${_srcname}_${pkgver}_${_more_ver}"

	# LD_PRELOAD already contains libfakeroot.so, add our own library before that
	LD_PRELOAD="$srcdir/spoof_homedir.so:$LD_PRELOAD" ./xsetup \
		--batch Install \
		--agree XilinxEULA,3rdPartyEULA,WebTalkTerms \
		--edition 'Vivado Lab Edition (Standalone)' \
		--location "$pkgdir/opt/Xilinx"

	# install udev rules
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado_Lab/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado_Lab/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado_Lab/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

	# copy 'libtinfo' library from SuSE installation as Arch doesn't supply it
	install -Dm755 "$pkgdir/opt/Xilinx/Vivado_Lab/${pkgver}/lib/lnx64.o/SuSE/libtinfo.so.5" -t "$pkgdir/opt/Xilinx/Vivado_Lab/${pkgver}/lib/lnx64.o/"

	# install desktop files
	for deskfile in "$srcdir"/installer_temp/Desktop/*.desktop; do
		sed -i -e "s|$pkgdir||g" "$deskfile"
		install -Dm644 -t "$pkgdir/usr/share/applications/" "$deskfile"
	done

	# clean up artefacts, remove leading $pkgdir from paths
	rm -rf "$pkgdir/opt/Xilinx/.xinstall/"
	find "$pkgdir/opt/Xilinx/" -name '*settings64*' -exec sed -i -e "s|$pkgdir||g" '{}' \+

	# Save space for subsequent packaging, checking etc
	cd ..
	rm -rf "${_srcname}_${pkgver}_${_more_ver}"
}
