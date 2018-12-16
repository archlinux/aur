# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=xilinx-ise
pkgver=14.7
pkgrel=1
pkgdesc="Xilinx ISE Design Suite"
url="http://www.xilinx.com/products/design-tools/ise-design-suite.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('ncurses5-compat-libs' 'qt4')
optdepends=('fxload: Firmware loader for some programmer dongles'
            'digilent.adept.utilities: Digilent programmer support')
options=('!strip')
source=('file://Xilinx_ISE_DS_Lin_14.7_1015_1.tar')
md5sums=('e8065b2ffb411bb74ae32efa475f9817')

PKGEXT=".pkg.tar"

if [[ $CARCH == 'i686' ]]; then
	_arch=lin
elif [[ $CARCH == 'x86_64' ]]; then
	_arch=lin64
fi

prepare() {
	cd ${srcdir}/Xilinx_ISE_DS_Lin_14.7_1015_1

	# Generate a sample batch install file
	yes | ./bin/$_arch/batchxsetup -samplebatchscript install.txt

	# Change the installation dir
	sed -i "s!^destination_dir=/opt/Xilinx!destination_dir=${pkgdir}/opt/Xilinx!" install.txt
}

package() {
	cd ${srcdir}/Xilinx_ISE_DS_Lin_14.7_1015_1

	# Run the installer, agreeing to all the licenses
	yes | ./bin/$_arch/batchxsetup -batch install.txt

	# Trim the pkgdir path from the installation directory
	for _file in ${pkgdir}/opt/Xilinx/14.7/ISE_DS/settings*; do
		sed -i "s!${pkgdir}!!g" $_file
	done

	# Replace ISE's outdated libstdc++.so with symlinks to the system version
	for _dir in ${pkgdir}/opt/Xilinx/14.7/ISE_DS/{ISE,common}/lib/${_arch}; do
		rm ${_dir}/libstdc++.so{,.6,.6.0.8}
		ln -s /usr/lib/libstdc++.so ${_dir}/libstdc++.so
		ln -s libstdc++.so ${_dir}/libstdc++.so.6
		ln -s libstdc++.so ${_dir}/libstdc++.so.6.0.8
	done

	# Fix for the license configuration manager
	# https://forums.xilinx.com/t5/Installation-and-Licensing/ISE-14-7-on-CentOS-6-4-missing-libQt-Network-so-workaround/td-p/379325
	install -d ${pkgdir}/usr/lib
	ln -s /usr/lib/libQtNetwork.so ${pkgdir}/usr/lib/libQt_Network.so
}
