# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>
# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

_pkgname=OctoPrint
pkgname=octoprint
# c55c568bbddf5112facf6aa3a173d500936b6cbf
pkgver=1.3.8
pkgrel=3
pkgdesc="Responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=(x86_64 armv7h)
url="http://octoprint.org/"
license=('AGPL3')
makedepends=('python2-virtualenv')
optdepends=('ffmpeg: timelapse support'
			'motion: motion detector which grabs images from video4linux devices and/or from webcams'
			'mjpg-streamer: stream images from webcam'
			)
provides=(octoprint)
conflicts=('octoprint-venv')
install=octoprint.install
backup=(etc/conf.d/octoprint)
source=($pkgname-$pkgver.tar.gz::https://github.com/foosel/$_pkgname/archive/$pkgver.tar.gz
		octoprint.sysusers
		octoprint.service
		octoprint-serve
		octoprint.conf
		)

package() {
	virtualenv2 $pkgdir/usr/lib/$pkgname

	pushd $_pkgname-$pkgver
	$pkgdir/usr/lib/$pkgname/bin/pip install .
	popd

	find $pkgdir/usr/lib/$pkgname/bin -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::" {} \;

	install -Dm644 octoprint.sysusers $pkgdir/usr/lib/sysusers.d/octoprint.conf
	install -Dm644 octoprint.service $pkgdir/usr/lib/systemd/system/octoprint.service
	install  -m755 octoprint-serve $pkgdir/usr/lib/$pkgname/bin
	install -Dm644 octoprint.conf $pkgdir/etc/conf.d/octoprint
	install -dm750 $pkgdir/var/lib/$pkgname
}

sha256sums=('ca1bc5352ef20778722a6b2aedef4c8dbe28d0d82c2526f84f3db07245a01aad'
	'bd9b7f989aefb02da1ac414f306861f21f084d886f0283eea11516482b407d65'
	'2c0643310be2159feea91eae819d5ab593e6f20b8b6ee6a98d8bf8254125acfb'
	'08e6ff10fb7f61c40e5770b67e8f7201d02d82d3bd46c5441a7f2b0435fbe9c2'
	'02be5d5a18febe215809882d96f068092c4474abb4e76d82e4450b860a4e9ef5'
	)

