# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgrealname=webcamoid
pkgname=webcamoid-git
pkgver=9.4.0.r0.gb6e2c6505
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
depends=('qt6-declarative'
         'qt6-svg')
optdepends=('v4l-utils: Extra formats support for webcams'
            'akvcam-dkms-git: Virtual camera support (Recommended)'
            'v4l2loopback-dkms: Virtual camera support'
            'ffmpeg: Video playback/recording/conversion (Recommended)'
            'pipewire: Screen capture'
            'libpulse: Audio playback (Recommended)'
            'alsa-lib: Audio playback'
            'portaudio: Audio playback'
            'libuvc: Camera capture'
            'qt6-multimedia: Camera capture'
            'polkit: Root privileges for virtual camera module')
makedepends=('alsa-lib'
             'cmake'
             'ffmpeg'
             'git'
             'libpulse'
             'libuvc'
             'pipewire'
             'portaudio'
             'qt6-multimedia'
             'qt6-tools'
             'v4l-utils')
provides=('webcamoid')
conflicts=('webcamoid')
install="${pkgrealname}.install"
source=("git+https://github.com/${pkgrealname}/${pkgrealname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgrealname}"
    (
        set -o pipefail
        git describe --long --tags --match '[0-9.]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${pkgrealname}"

    if [ "${WEBCAMOID_ENABLE_EXTRA_PLUGINS}" = 1 ]; then
        echo "Building Webcamoid with extra plugins."
        echo "Cloning submodules (this may take a while)..."

        git submodule init
        git submodule update --recursive --depth=1

        echo "Submodules cloned successfully."
    else
        echo "Building Webcamoid without the extra plugins, extra plugins are"
        echo "available to sponsors only, You can become a sponsor at:"
        echo
        echo "https://github.com/sponsors/hipersayanX"
        echo
        echo "To enable them, build with:"
        echo
        echo "WEBCAMOID_ENABLE_EXTRA_PLUGINS=1 makepkg -si"
    fi
}

build() {
    cd "${srcdir}/${pkgrealname}"

    cmake \
        -S . \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDAILY_BUILD=ON
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/${pkgrealname}"

    make -C build DESTDIR="${pkgdir}" install
}
