# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-openocd
pkgname=(nuclei-openocd)
pkgver=2025.10
pkgrel=1
pkgdesc="nuclei-openocd 是 Nuclei Studio IDE 的调试工具。"
arch=("x86_64")
depends=(
	capstone
	glibc
	hidapi
	jimtcl
	libftdi-compat
	libjaylink
	libusb
)
makedepends=('git')
optdepends=('nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
	'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
	'embedded-studio-risc-v: Segger Embedded Studio for RISC-V')
conflicts=()
url="https://github.com/riscv-mcu/riscv-openocd"
license=('GPL-2.0-or-later')
# options=(!strip !debug)
source=("$pkgname::git+${url}.git#branch=nuclei/${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"

	# modify udev rules
	sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules

	# ensure udev rules are not duplicated
	# 	patch -p1 -i "$srcdir/no-duplicate-udev-rules.patch"

	# revert workarounds for jimtcl expr syntax changes
	# 	git cherry-pick --no-commit 95603fae18f81eebdafc5b318e70f9e2cdefab9e

	# add missing includes (stdio.h)
	# 	git cherry-pick --no-commit 73390332d203f02aa5b9798a7550191d55650d97

	# run autotools configuration
	# all submodules are unnecessary, so skip setup
	./bootstrap nosubmodule
}

build() {
	export CFLAGS="${CFLAGS//-Werror=implicit-function-declaration/}"

	cd "$pkgname"

	local _features=(
		aice
		amtjtagaccel
		armjtagew
		at91rm9200
		buspirate
		capstone
		cmsis-dap
		dummy
		ep93xx
		ftdi
		gw16012
		ioutil
		jlink
		jtag_vpi
		legacy-ft2232_libftdi
		oocd_trace
		opendous
		openjtag_ftdi
		osbdm
		parport
		presto_libftdi
		remote-bitbang
		rlink
		stlink
		sysfsgpio
		ti-icdi
		ulink
		usb-blaster-2
		usb_blaster_libftdi
		usbprog
		vsllink
		# 		xlnx_pcie_xvc
	)

	./configure \
		--prefix=/opt/nuclei/openocd \
		--disable-werror \
		--disable-internal-jimtcl \
		--disable-internal-libjaylink \
		--disable-xlnx-pcie-xvc \
		${_features[@]/#/--enable-}

	make
}

package() {
	cd "$pkgname"

	make DESTDIR="$pkgdir" install

	install -vDm644 contrib/60-openocd.rules "$pkgdir/usr/lib/udev/rules.d/60-nuclei-openocd.rules "

	msg2 'Installing Nuclei OpenOCD'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/" \
		"${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/"

	ln -sf "/opt/nuclei/openocd/" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/openocd"
	ln -sf "/opt/nuclei/openocd/" "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/openocd"
}
