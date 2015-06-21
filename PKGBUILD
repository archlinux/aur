#!/usr/bin/bash
# Maintainer: Andy Pieters Email address: http://www.google.com/recaptcha/mailhide/d?k=01Ki1c9JXzChsLtix5Bxu-qw==&c=1kofqD_jhDD8xD-SsJCk3-8DptvHUrc2qB4YPUWwBk4=

pkgname=("lifx-firmware-update" "libotav1" "libotav2")

__lifx_firmware_version="2.2.0"
__lifx_firmware_release="Jun"
__lifx_firmware_update_filename="${pkgname}_${__lifx_firmware_version}_amd64-${__lifx_firmware_release}.deb?dl=1"

pkgver="${__lifx_firmware_version}${__lifx_firmware_release}"
pkgrel=1
pkgdesc="Firmware updater for Lifx light bulbs"

arch=(x86_64)

url="http://www.lifx.com/pages/updates"

license=("custom:unknown")

depends=(qt5-base)
makedepends=(binutils)

source=(
	"https://dropbox.com/s/fwc759w5bg96a1n/${__lifx_firmware_update_filename}"
	"lifx-firmware-update.install"
	CHANGELOG
	LICENSE
)

sha512sums=('a636fc42878f04e091a0341142ae43fa1250be4aaadc5da052bdc970184d606f2b079a3f570dd6c0cdd3aa9491bdae3b3b19cb27fb7cd59165f4f7a9a7375f25'
            '4d5898fcc387611be0356c0de7142affcadef110980b03013d2c18ebe1da509f48191d8a9c46c113e9854e98ac9bb9728d0c3482200f3a764e72c08457bc1ffd'
            '90764741ca88c2d7b2f3cae083a22a0b87d6f1c8cef0d703d4d51e2a40d39b853ee44306900ea1719c14d642ffde3df1ad34cd07437c3cca6f625173d4b9a677'
            '04f404a850a3b839feaa8b5590043bd9d7442ac354a2060045943005de5dfc5e7f706835beef68d08aae1a007841e1342190352c3c8e4f7b3c1d51703d8c504a')

prepare() {
        cd "${srcdir}"

		bsdtar -xf data.tar.xz
}

package_lifx-firmware-update() {

	depends=(libotav1 libotav2)
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

	lifx_firmware_install usr/local/lib/libotav1.so usr/local/lib/libotav2.so
		
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
			
			# remove the local/ part
			
			strTarget="${strFile/\/local}"
			
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
