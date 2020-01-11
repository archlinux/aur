# Maintainer: kumen
# Contributor: nightuser <nightuser.android@gmail.com>

pkgname="stm32cubeide"
pkgver=1.2.0
_pkgver_ext="$pkgver"_5034_20200108_0926
_pkg_file_name=en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip
pkgrel=1
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
makedepends=('xdg-user-dirs')
depends=('java-runtime' 'jlink-software-and-documentation' 'ncurses5-compat-libs' 'lib32-glibc' 'libusb')
optdepends=('stlink')
conflicts=()
url="https://www.st.com/en/development-tools/stm32cubeide.html"
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: "
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}"
	$pkgname.desktop)
sha256sums=('cc4d5eba6d6de747f0b3c85164ab10e49478efa06e2a59183434efedb472f251'
	'415d652cfe852206036af695168b5764e02d048f2026e81da536d8d3f0cc2980')

prepare(){
	cd "$srcdir"
	mkdir build
        sh st-stm32cubeide_${_pkgver_ext}_amd64.sh --quiet --noexec --target ./build  
        
	cd build
	mkdir stlink-server
	sh st-stlink-server.*.install.sh --quiet --noexec --target ./stlink-server
        
	mkdir stlink-udev
	sh st-stlink-udev-rules-*-linux-noarch.sh --quiet --noexec --target ./stlink-udev

	mkdir jlink-udev
	sh segger-jlink-udev-rules-*-linux-noarch.sh --quiet --noexec --target ./jlink-udev
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	tar zxvf "./build/st-stm32cubeide_${_pkgver_ext}_amd64.tar.gz" -C "${pkgdir}/opt/${pkgname}"
	
	msg2 'Installing stlink server'
	install -d -m755 "${pkgdir}/usr/bin/"
	cp "${srcdir}/build/stlink-server/stlink-server" "${pkgdir}/usr/bin/"
	chmod 0755 "${pkgdir}/usr/bin/stlink-server"
	
	msg2 'Instalation of STlink udev rules skipped'
	#msg2 'Installing STlink udev rules'
	#cd "$srcdir/build/stlink-udev"
        #tar zxf st-stlink-udev-rules-*-linux-all.tar.gz
        #cd "${pkgdir}/"
        #gzip -dc "$srcdir/build/stlink-udev/st-stlink-udev-rules.sw" | tar -xpf -
        
        msg2 'Instalation of JLink udev rules skipped'
        #msg2 'Installing JLink udev rules'
	#cd "$srcdir/build/jlink-udev"
        #tar zxf segger-jlink-udev-rules-*-linux-noarch.tar.gz
        #cd "${pkgdir}/"
        #gzip -dc "$srcdir/build/jlink-udev/segger-jlink-udev-rules.sw" | tar -xpf -
        
        msg2 'Installing desktop shortcuts'
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	#msg2 'Cleaning build folder'
	#rm -rf "${srcdir}/build"
	
	msg2 'Prevent automatical *.desktop file replacement by not functional one'
	rm ${pkgdir}/opt/stm32cubeide/plugins/com.st.stm32cube.ide.mcu.ide_*/resources/project_importer/linux/mimetype/stm32cubeide.desktop.template
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
