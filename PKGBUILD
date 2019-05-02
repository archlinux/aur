# Maintainer: kumen
pkgname="stm32cubeide"
pkgver=1.0.0
_pkgver_ext="$pkgver"_2872_20190423_2022
pkgrel=2
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
depends=('java-runtime' 'jlink-software-and-documentation')
optdepends=('stlink')
conflicts=()
url="https://my.st.com/content/my_st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-ides/stm32cubeide.html"
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
sha256sums=('28929f7260e9be6350e4a45ce53c590f85a3096891dc80a4657c022c42a3949a'
	'9f034695b98dd8aec59aec9f51e78a7daffd601aacf9a302b5f46de84c7ad9f1')

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
	
	msg2 'Cleaning build folder'
	rm -rf "${srcdir}/build"
}

