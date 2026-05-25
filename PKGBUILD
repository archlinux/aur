# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
#              Ivan Feign (Aiyahhh) <ivan.feign@gmail.com>

pkgname=linux-arctis-manager-git
_pkgname=Linux-Arctis-Manager
pkgver=r1.e838443
pkgrel=2
pkgdesc="An open-source replacement for SteelSeries GG, to manage your Arctis headset on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=('python>=3.10' 'python-pulsectl' 'python-pyudev' 'python-dbus-next' 'pyside6' 'python-pyusb' 'python-ruamel-yaml')
conflicts=('linux-arctis-manager')
provides=("linux-arctis-manager=${pkgver}")
makedepends=('uv' 'python-installer' 'git')
source=("git+https://github.com/elegos/$_pkgname"
        "arctis-manager.service")
install="linux-arctis-manager-git.install"
sha256sums=('SKIP'
            '025ae7546d8ffa8f4e2959208dca1254030e1c106a5d955d74b7b49b5cf98767')

pkgver() {
    cd "${_pkgname}" || return
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}" || return
    uv build --wheel --no-sources
}

package() {
    cd "${_pkgname}" || return

    # Get Python version dynamically to prevent hardcoding breakage
    local _py_ver
    _py_ver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    python -m installer --destdir="$pkgdir" dist/*.whl

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
