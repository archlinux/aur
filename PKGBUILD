# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=shinysdr-git
pkgver=r1040.57890d3
pkgrel=1
pkgdesc="SDR receiver built on GNU Radio with a web-based UI and plugins"
arch=('i686' 'x86_64')
url="https://github.com/kpreid/shinysdr"
license=('GPL3')
depends=('gnuradio-osmosdr' 'python2-twisted' 'python2-pyephem' 'python2-txws')
makedepends=('git')
optdepends=('gr-air-modes-git: for receiving ADS-B, aircraft transponders'
            'multimon-ng-git: for receiving APRS'
            'gr-dsd-git: for receiving digital voice modes supported by DSD')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kpreid/shinysdr.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    # Remove 'ephem' dependency from setup.py because python2-pyephem package
    # somehow doesn't provide it (even if ephem module is clearly installed)
    sed -i "/^[[:blank:]]*'ephem'/d" setup.py
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./fetch-js-deps.sh
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root=$pkgdir
}
