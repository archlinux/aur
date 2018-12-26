# Maintainer: Victor van Herpt <victor@codibit.es>
# Contributor: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# You'll need to download the package archive from
# https://www.blackmagicdesign.com/products/davinciresolve

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

pkgname=davinci-resolve-studio
_pkgname=resolve
pkgver=15.2.2
pkgrel=3
pkgdesc='Professional A/V post-production software suite'
arch=('x86_64')
url="https://www.blackmagicdesign.com/"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'libpng12' 'lib32-libpng12' 'ocl-icd' 'openssl-1.0'
         'opencl-driver' 'qt4' 'qt5-base' 'qt5-svg' 'qt5-webkit'
         'qt5-webengine' 'qt5-websockets')
makedepends=('xdg-user-dirs' 'unzip' 'libisoburn')
options=('!strip')
conflicts=('davinci-resolve-beta' 'davinci-resolve' 'davinci-resolve-studio-beta')
install='davinci-resolve-studio.install'




source=("davinci-resolve-studio.install" "75-davincipanel.rules" "75-sdx.rules" "davinci-resolve-studio.desktop")
sha256sums=('ced9031d69d98222b9fd16ea4b776e356076a0e9286547ee2a8a5b4d07850799' '364c3b1b0ee39ce009840dba93e22e141e7aadc27f3254dbbf23d1b94c38a641' '5190c0c42d3c84ae4691c73b6fe28e7f471da6a247e7400e7b5181a6c0c81bee' '7da47b9afed6f82841c2385d37e12ba575989cdd347f7e88399632d53b0a4b36' )

prepare(){
	_archive="DaVinci_Resolve_Studio_${pkgver}_Linux.zip"
    	_archive_sha256sum='e6b0947d48dd702ade93c455bb7c5e82e0be3484e5927ba56741a02b947e3bb2'

	DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`

	if [ ! -f ${srcdir}/${_archive} ]; then
		if [ -f $DOWNLOADS_DIR/${_archive} ]; then
		    ln -sfn $DOWNLOADS_DIR/${_archive} ${srcdir}
		else
		    msg2 "The package archive can be downloaded here: https://www.blackmagicdesign.com/products/davinciresolve/"
		    msg2 "Please remember to put a downloaded package ${_archive} into the build directory or $DOWNLOADS_DIR"
		    exit 1
		fi
	fi

# check integrity
	if ! echo "${_archive_sha256sum} ${srcdir}/${_archive}" | sha256sum -c --quiet; then
	echo "Invalid checksum for ${_archive}"
	return 1
	fi

	    
# extract package
	    unzip ${srcdir}/${_archive}
}

package() {


# Extract DaVinci Resolve Archive
	mkdir -p "${srcdir}/unpack"

# Create directories
	mkdir -p "${pkgdir}/opt/${_pkgname}/"{configs,easyDCP,logs,scripts,.LUT,.license,.crashreport,DolbyVision,Fairlight,Media,"Resolve Disk Database"}

# Extract DaVinci Resolve Archive
	xorriso -osirrox on -indev "${srcdir}/DaVinci_Resolve_Studio_${pkgver}_Linux.run" -extract / "${srcdir}/unpack"

# Copy objects

	cp -rp "${srcdir}/unpack/bin" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/Control" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/DaVinci Resolve Panels Setup" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/Developer" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/docs" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/Fusion" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/graphics" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/libs" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/LUT" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/Onboarding" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/plugins" "${pkgdir}/opt/${_pkgname}/"
	cp -rp "${srcdir}/unpack/UI_Resource" "${pkgdir}/opt/${_pkgname}/"
    #scripts
	cp -p "${srcdir}/unpack/scripts/script.checkfirmware" "${pkgdir}/opt/${_pkgname}/scripts"
	cp -p "${srcdir}/unpack/scripts/script.getlogs.v4" "${pkgdir}/opt/${_pkgname}/scripts"
	cp -p "${srcdir}/unpack/scripts/script.start" "${pkgdir}/opt/${_pkgname}/scripts"
    #configs
	cp -rp "${srcdir}/unpack/share/default-config-linux.dat" "${pkgdir}/opt/${_pkgname}/configs/config.dat-pkg-default"
	cp -rp "${srcdir}/unpack/share/log-conf.xml" "${pkgdir}/opt/${_pkgname}/configs/log-conf.xml-pkg-default"
	cp -rp "${srcdir}/unpack/share/default_cm_config.bin" "${pkgdir}/opt/${_pkgname}/DolbyVision/config.bin-pkg-default"

#Add lib symlinks
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	ln -s /usr/lib/libcrypto.so.1.0.0  libs/libcrypto.so.10
	ln -s /usr/lib/libssl.so.1.0.0     libs/libssl.so.10
	ln -s /usr/lib/libgstbase-1.0.so   libs/libgstbase-0.10.so.0
	ln -s /usr/lib/libgstreamer-1.0.so libs/libgstreamer-0.10.so.0

#Set proper permissions
	chmod -R a+rw "${pkgdir}/opt/resolve/configs"
	chmod -R a+rw "${pkgdir}/opt/resolve/easyDCP"
	chmod -R a+rw "${pkgdir}/opt/resolve/logs"
	chmod -R a+rw "${pkgdir}/opt/resolve/Developer"
	chmod -R a+rw "${pkgdir}/opt/resolve/DolbyVision"
	chmod -R a+rw "${pkgdir}/opt/resolve/LUT"
	chmod -R a+rw "${pkgdir}/opt/resolve/.LUT"
	chmod -R a+rw "${pkgdir}/opt/resolve/.license"
	chmod -R a+rw "${pkgdir}/opt/resolve/.crashreport"
	chmod -R a+rw "${pkgdir}/opt/resolve/Resolve Disk Database"
	chmod -R a+rw "${pkgdir}/opt/resolve/Fairlight"
	chmod -R a+rw "${pkgdir}/opt/resolve/Media"

#Installing udev rules for panels and dongles
	
	install -Dm644 ${srcdir}/75-davincipanel.rules "${pkgdir}/usr/lib/udev/rules.d/75-davincipanel.rules"
	install -Dm644 ${srcdir}/75-sdx.rules "${pkgdir}/usr/lib/udev/rules.d/75-sdx.rules"

#Install .desktop launcher
	install -Dm644 "${srcdir}/davinci-resolve-studio.desktop" "${pkgdir}/usr/share/applications/DaVinci Resolve Studio.desktop"

}
