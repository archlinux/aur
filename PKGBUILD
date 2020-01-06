# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>>
#
pkgname="cameramonitor"
pkgver="0.3.2"
pkgrel="7"
pkgdesc="A little monitor to check if your Webcam is On."
url="http://www.infinicode.org/code/cameramonitor/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('pygtk' 'python2' 'python2-dbus' 'python2-gconf' 'python2-notify' 'python2-pyinotify')
source=("https://launchpad.net/cameramonitor/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('04b120c8f3eb7f6c02976b0f3de21ecd13005c920e2acb294e3ffcad7fcd2058')

build() {
    cd "${pkgname}-${pkgver}"

    ./configure --prefix /usr

    sed -i 's/python3.8/python2.7/g' config.status
    sed -i 's/"3.8"/"2.7"/g' config.status
    sed -i 's_bin/python_bin/python2.7_' config.status
    sed -i 's:$(sysconfdir):/usr/share:g' config.status

    make

    # Python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' $file
    done

    sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' ./src/${pkgname}
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
