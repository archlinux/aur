# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>
# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

_pkgname=OctoPrint
pkgname=octoprint
pkgver=1.3.8
pkgrel=1
pkgdesc="Responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=(x86_64 armv7h)
url="http://octoprint.org/"
license=('AGPL3')
makedepends=('python2-virtualenv')
optdepends=('ffmpeg: timelapse support'
			'mjpg-streamer: stream images from webcam'
			'v4l-mjpg-stream: stream images from a Video4Linux capable camera'
			)
provides=('octoprint')
conflicts=('octoprint-venv')
install="octoprint.install"
source=($pkgname-$pkgver.tar.gz::https://github.com/foosel/$_pkgname/archive/$pkgver.tar.gz
		octoprint.sysusers
		octoprint.service
		octoprint-serve
		octoprint.conf
		config.yaml
		)

package() {
	etcdir=etc/conf.d
	usrdir=usr/lib/$pkgname
	vardir=var/lib/$pkgname

	virtualenv2 $pkgdir/$usrdir

	pushd $_pkgname-$pkgver
	$pkgdir/$usrdir/bin/pip install .
	popd

	find $pkgdir/$usrdir/bin -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::" {} \;

	install -Dm644 octoprint.sysusers $pkgdir/usr/lib/sysusers.d/octoprint.conf
	install -Dm644 octoprint.service $pkgdir/usr/lib/systemd/system/octoprint.service
	install  -m755 octoprint-serve $pkgdir/$usrdir/bin
	install -Dm644 octoprint.conf $pkgdir/$etcdir/octoprint
	install -dm750 $pkgdir/$vardir
	install -Dm640 config.yaml $pkgdir/$vardir/.octoprint/config.yaml
}

sha256sums=('92fd33279c38a5a54e46b0b3c3d465d8d2c7fa02cc01aba80b225a926b30d488'
            'bd9b7f989aefb02da1ac414f306861f21f084d886f0283eea11516482b407d65'
            '2c0643310be2159feea91eae819d5ab593e6f20b8b6ee6a98d8bf8254125acfb'
            '08e6ff10fb7f61c40e5770b67e8f7201d02d82d3bd46c5441a7f2b0435fbe9c2'
            '02be5d5a18febe215809882d96f068092c4474abb4e76d82e4450b860a4e9ef5'
            'eb2994e21a97964d87f184d9db2399b75be96cc3e26969444ca865a94ff6de6a')

