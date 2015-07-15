# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=opera-developer
pkgver=32.0.1926.0
pkgrel=1
pkgdesc='A fast and secure web browser and Internet suite - developer stream'
arch=('x86_64' 'i686')
url='http://www.opera.com/browser/'
license=('custom:opera')
depends=('alsa-lib' 'nss' 'gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'desktop-file-utils')
optdepends=('ffmpeg: HTML5 H264 and mp3 playback')
install=opera.install
options=(!strip)
source_x86_64=("http://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb")
source_i686=("http://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_i386.deb")
sha256sums_x86_64=('b022885ce976e22d163f785e86ce1b19c707670150a5860f3f502c19026b56b3')
sha256sums_i686=('80f3def59b9d1a92479377834bcb4f6ed2bde765084c9b02de5b368e8fa0e997')
# alternative download
#source=("ftp://ftp.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb")
#source=("http://deb.opera.com/${pkgname}/pool/non-free/o/${pkgname}/${pkgname}_${pkgver}_amd64.deb")

package() {
	cd ${srcdir}/

	# this is nested archive with final directory structure,
	# so extract the inner tarball to ${pkgdir}
	tar xJf data.tar.xz -C "${pkgdir}/"

	# create ffmpeg compatibility symlinks if necessary
	for LIBAV in $(strings "${pkgdir}/usr/lib/${CARCH/i686/i386}-linux-gnu/${pkgname}/${pkgname}" | egrep 'libav[[:alpha:]]+.so'); do
		[ -s "/usr/lib/${LIBAV}" ] && continue

		install -d -m0755 "${pkgdir}/usr/lib/${CARCH/i686/i386}-linux-gnu/${pkgname}/lib/"
		ln -s ../../../$(basename "${LIBAV%.*}") "${pkgdir}/usr/lib/${CARCH/i686/i386}-linux-gnu/${pkgname}/lib/${LIBAV}"
	done

	# set suid bit for Opera sandbox
	chmod 4755 "${pkgdir}/usr/lib/${CARCH/i686/i386}-linux-gnu/${pkgname}/opera_sandbox"
}

