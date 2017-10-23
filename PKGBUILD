# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

pkgname=octoprint
_reponame=OctoPrint
pkgver=1.3.5
pkgrel=1
pkgdesc="Responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=(any)
url="http://octoprint.org/"
license=('AGPL3')
depends=(
    'python2-awesome-slugify'
    'python2-blinker'
    'python2-chainmap'
    'python2-click'
    'python2-dateutil'
    'python2-feedparser'
    'python2-flask'
    'python2-flask-assets'
    'python2-flask-babel'
    'python2-flask-login'
    'python2-flask-principal'
    'python2-future'
    'python2-futures'
    'python2-markdown'
    'python2-netaddr'
    'python2-netifaces'
    'python2-pkginfo'
    'python2-psutil'
    'python2-pylru'
    'python2-pyserial'
    'python2-requests'
    'python2-rsa'
    'python2-sarge'
    'python2-scandir'
    'python2-semanticversion'
    'python2-sockjs-tornado'
    'python2-tornado'
    'python2-watchdog'
    'python2-websocket-client'
    'python2-wrapt'
    'python2-yaml'
)
optdepends=(
    'ffmpeg: timelapse support'
    'mjpg-streamer: stream images from webcam'
    'v4l-mjpg-stream: stream images from a Video4Linux capable camera'
)
provides=('octoprint')
install="octoprint.install"
source=(
    "https://github.com/foosel/OctoPrint/archive/${pkgver}.tar.gz"
    octoprint.run
    octoprint.service
    octoprint-deps.patch
    octoprint-jinja29.patch
)
sha512sums=('8ab8ca218fbfa3472c72f45f41d5653f702ea50391c9c040fba6070d9d55414c3166133fdcc183d67bf256be632ac1743d04a1f1394db3ad9c46ad352e36fc5f'
            '5c22c76e4089958ff42e2627f29c360fa0f9a73b849f1fe5092cdd9ae800323263b75ac7e23d7189badac9baa7daa850183bf2491680a0ac01c605531728da62'
            '89a8703cbc8b8802eb6a360359f92904357a99bf5b1174c85d4555f88a816d4c008d077fe4f3fed4db0b23e8a662359bcfafaf7750a2ed50a81104f04d04c056'
            'a77e369c4bfcd47f63de25bc460a1a5856805e728dbfd4469c5dd5ff5128e55ef11430b0eb1d400a116c2de9d0552a507e04467f6d5b43ba440f5781e7e31dcd'
            '41e03bcc2111d1000ca0d62634009dc2030bae52b6623cd58a595f570e0f99e524613d52785b50098fe044fe5355b26221ce7a286148d9bdd95fb3f220bb5568')


prepare() {
    cd ${srcdir}/${_reponame}-${pkgver}

    patch -p1 < "$srcdir/octoprint-deps.patch"
    patch -p1 < "$srcdir/octoprint-jinja29.patch"
}

package() {
    cd ${srcdir}/${_reponame}-${pkgver}

    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m755 ${srcdir}/octoprint.run ${pkgdir}/usr/bin/octoprint
    install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
}
