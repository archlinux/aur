# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=obsbot-camera-control
pkgver=1.4.0
pkgrel=1
pkgdesc="Native Linux control app for OBSBOT cameras with PTZ, auto-framing, presets, and live preview"
arch=('x86_64')
url="https://github.com/aaronsb/${pkgname}"
# MIT for this project's code; the rest for OBSBOT's libdev.so and the
# components found inside it (see THIRD_PARTY_NOTICES).
license=('MIT' 'LGPL-2.1-or-later' 'BSL-1.0' 'LicenseRef-OBSBOT-SDK')
groups=('video')
# Underscore-prefixed because keywords is not a PKGBUILD variable; namcap
# reports any bare name it does not know as a non-standard one.
_keywords=('obsbot' 'camera' 'webcam' 'ptz' 'streaming' 'conference' 'video' 'uvc')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'glibc'
    'gcc-libs'
    # package() installs camera.svg into
    # /usr/share/icons/hicolor/scalable/apps, and that hierarchy is owned by
    # hicolor-icon-theme. It happened to be pulled in transitively, which is
    # not the same as being declared.
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'git'
    # For stripping RUNPATH out of the binaries and the vendored SDK library.
    'patchelf'
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
    install -Dm755 sdk/lib/libdev.so.1.0.0 "${pkgdir}/usr/lib/libdev.so.1.0.0"
    ln -s libdev.so.1.0.0 "${pkgdir}/usr/lib/libdev.so.1"
    ln -s libdev.so.1.0.0 "${pkgdir}/usr/lib/libdev.so"

    # Both binaries link with a RUNPATH pointing at the build tree, and the
    # vendored libdev.so carries one pointing at an OBSBOT developer's machine
    # (/home/qy/workspace/...). Neither path exists on an installed system, and
    # a RUNPATH naming a directory that does not exist is one someone else can
    # create: the loader would search it before /usr/lib.
    #
    # Nothing is lost by removing them. libdev.so.1.0.0 is installed to
    # /usr/lib, which the loader searches by default, so the RUNPATH was never
    # what made this work on a user's machine.
    patchelf --remove-rpath "${pkgdir}/usr/bin/obsbot-gui"
    patchelf --remove-rpath "${pkgdir}/usr/bin/obsbot-cli"
    patchelf --remove-rpath "${pkgdir}/usr/lib/libdev.so.1.0.0"

    # Install desktop file
    install -Dm644 obsbot-control.desktop \
        "${pkgdir}/usr/share/applications/obsbot-control.desktop"

    # Install icon
    install -Dm644 resources/icons/camera.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/obsbot-control.svg"

    # Install license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICES \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"

    # Install documentation
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install virtual camera bootstrap assets
    install -Dm644 resources/modprobe.d/obsbot-virtual-camera.conf \
        "${pkgdir}/usr/lib/modprobe.d/obsbot-virtual-camera.conf"
    install -Dm644 resources/systemd/obsbot-virtual-camera.service \
        "${pkgdir}/usr/lib/systemd/system/obsbot-virtual-camera.service"
}
