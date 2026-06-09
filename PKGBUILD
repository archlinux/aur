# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
#              Ivan Feign (Aiyahhh) <ivan.feign@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.4.1
pkgrel=2
pkgdesc="An open-source replacement for SteelSeries GG, to manage your Arctis headset on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=('python>=3.10' 'python-pulsectl' 'python-pyudev' 'python-dbus-next' 'pyside6' 'python-pyusb' 'python-ruamel-yaml')
makedepends=('uv' 'python-installer')
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "no-enforce-systemd.patch"
        "arctis-manager.service")
install="linux-arctis-manager.install"
sha256sums=('6210dffa7581d818a944716fe267fb90a50422c3eeb11fc7df97d78ea98e1749'
            '2197db5ed8a099b09393bee688410fe39dd108fa9abd3f07c18cd75f9b47eff6'
            '025ae7546d8ffa8f4e2959208dca1254030e1c106a5d955d74b7b49b5cf98767')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../no-enforce-systemd.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    uv build --wheel --no-sources
}

package() {
    cd "${_pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Get Python version
    local _py_ver
    _py_ver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    # Generating and installing udev rules
    install -d "$pkgdir/usr/lib/udev/rules.d/"
    PYTHONPATH="$pkgdir/usr/lib/python$_py_ver/site-packages" \
        "$pkgdir/usr/bin/lam-cli" udev write-rules --rules-path "$pkgdir/usr/lib/udev/rules.d/91-steelseries-arctis.rules"

    # Installing assets
    install -Dm644 src/linux_arctis_manager/gui/images/steelseries_logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/arctis-manager.svg"

    # Installing desktop entries
    install -Dm644 src/linux_arctis_manager/desktop/ArctisManager.desktop "$pkgdir/usr/share/applications/ArctisManager.desktop"
    install -Dm644 src/linux_arctis_manager/desktop/ArctisManagerSystray.desktop "$pkgdir/usr/share/applications/ArctisManagerSystray.desktop"

    # Adding systemd service
    install -Dm644 "${srcdir}/arctis-manager.service" "$pkgdir/usr/lib/systemd/user/arctis-manager.service"
}
