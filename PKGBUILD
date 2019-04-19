# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
pkgname="cameramonitor-quiet"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="A little monitor to check if your Webcam is On. Fork of cameramonitor"
url="https://github.com/YanDoroshenko/cameramonitor"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('pygtk' 'python2' 'python2-dbus' 'python2-gconf' 'python2-notify' 'python2-pyinotify')
provides=("${pkgname}")
source=("https://github.com/YanDoroshenko/cameramonitor/raw/master/cameramonitor-quiet-${pkgver}-${pkgrel}.tar.bz2")
sha256sums=('5a672b2c955db7f001e06d35770e8a73a69efdbf3f44dcda55f9d83b92e55f26')

build() {
    cd "cameramonitor-${pkgver}"

    ./configure --prefix /usr

    sed -i 's/python3.7/python2.7/g' config.status
    sed -i 's/"3.7"/"2.7"/g' config.status
    sed -i 's_bin/python_bin/python2.7_' config.status
    sed -i 's:$(sysconfdir):/usr/share:g' config.status

    make

    # Python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' $file
    done

    sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' ./src/cameramonitor
}

package() {
    cd "cameramonitor-${pkgver}"
    make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=4 ft=sh et:
