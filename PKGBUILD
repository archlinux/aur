# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgrealname=webcamoid
pkgname=webcamoid-git
pkgver=7.0.0.r63.g2c21c22
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('qt5-quickcontrols' 'qt5-svg' 'libpulse' 'v4l-utils' 'ffmpeg')
# Enable this lines if you want to use GStreamer instead of FFmpeg.
# WARNING: GStreamer support is experimental.
#depends=('qt5-quickcontrols' 'qt5-svg' 'libpulse' 'v4l-utils' 'gst-plugins-base-libs')
optdepends=('v4l2loopback-dkms: Virtual camera support')
#optdepends=('v4l2loopback-dkms: Virtual camera support'
#            'gst-plugins-base'
#            'gst-plugins-good'
#            'gst-plugins-bad'
#            'gst-plugins-ugly')
makedepends=('git' 'qt5-tools')
provides=('webcamoid')
source=("git://github.com/${pkgrealname}/${pkgrealname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgrealname}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgrealname}"
    qmake-qt5 Webcamoid.pro #USE_GSTREAMER=1
    make
}

package() {
    cd "$srcdir/${pkgrealname}"
    make INSTALL_ROOT="${pkgdir}" install
}
