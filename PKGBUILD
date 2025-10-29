# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=obsbot-camera-control
pkgver=1.0.0
pkgrel=2
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
    'v4l2loopback-dkms: Virtual camera support for OBS/streaming'
    'lsof: Detect when camera is in use by other applications'
)
provides=('obsbot-control')
source=("git+https://github.com/aaronsb/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
    cd "${srcdir}/${pkgname}/build"

    # Install binaries
    install -Dm755 obsbot-gui "${pkgdir}/usr/bin/obsbot-gui"
    install -Dm755 obsbot-cli "${pkgdir}/usr/bin/obsbot-cli"

    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}/obsbot-control.desktop" \
        "${pkgdir}/usr/share/applications/obsbot-control.desktop"

    # Install icon
    install -Dm644 "${srcdir}/${pkgname}/resources/icons/camera.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/obsbot-control.svg"

    # Install license
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install documentation
    install -Dm644 "${srcdir}/${pkgname}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
