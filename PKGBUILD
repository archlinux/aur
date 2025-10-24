# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=xilinx-ise
pkgver=14.7
pkgrel=1
pkgdesc="Xilinx ISE Design Suite"
url="https://www.xilinx.com/products/design-tools/ise-design-suite.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('libstdc++5' 'ncurses5-compat-libs' 'openmotif' 'qt4' 'rpcbind' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'gcc49')
optdepends=('fxload: Firmware loader for some programmer dongles'
            'digilent.adept.utilities: Digilent programmer support')
options=('!strip')
source=('file://Xilinx_ISE_DS_Lin_14.7_1015_1.tar')
source_i686=('xilinx-ise-32.desktop')
source_x86_64=('xilinx-ise-64.desktop')
md5sums=('e8065b2ffb411bb74ae32efa475f9817')
sha256sums_i686=('ecde1d1a403ccf366def3f6199f84992ded5e4626eeb6399395ad76f0e3d7643')
sha256sums_x86_64=('74b1bf6d07520314dec833a777ebc47a166992c3aeb771b20dca9562288da47a')
install=xilinx-ise.install

if [[ $CARCH == 'i686' ]]; then
	_arch=lin
	_bits=32
elif [[ $CARCH == 'x86_64' ]]; then
	_arch=lin64
	_bits=64
fi

build() {
	cd "${srcdir}"/Xilinx_ISE_DS_Lin_14.7_1015_1

	# Generate a sample batch install file
	yes | ./bin/$_arch/batchxsetup -samplebatchscript install.txt

	# Change the installation dir
	sed -i "s!^destination_dir=/opt/Xilinx!destination_dir=${pkgdir}/opt/Xilinx!" install.txt
}

package() {
	cd "${srcdir}"/Xilinx_ISE_DS_Lin_14.7_1015_1

	# Run the installer, agreeing to all the licenses
	yes | ./bin/$_arch/batchxsetup -batch install.txt

	# Trim the pkgdir path from the installation directory
	for _file in "${pkgdir}"/opt/Xilinx/14.7/ISE_DS/settings*; do
		sed -i "s!${pkgdir}!!g" "$_file"
	done

	# Replace ISE's outdated libstdc++.so with symlinks to the system version
	for _dir in "${pkgdir}"/opt/Xilinx/14.7/ISE_DS/{ISE,common}/lib/${_arch}; do
		rm "${_dir}"/libstdc++.so{,.6,.6.0.8}
		ln -s /usr/lib/libstdc++.so "${_dir}"/libstdc++.so
		ln -s libstdc++.so "${_dir}"/libstdc++.so.6
		ln -s libstdc++.so "${_dir}"/libstdc++.so.6.0.8
		ln -s /usr/lib/libstdc++.so.5 "${_dir}"/libstdc++.so.5
		ln -s /usr/lib/libXm.so.4 "${_dir}"/libXm.so.3
	done

	# Fix for the license configuration manager
	# https://forums.xilinx.com/t5/Installation-and-Licensing/ISE-14-7-on-CentOS-6-4-missing-libQt-Network-so-workaround/td-p/379325
	install -d "${pkgdir}"/usr/lib
	ln -s /usr/lib/libQtNetwork.so "${pkgdir}"/usr/lib/libQt_Network.so

	# Let ISIM/fuse use older gcc to avoid errors from newer gcc
	install -d "${pkgdir}"/usr/bin
	ln -s /usr/bin/gcc-4.9 "${pkgdir}"/usr/bin/gcc4

	# Fix missing XtAsprintf symbol for fpga_editor
	_preload_paths="/opt/Xilinx/14.7/ISE_DS/ISE/lib/${_arch}/libXm.so.3:/opt/Xilinx/14.7/ISE_DS/ISE/X11R6/lib/${_arch}/libXt.so:/usr/lib${_bits}/libXt.so"
	echo "setenv LD_PRELOAD ${_preload_paths}:\${LD_PRELOAD}" >> "${pkgdir}"/opt/Xilinx/14.7/ISE_DS/settings${_bits}.csh
	echo "export LD_PRELOAD=${_preload_paths}:\${LD_PRELOAD}" >> "${pkgdir}"/opt/Xilinx/14.7/ISE_DS/settings${_bits}.sh

	# Add legacy font paths for X11 100dpi and 75dpi font sets for fpga_editor
	install -d "${pkgdir}/etc/X11/fontpath.d"
	ln -s /usr/share/fonts/100dpi "${pkgdir}"/etc/X11/fontpath.d/xorg-fonts-100dpi
	ln -s /usr/share/fonts/75dpi "${pkgdir}"/etc/X11/fontpath.d/xorg-fonts-75dpi

	# Install .desktop file
	install -Dm 644 "${srcdir}"/xilinx-ise-${_bits}.desktop "${pkgdir}"/usr/share/applications/xilinx-ise.desktop
}
