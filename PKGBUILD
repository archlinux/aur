# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgrealname=webcamoid
pkgname=webcamoid-git
pkgver=9.1.1.r165.g2a3694a77
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
depends=('qt6-quickcontrols2'
         'qt6-svg')
optdepends=('v4l-utils: Extra formats support for webcams'
            'akvcam-dkms-git: Virtual camera support (Recommended)'
            'v4l2loopback-dkms: Virtual camera support'
            'ffmpeg: Video playback/recording/conversion (Recommended)'
            'gst-plugins-base: Video playback/recording/conversion'
            'gst-plugins-good: Video playback/recording/conversion'
            'gst-plugins-bad: Video playback/recording/conversion'
            'gst-plugins-ugly: Video playback/recording/conversion'
            'vlc: Video playback (Recommended)'
            'pipewire: Screen capture'
            'libpulse: Audio playback (Recommended)'
            'alsa-lib: Audio playback'
            'jack: Audio playback'
            'portaudio: Audio playback'
            'sdl2: Audio playback'
            'libuvc: Camera capture'
            'qt6-multimedia: Camera capture'
            'polkit: Root privileges for virtual camera module')
makedepends=('alsa-lib'
             'cmake'
             'ffmpeg4.4'
             'git'
             'gst-plugins-base-libs'
             'jack'
             'libpulse'
             'libuvc'
             'pipewire'
             'portaudio'
             'qt6-multimedia'
             'qt6-tools'
             'sdl2'
             'v4l-utils'
             'vlc')
provides=('webcamoid')
conflicts=('webcamoid')
install="${pkgrealname}.install"
source=("git+https://github.com/${pkgrealname}/${pkgrealname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgrealname}"
    (
        set -o pipefail
        git describe --long --tags --match '[0-9.]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgrealname}"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDAILY_BUILD=1 \
        .
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/${pkgrealname}"
    make DESTDIR="${pkgdir}" install
}
