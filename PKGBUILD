# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="cameramonitor"
pkgver="0.3.2"
pkgrel="3"
pkgdesc="A little monitor to check if your Webcam is On."
url="http://www.infinicode.org/code/cameramonitor/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('pygtk' 'python2' 'python2-dbus' 'python2-gconf' 'python2-gnomedesktop' 'python2-notify' 'python2-pyinotify')
provides=("${pkgname}")
install="${pkgname}.install"
source=("https://launchpad.net/cameramonitor/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('4f4a9189298e33ca442b04568bf1f359')

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure --prefix /usr

    sed -i 's/python3.4/python2.7/g' config.status
    sed -i 's/"3.4"/"2.7"/g' config.status
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
