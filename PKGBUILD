# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=chromeos-pepper-flash
pkgdesc="Google ChromeOS's Pepper Flash plugin (with DRM enabled) for freshplayerplugin"
_verbld=7077.134.0
pkgver=18.0.0.223
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
conflicts=('chromium-pepper-flash-dev' 'chromium-pepper-flash')
provides=('pepper-flash')
makedepends=('e2tools')
source=(${pkgname}-license.html::https://www.google.com/intl/%s/chrome/eula_text.html)
source_i686=("https://dl.google.com/dl/edgedl/chromeos/recovery/chromeos_${_verbld}_x86-zgb_recovery_stable-channel_zgb-mp-v3.bin.zip")
source_x86_64=("https://dl.google.com/dl/edgedl/chromeos/recovery/chromeos_${_verbld}_zako_recovery_stable-channel_mp-v2.bin.zip")
sha256sums=('0daf3cd3d7611a30341419fca636e56a9d7f0f1946cd4e5b4e0365e9e4a3f678')
sha1sums_i686=('db4541d2af770ba1b39efdb2c3ca4a7c58ede16e')
sha1sums_x86_64=('40161284cea8ecbcda5219fca16cae57750779d9')

build() {
	# change into src directory
	cd "${srcdir}"
	
	#rename image
	if [ $CARCH == "i686" ]
	then
		mv "chromeos_${_verbld}_x86-zgb_recovery_stable-channel_zgb-mp-v3.bin" "chromeos.bin"
	else
		mv "chromeos_${_verbld}_zako_recovery_stable-channel_mp-v2.bin" "chromeos.bin"
	fi

	#define start and end of partition
	export CSTART=$(fdisk -l chromeos.bin 2>/dev/null|grep '.bin3'|awk '{print $2}')
	export CEND=$(fdisk -l chromeos.bin 2>/dev/null|grep '.bin3'|awk '{print $4}')

	#extract rootfs patition
	dd if=./chromeos.bin of=rootfs.img bs=512 skip="$CSTART" count="$CEND" 

	#unset variables
	unset CSTART
	unset CEND

	#extracting files
	e2cp rootfs.img:/opt/google/chrome/pepper/libpepflashplayer.so ${srcdir}
	e2cp rootfs.img:/opt/google/chrome/pepper/pepper-flash.info ${srcdir}
}

package() {
	# create required directories
	install -d "${pkgdir}"/usr/lib/PepperFlash
	# copy required files
	install -m644 "${srcdir}"/libpepflashplayer.so "${pkgdir}"/usr/lib/PepperFlash
	install -m644 "${srcdir}"/pepper-flash.info "${pkgdir}"/usr/lib/PepperFlash
	# copy license
	install -Dm644 "${srcdir}"/${pkgname}-license.html "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
}

