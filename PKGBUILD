# Maintainer: Hosaka Studio <hello@hosaka.studio>
pkgname=hosaka-studio
# pkgver is managed by CI (build-arch.yml reads it from hosaka/pyproject.toml)
pkgver=0
pkgrel=1
pkgdesc='Turn screen captures into professional videos'
arch=('x86_64')
url='https://github.com/byzantime/deskcam.studio'
license=('LicenseRef-Proprietary')
depends=(
    'python>=3.11'
    'pyside6'
    'python-numpy'
    'python-pyav'
    'python-xlib'
    'python-dbus-fast'
    'python-evdev'
    'python-pywayland'
    'python-lz4'
    'python-boto3'
    'ffmpeg'
    'libpulse'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-setuptools'
)
install=hosaka-studio.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/deskcam.studio-${pkgver}/hosaka"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/deskcam.studio-${pkgver}/hosaka"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Desktop entry
    install -Dm644 "${srcdir}/deskcam.studio-${pkgver}/hosaka/packaging/studio.hosaka.desktop" \
        "${pkgdir}/usr/share/applications/studio.hosaka.desktop"

    # AppStream metadata
    install -Dm644 "${srcdir}/deskcam.studio-${pkgver}/hosaka/packaging/studio.hosaka.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/studio.hosaka.metainfo.xml"

    # Application icon
    install -Dm644 "${srcdir}/deskcam.studio-${pkgver}/hosaka/src/hosaka/assets/app-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hosaka.png"

    # Udev rules for input device access (click tracking)
    install -Dm644 "${srcdir}/deskcam.studio-${pkgver}/hosaka/packaging/71-hosaka-input.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/71-hosaka-input.rules"
}
