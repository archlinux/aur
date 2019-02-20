# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>
# Based on the PKGBUILD from eloaders <eloaders at linux dot pl>

pkgname=i-nex
pkgver=7.6.0
pkgrel=4
pkgdesc="System information tool like hardinfo, sysinfo"
arch=('i686' 'x86_64')
url="http://i-nex.linux.pl/"
license=('LGPL3')
depends=('gambas3-runtime'
         'gambas3-gb-image'
         'gambas3-gb-form'
         'gambas3-gb-desktop'
         'gambas3-gb-qt5'
         'gambas3-gb-desktop-x11'
         'python2'
         'libcpuid'
         'lsb-release'
         'curl'
         'pastebinit'
         'procps-ng')
makedepends=('gambas3-devel' 'gcc' 'imagemagick')
source=("https://github.com/i-nex/I-Nex/archive/${pkgver}.tar.gz")
sha256sums=('ad18bb753daa2d17432a0211aef7b19bc1416d5deea4a14a751802a3da998ea8')
conflicts=('i-nex-git')
backup=('etc/i-nex/Database/i2c/devices.json'
        'etc/i-nex/Database/A6.json'
        'etc/i-nex/Database/amd.json'
        'etc/i-nex/Database/atom.json'
        'etc/i-nex/Database/i3.json'
        'etc/i-nex/Database/i5.json'
        'etc/i-nex/Database/i7.json'
        'etc/i-nex/Database/intel_Core_2_Duo.json'
        'etc/i-nex/Database/intel.json'
        'etc/i-nex/Database/Opteron.json'
        'etc/i-nex/Database/Xeon.json')

prepare() {
    cd "${srcdir}/I-Nex-${pkgver}"
    sed -i 's|python3$|python2|' pastebinit
    sed -i -e 's|^STATIC.*|STATIC = false|' i-nex.mk
    sed -i -e 's|^UDEV_RULES_DIR.*|UDEV_RULES_DIR = /usr/lib/udev/rules.d|' i-nex.mk
    cd "I-Nex"
    autoreconf -i
}

build() {
    cd "${srcdir}/I-Nex-${pkgver}"
    cd "I-Nex"
    ./configure --prefix=/usr
    cd ..
    make -j1
}

package() {
    cd "${srcdir}/I-Nex-${pkgver}"
    make -j1 DESTDIR="${pkgdir}/" install
}
