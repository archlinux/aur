# Maintainer: sqrlfish at gmail dot com
pkgname=stream2chromecast-git
_pkgname=stream2chromecast
pkgver=0.6.3
pkgrel=1
pkgdesc="Chromecast media streamer for Linux"
arch=('any')
url="https://github.com/dohliam/${_pkgname}"
license=('GPL')
depends=('python2>=2.7.0')
optdepends=('ffmpeg: realtime transcoding support')
provides=('stream2chromecast')
conflicts=("${_pkgname}")
source=("git+https://github.com/dohliam/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  grep -Po '(?<=version: )([0-9\.]+)' stream2chromecast.py
	)
}

package() {
	cd "${srcdir}/${_pkgname}"
	sed -i '1s/env python$/env python2/' stream2chromecast.py #requires python2
	install -D -m755 stream2chromecast.py "${pkgdir}/usr/bin/stream2chromecast"
	install -D -m644 cc_device_finder.py "${pkgdir}/usr/lib/python2.7/site-packages/cc_device_finder.py"
	install -D -m644 cc_media_controller.py "${pkgdir}/usr/lib/python2.7/site-packages/cc_media_controller.py"
	install -D -m644 cc_message.py "${pkgdir}/usr/lib/python2.7/site-packages/cc_message.py"
}
