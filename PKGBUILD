# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

_pkgname=OctoPrint
pkgname=octoprint
# c55c568bbddf5112facf6aa3a173d500936b6cbf
pkgver=1.3.8
pkgrel=6
pkgdesc="Responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=(x86_64 armv6h armv7h)
url="http://octoprint.org/"
license=('AGPL3')
depends=(python2-babel
		python2-argh
		python2-frozendict
		python2-regex
		python2-blinker
		python2-wrapt
		python2-requests
		python2-markupsafe
		python2-markdown
		python2-pyserial
		python2-pkginfo
		python2-pathtools
		python2-feedparser
		python2-itsdangerous
		python2-certifi
		python2-backports.ssl_match_hostname
		python2-chardet
		python2-idna
		python2-six
		python2-pyasn1
		python2-urllib3
		python2-netaddr
		python2-speaklater
		python2-pytz
		python2-watchdog)
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

		0010-pkginfo.patch
		)

sha256sums=('ca1bc5352ef20778722a6b2aedef4c8dbe28d0d82c2526f84f3db07245a01aad'
            'bd9b7f989aefb02da1ac414f306861f21f084d886f0283eea11516482b407d65'
            '231685e84b0241a466766c766f8d3ba31efda3238f19e9adedea380e7b861737'
            '08e6ff10fb7f61c40e5770b67e8f7201d02d82d3bd46c5441a7f2b0435fbe9c2'
            '02be5d5a18febe215809882d96f068092c4474abb4e76d82e4450b860a4e9ef5'
            '735644dcd6a26eb02cefe1727d41d91c4a1dcb53d0b8a1876fe3fa9abe04eba2')

prepare()
{
	cd $_pkgname-$pkgver

	for s in ${source[@]}; do
		case $s in
			*.patch)	patch -p1 -i ${srcdir}/$s
						;;
		esac
	done
}

package() {
	virtualenv2 --system-site-packages $pkgdir/usr/lib/$pkgname

	pushd $_pkgname-$pkgver
	$pkgdir/usr/lib/$pkgname/bin/pip install .
	popd

	find $pkgdir/usr/lib/$pkgname -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::g" {} \;

	install -Dm644 octoprint.sysusers $pkgdir/usr/lib/sysusers.d/octoprint.conf
	install -Dm644 octoprint.service $pkgdir/usr/lib/systemd/system/octoprint.service
	install  -m755 octoprint-serve $pkgdir/usr/lib/$pkgname/bin
	install -Dm644 octoprint.conf $pkgdir/etc/conf.d/octoprint
	install -dm750 $pkgdir/var/lib/$pkgname
}

