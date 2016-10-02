# Maintainer: Evgeny Shvits <tony.darko@gmail.com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the users group.

_basename=quartus-free
pkgname="${_basename}-91"
pkgver=9.1.2.350
pkgrel=1
pkgdesc="Quartus II 9.1 Web Edition."
arch=('i686' 'x86_64')
url="http://www.altera.com/products/software/quartus-ii/web-edition"
license=('custom')
provides=("${_basename}")
conflicts=("${_basename}")

_alteradir="/opt/altera91"

if [[ $CARCH = i686 ]]
then
	depends=('tcsh' 'glibc' 'libxext' 'libx11' 'libxau' 'libxdmcp' 'freetype2' 'fontconfig' 'expat'
			 'libpng' 'qt4' 'qtwebkit')
fi

if [[ $CARCH = x86_64 ]]
then
	depends=('tcsh' 'lib32-glibc' 'lib32-libxext' 'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp'
			 'lib32-freetype2' 'lib32-fontconfig' 'lib32-expat' 'lib32-libpng' 'lib32-qt4' 
			 'qtwebkit')
fi

source=("http://download.altera.com/software/acds/9.1sp2/350/download/91sp2_quartus_free_linux.tar"
		"quartus.sh"
		"quartus.desktop"
		"51-usbblaster.rules")
md5sums=('f61c84a752750cef29d59bc2e5490cd8'
         'c34dfaf31247ccbd505578e2e5b040ac'
         '32b17cb8b992fc2dccd33d87f0dcd8ce'
         '3d448098eda1515e503ed9dcac7b64a5')

options=('!strip' '!upx')

PKGEXT=".pkg.tar"

package() {
	cd "${srcdir}/quartus_free"

	./install --auto ${pkgdir}${_alteradir}

	rm "${pkgdir}${_alteradir}/install_9.1sp2_log.txt"

	# remove old version libraries
	rm "${pkgdir}${_alteradir}/quartus/linux/libX11.so.6"
	rm "${pkgdir}${_alteradir}/quartus/linux/libuuid.so.1"

	# backup Qt libraries
	mv "${pkgdir}${_alteradir}/quartus/linux/libQtCore.so.4"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libQtGui.so.4"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libQtNetwork.so.4"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libQtXml.so.4"{,.bak}

	# backup C++ standart libraries
	mv "${pkgdir}${_alteradir}/quartus/linux/libstdc++-libc6.2-2.so.3"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libstdc++.so.5"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libstdc++.so.6"{,.bak}
	mv "${pkgdir}${_alteradir}/quartus/linux/libstdc++.so"{,.bak}

	cd "${srcdir}"

	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop

	install -D -m644 "${pkgdir}${_alteradir}/quartus/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
	install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
	install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"

}
