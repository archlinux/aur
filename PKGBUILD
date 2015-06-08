# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

pkgname=octoprint-devel-git
pkgver=1.1.2.r793.g106b21f
pkgrel=1
pkgdesc="OctoPrint provides a responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=('i686' 'x86_64' 'armv6' 'armv6h')
url="https://github.com/foosel/OctoPrint"
license=('GPL')
depends=('python2-flask'
         'python2-werkzeug'
         'python2-tornado'
         'python2-sockjs-tornado-git'
         'python2-yaml'
         'python2-flask-login'
         'python2-flask-principal'
         'python2-flask-babel'
         'python2-pyserial'
         'python2-netaddr'
         'python2-watchdog'
         'python2-sarge'
         'python2-netifaces'
         'python2-pylru'
         'python2-rsa'
         'python2-pkginfo'
         'python2-requests'
         'python2-semantic-version')
makedepends=( 'git' )
optdepends=( 
	'ffmpeg: timelapse support'
	'mjpg-streamer: stream images from webcam'
	'v4l-mjpg-stream: stream images from a Video4Linux capable camera'
	'python2-pip: automatic plugin installation'
)
provides=( 'octoprint' )
conflicts=( 'octoprint' )
install="octoprint.install"
source=( "$pkgname"::'git+https://github.com/foosel/OctoPrint.git#branch=devel'
         octoprint.service
         pipFix.patch)
md5sums=('SKIP'
         'ec5e51f876bb5fb223801bf28850908a'
         'af3a1ada9348312803ef38593b77d7ef')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
	patch -p0 < "$srcdir/pipFix.patch"
}

package() {
	cd ${srcdir}/${pkgname}

	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
}
