# Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Log in to xilinx.com
# 2. Go to https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html
# 3. Download "Xilinx Unified Installer SFD (TAR/GZIP)" - WARNING: This file is >90GB in size
# 4. Place the .tar.gz in the same directory as the PKGBUILD
# 5. Build!
#
# No refunds for broken AUR helpers, just use make(chroot)pkg.
#
# SOME MORE NOTES:
#
# This package is huge. The download alone is a barely-compressed 90GB .tar.gz (extracts to ~90GB)
# and the final zstd-compressed package is another 20GB. Reserve at least 200GB in total for building.
#
# It can also take up to two hours to build, being mostly limited by I/O and single-thread
# performance. `namcap` takes another 30 minutes, make sure you're not running that automatically.
#
# It *also* requires a reasonably ugly hack to build: since package() is run under fakeroot,
# and the installer tries to access the home directory no matter what `--location` is set to,
# it fails during "Running post-install tasks" because it tries to access `/root`.
# To fix this, a tiny shared library (see spoof_homedir.c) is LD_PRELOADed. Its only job is to
# wrap the `getpwuid()` function and modify the original return value for uid==0.

pkgname=vitis
_srcname=Xilinx_Unified
pkgver=2022.2
_more_ver=1014_8888
pkgrel=1
pkgdesc="FPGA/CPLD design suite for Xilinx devices"
url="https://www.xilinx.com/products/design-tools/vitis.html"
arch=('x86_64')
license=('custom')
makedepends=('python')
depends=('ncurses5-compat-libs'
         'libxcrypt-compat'
         'libpng12'
         'lib32-libpng12'
         'gtk2'
         'xorg-xlsclients'
         'cpio'
)
optdepends=('fxload'
            'digilent.adept.runtime'
            'digilent.adept.utilities'
            'matlab: Model Composer'
            'qt4: Model Composer'
						python gcc git graphviz make net-tools openssl
)
provides=(vivado)
conflicts=(vivado)
source=("file:///${_srcname}_${pkgver}_${_more_ver}.tar.gz"
        'spoof_homedir.c')

# checksum from https://www.xilinx.com/support/download.html
md5sums=('4b4e84306eb631fe67d3efb469122671'
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
		--agree XilinxEULA,3rdPartyEULA \
		--product Vitis \
		--edition 'Vitis Unified Software Platform' \
		--location "$pkgdir/opt/Xilinx"

	# install udev rules
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

	# install desktop files
	for deskfile in "$srcdir"/installer_temp/Desktop/*.desktop; do
		sed -i -e "s|$pkgdir||g" "$deskfile"
		install -Dm644 -t "$pkgdir/usr/share/applications/" "$deskfile"
	done

	# Only remove $pkgdir in the to-be-stored strings, i.e. 2nd, 3rd occurrence,
	# but leave $pkgdir where needed to find files
	_relocator=$pkgdir/opt/Xilinx/Vitis/${pkgver}/data/emulation/qemu/comp/qemu/relocate_sdk.sh
	sed -i -e "/^\\\${PYTHON}/{;s|$pkgdir||2;s|$pkgdir||2;}" "$_relocator"
	# Run the fixed relocator
	"$_relocator"
	# Now remove the remaining traces of $pkgdir
	sed -i -e "s|$pkgdir||g" "$_relocator"
	sed -i -e "s|$pkgdir||g" "$pkgdir/opt/Xilinx/Vitis/2022.2/data/emulation/qemu/comp/qemu/environment-setup-x86_64-petalinux-linux"
	# clean up artefacts, remove leading $pkgdir from paths
	rm -rf "$pkgdir/opt/Xilinx/.xinstall/"
	find "$pkgdir/opt/Xilinx/" -name '*settings64*' -exec sed -i -e "s|$pkgdir||g" '{}' \+

	# Save space for subsequent packaging, checking etc
	cd ..
	rm -rf "${_srcname}_${pkgver}_${_more_ver}"
}
