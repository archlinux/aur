# Maintainer: kumen
pkgname="stm32cubeide"
pkgver=1.0.2
_pkgver_ext="$pkgver"_3566_20190716_0927
pkgrel=1
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
depends=('java-runtime' 'jlink-software-and-documentation')
optdepends=('stlink')
conflicts=()
url="https://www.st.com/en/development-tools/stm32cubeide.html"
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip ]; then
	if [ -f $_DOWNLOADS_DIR/en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip ]; then
		ln -sfn $_DOWNLOADS_DIR/en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: "
		msg2 "Please remember to put a downloaded package en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://en.st-stm32cubeide_${_pkgver_ext}_amd64.sh.zip"
	$pkgname.desktop)
sha256sums=('bf8b8d6bd0bf7009c2240d88019d09950b96663f37dd8703e8e9b2365508ab6e'
	'2bfee50bd9875642c376d1c2af12a9f698a407aa2798413154e98dada4e5f937')

prepare(){
	cd "$srcdir"
	mkdir build
        sh st-stm32cubeide_${_pkgver_ext}_amd64.sh --quiet --noexec --target ./build  
        
        cd build
        mkdir stlink-server
        sh st-stlink-server*.sh --quiet --noexec --target ./stlink-server
        
        mkdir stlink-udev
        sh st-stlink-udev-rules-1.0.0-linux-noarch.sh --quiet --noexec --target ./stlink-udev

        mkdir jlink-udev
        sh segger-jlink-udev-rules-6.44c-3-linux-noarch.sh --quiet --noexec --target ./jlink-udev
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
	mv ${pkgdir}/opt/stm32cubeide/plugins/com.st.stm32cube.ide.mcu.ide_1.0.2.201907121423/resources/project_importer/linux/mimetype/stm32cubeide.desktop.template ${pkgdir}/opt/stm32cubeide/plugins/com.st.stm32cube.ide.mcu.ide_1.0.2.201907121423/resources/project_importer/linux/mimetype/stm32cubeide.desktop.template.old
}

#
# makepkg --printsrcinfo > .SRCINFO
#
