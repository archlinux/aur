# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=opera-developer
pkgver=32.0.1910.0
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
sha256sums_x86_64=('c9f3ca6b8b07bbc586dd4f09f56658daa7d3c640b71e057c1df486c3e33df429')
sha256sums_i686=('2277fff8c0cd99ae2ac4f979726a0ea32cd12929a10926bce25c79bdaee9097d')
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

