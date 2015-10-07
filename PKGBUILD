# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

pkgname=octoprint
pkgver=1.2.6
pkgrel=1
pkgdesc="OctoPrint provides a responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=('i686' 'x86_64' 'armv6' 'armv6h')
url="https://github.com/foosel/OctoPrint"
license=('GPL')
depends=(
    'python2-blinker'
    'python2-flask'
    #'python2-flask-assets'
    'python2-flask-babel'
    'python2-flask-login'
    'python2-flask-principal'
    'python2-netaddr'
    'python2-numpy'
    'python2-pkginfo'
    'python2-pylru'
    'python2-pyserial'
    'python2-rsa'
    'python2-sarge'
    'python2-sockjs-tornado-git'
    'python2-tornado'
    'python2-tornadio2'
    'python2-webassets'
    'python2-watchdog'
    'python2-yaml'
    )
makedepends=( 'git' )
optdepends=( 
    'ffmpeg: timelapse support'
    'mjpg-streamer: stream images from webcam'
    'v4l-mjpg-stream: stream images from a Video4Linux capable camera'
)
provides=( 'octoprint' )
conflicts=( 'octoprint' )
install="octoprint.install"
source=(
    #"${pkgname}::git+https://github.com/foosel/OctoPrint.git#commit=${pkgver}"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/foosel/OctoPrint/archive/${pkgver}.tar.gz"
    octoprint.run
    octoprint.service
    )
md5sums=('SKIP'
         '3bee9901c9eabed94b7f9236f83bf053'
         'ec5e51f876bb5fb223801bf28850908a')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

#pkgver() {
#    pkgver_git
#}

package() {
    #cd ${srcdir}/${pkgname}
    cd ${srcdir}/OctoPrint-${pkgver}

    mkdir -p ${pkgdir}/usr/share/octoprint/

    cp -a * ${pkgdir}/usr/share/octoprint/

    install -D -m755 ${srcdir}/octoprint.run ${pkgdir}/usr/bin/octoprint
    install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
}
