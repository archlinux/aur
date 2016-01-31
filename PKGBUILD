#!/usr/bin/bash
# Maintainer: Andy Pieters Email address: http://www.google.com/recaptcha/mailhide/d?k=01Ki1c9JXzChsLtix5Bxu-qw==&c=1kofqD_jhDD8xD-SsJCk3-8DptvHUrc2qB4YPUWwBk4=

pkgname=("lifx-firmware-update" "libotav1" "libotav2" )

__lifx_firmware_version="2.4.0"
__lifx_firmware_release="oct"

pkgver="${__lifx_firmware_version}"
pkgrel=1
pkgdesc="Firmware updater for Lifx light bulbs"

arch=(x86_64)

url="http://www.lifx.com/pages/updates"

license=("custom:unknown")

depends=(qt5-base)
makedepends=('bash>=4')

source=(
	"https://dropbox.com/s/k7i2q2vvi7a7kck/LIFX-Bulb-Update-Installer-${__lifx_firmware_release^}.deb?dl=1"
	CHANGELOG
	LICENSE
)

sha512sums=('9aa82a57c9e5348da3841c8519008343ea966fa920a1d609237e27f665ef0213883249e419b417f37476a48a1030c3e9b37290b2ff0c60aaf03a0e4265e35db4'
            'ad918e2da0f20c577bf1b5b6abb797df58c38da3e39ead6745cab36fd6312e2984fdd38213806f07a9ac9c84e017b17e19f5b6154f47ebaeb6baecb337c4a5f8'
            '04f404a850a3b839feaa8b5590043bd9d7442ac354a2060045943005de5dfc5e7f706835beef68d08aae1a007841e1342190352c3c8e4f7b3c1d51703d8c504a')

prepare() {
        cd "${srcdir}"

		bsdtar -xf data.tar.xz
		
		# fix the desktop file
		
		sed -i 	-e 's#/usr/local/#/usr/#g' \
				-e 's#share/lifx#share/applications#g' \
				-e 's#\.run##g' \
				"${srcdir}/usr/local/share/lifx/lifx-firmware-update.desktop"
}

package_lifx-firmware-update() {

	depends=(libotav1 libotav2)
	provides=("lifx-firmware-update")
	replaces=("lifx-firmware-info")

	install="lifx-firmware-update.install"
	changelog=CHANGELOG

	mkdir -p "${pkgdir}"

	lifx_firmware_install_license # install license
	
	# alternatively to hard-coding this list, we could extract the 
	# control.tar.gz file, then get the file list by using the 2nd
	# column of the md5sums file, e.g. : 
	# __lifx_firmware_update_file_array=($( awk '{print $2}' < md5sums))

	lifx_firmware_install \
		usr/local/bin/lifx-firmware-update \
		usr/local/bin/lifx-firmware-update.run \
		usr/local/share/lifx/lifx-firmware-update.desktop \
		usr/local/share/lifx/lifx-firmware-update.png \
		usr/share/doc/lifx-firmware-update/changelog.gz
	
}

package_libotav1() {

	provides=(libotav1)
	
	pkgdesc="Support library for Lifx-firmware-updater"
	
	mkdir -p "${pkgdir}"
	
	lifx_firmware_install_license

	lifx_firmware_install usr/local/lib/libotav1.so
		
	# we can manually remove the local part here since the file need not be
	# copied from the source
	
	lifx_firmware_add_links usr/lib/libotav1.so libotav1.so.1{,.0{,.0}}

}

package_libotav2() {

	provides=(libotav2)
	
	pkgdesc="Support library for Lifx-firmware-updater"
	
	lifx_firmware_install_license
				
	lifx_firmware_install usr/local/lib/libotav2.so 

	lifx_firmware_add_links usr/lib/libotav2.so libotav2.so.1{,.0{,.0}}
}

# expects a list of files to install. each file needs to be a full or relative reference
# a /local/ part of the path will be removed to find the target file name
# careful if a file contains a space, it may be necessary to adjust things a bit
lifx_firmware_install() {

	while [[ 0 -lt $# ]]; do
	
		if [ -n "$1" ]; then
		
			local strFile="$1"
			
			# we need to do 2 transformations: any 'local' part has to be
			# removed from the destination, and, 
			# usr/share/lifx needs replacing with /usr/share/applications
			
			strTarget="${strFile/\/local}" # replace the local/ with naught, and
			
			strTarget="${strTarget/usr\/share\/lifx/usr\/share\/applications}" # adjust directory for icon and menu-entry
			
			# install the files 
			
			install -D --no-target-directory --owner root --group root \
					--mode 0555 --preserve-timestamps "${srcdir}/${strFile}" \
					"${pkgdir}/${strTarget}"
		fi
		
		shift
		
	done
}

lifx_firmware_add_links() {

	if [ 2 -le $# ]; then
	
		local strLinkTarget="${pkgdir}/$1"
		
		local strLinkTargetDir="$(dirname "${strLinkTarget}")"
		
		# check that this file is already "installed"
		
		if [ -e "${strLinkTarget}" ]; then
		
			shift
			
			while [[ 0 -lt $# ]]; do
			
				if [ -n "$1" ]; then
					
					ln -sr "${strLinkTarget}" "${strLinkTargetDir}/$1"
				
				else
				
					error "BUG: lifx_firmware_add_links called with empty parameter"
					
					exit 1
				fi
				
				shift
				
			done
		
		else
		
			error "BUG: Cannot create symbolic link to ${strLinkTarget} ; file not found in staging directory"
			
			exit 1
		fi
		
	else
	
		error "BUG: lifx_firmware_add_links must be called with at least 2 parameters"
		
		exit 1
	fi
}

lifx_firmware_install_license() {

	install -D --no-target-directory --owner root --group root \
			--mode 0555 "${srcdir}/LICENSE" \
			"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
				
}
