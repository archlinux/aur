# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
#              Ivan Feign (Aiyahhh) <ivan.feign@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.3.1
pkgrel=7
pkgdesc="An open-source replacement for SteelSeries GG, to manage your Arctis headset on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=('python>=3.10' 'python-pulsectl' 'python-pyudev' 'python-dbus-next' 'pyside6' 'python-pyusb' 'python-ruamel-yaml')
makedepends=('uv' 'python-installer')
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "arctis-manager.service")
install="linux-arctis-manager.install"
sha256sums=('7652bf90b2e46963f29593f15b6738a4471d0d95081dc2d6ae051b0c0780ee09'
            '025ae7546d8ffa8f4e2959208dca1254030e1c106a5d955d74b7b49b5cf98767')

build() {
    cd "${_pkgname}-${pkgver}" || return
    uv build --wheel --no-sources
}

package() {
    cd "${_pkgname}-${pkgver}" || return

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
