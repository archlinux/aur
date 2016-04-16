# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

pkgname=octoprint
pkgver=1.2.10
pkgrel=1
pkgdesc="OctoPrint provides a responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=(any)
url="https://github.com/foosel/OctoPrint"
license=('GPL')
depends=(
    'python2-blinker'
    'python2-flask'
    'python2-flask-babel'
    'python2-flask-login'
    'python2-flask-principal'
    'python2-netaddr'
    'python2-numpy'
    'python2-pkginfo'
    'python2-pylru-git' # 'python2-pylru'
    'python2-pyserial'
    'python2-rsa'
    'python2-sarge-git' # 'python2-sarge'
    'python2-tornado'
    'python2-tornadio2'
    'python2-sockjs-tornado-git'
    'python2-webassets'
    'python2-watchdog'
    'python2-yaml'
    'python2-flask-assets'
    'python2-psutil'
    'python2-requests'
    'polkit'
    'python2-netifaces'
    'python2-awesome-slugify'
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
    octoprint-tornado401.patch
    )
md5sums=('SKIP'
         '3bee9901c9eabed94b7f9236f83bf053'
         'ec5e51f876bb5fb223801bf28850908a'
         '973bf9073a4a407c2228d511274ed377'
         )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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

prepare() {
    cd ${srcdir}/OctoPrint-${pkgver}

    # check the version of python2-tornado required by the OctoPrint
    # if it not python2-tornado 4.0.1, we need to switch back to new version!
    # If use the latest tornado, you don't need to patch the octoprint.
    VER=$(grep -Hrn '"tornado==' setup.py | awk -F= '{print $3}' | awk -F\" '{print $1}')
    VAL=$(echo $VER | awk -F. '{print 10000 * $1 + 100 * $2 + $3}')
    if (( $VAL <= 40001 )) ; then
        patch -p1 < "$srcdir/octoprint-tornado401.patch"
    else
        echo "The required version of tornado is now changed." 1>&2
    fi
}

package() {
    #cd ${srcdir}/${pkgname}
    cd ${srcdir}/OctoPrint-${pkgver}

    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p ${pkgdir}/usr/share/octoprint/
    cp -a * ${pkgdir}/usr/share/octoprint/
    #install -D -m755 run ${pkgdir}/usr/share/octoprint/run
    rm -rf ${pkgdir}/usr/share/octoprint/src/
    rm -rf ${pkgdir}/usr/share/octoprint/build/
    rm -rf ${pkgdir}/usr/share/octoprint/docs/
    rm -rf ${pkgdir}/usr/share/octoprint/tests/
    rm -rf ${pkgdir}/usr/share/octoprint/translations/

    install -D -m755 ${srcdir}/octoprint.run ${pkgdir}/usr/bin/octoprint
    install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
}
