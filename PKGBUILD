# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=icamerasrc-git
_pkgname=icamerasrc
pkgver=r57.2d36ade
pkgrel=1
pkgdesc="Intel IPU6 camera source for GStreamer"
arch=('x86_64')
url="https://github.com/intel/icamerasrc"
license=('LGPL2.1')
depends=('ipu6-camera-hal'
         'gstreamer'
         'libdrm'
         'gst-plugins-base')
makedepends=('git'
             'autoconf'
             'make'
             'gcc')
source=("git+${url}.git#branch=icamerasrc_slim_api"
        "70-ipu6-psys.rules")
sha256sums=('SKIP'
            '41f0406f4548f12dd3ec5c4c94c5f6f4590d48ac4c80623682f3d22622a8a9bd')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    export CHROME_SLIM_CAMHAL=ON
    export STRIP_VIRTUAL_CHANNEL_CAMHAL=ON
    ./autogen.sh
    make
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p $pkgdir/usr/lib/udev/rules.d
    make DESTDIR="$pkgdir" install
    install -Dm644 $srcdir/70-ipu6-psys.rules $pkgdir/usr/lib/udev/rules.d
}
