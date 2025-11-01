# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=obsbot-camera-control
pkgver=1.1.0
pkgrel=1
pkgdesc="Native Linux control app for OBSBOT cameras with PTZ, auto-framing, presets, and live preview"
arch=('x86_64')
url="https://github.com/aaronsb/${pkgname}"
license=('MIT')
groups=('video')
keywords=('obsbot' 'camera' 'webcam' 'ptz' 'streaming' 'conference' 'video' 'uvc')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'glibc'
    'gcc-libs'
)
makedepends=(
    'cmake'
    'git'
)
optdepends=(
    'v4l2loopback-dkms: Kernel module for optional virtual camera output'
    'lsof: Detect when camera is in use by other applications'
)
provides=('obsbot-control')
source=("git+https://github.com/aaronsb/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=obsbot-camera-control.install

build() {
    cd "${srcdir}/${pkgname}"

    # Create build directory
    mkdir -p build
    cd build

    # Configure with CMake
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    # Build
    make -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install binaries (built in bin/ directory)
    install -Dm755 bin/obsbot-gui "${pkgdir}/usr/bin/obsbot-gui"
    install -Dm755 bin/obsbot-cli "${pkgdir}/usr/bin/obsbot-cli"

    # Install SDK library
    install -Dm755 sdk/lib/libdev.so.1.0.2 "${pkgdir}/usr/lib/libdev.so.1.0.2"
    ln -s libdev.so.1.0.2 "${pkgdir}/usr/lib/libdev.so.1"
    ln -s libdev.so.1.0.2 "${pkgdir}/usr/lib/libdev.so"

    # Install desktop file
    install -Dm644 obsbot-control.desktop \
        "${pkgdir}/usr/share/applications/obsbot-control.desktop"

    # Install icon
    install -Dm644 resources/icons/camera.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/obsbot-control.svg"

    # Install license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install documentation
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install virtual camera bootstrap assets
    install -Dm644 resources/modprobe.d/obsbot-virtual-camera.conf \
        "${pkgdir}/usr/lib/modprobe.d/obsbot-virtual-camera.conf"
    install -Dm644 resources/systemd/obsbot-virtual-camera.service \
        "${pkgdir}/usr/lib/systemd/system/obsbot-virtual-camera.service"
}
