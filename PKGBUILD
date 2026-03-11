# Maintainer: SwitchBros <switchbros@proton.me>
pkgname=steam-library-manager
_app_id=io.github.switch_bros.SteamLibraryManager
pkgver=1.2.4
pkgrel=1
pkgdesc="A powerful Steam library organizer for Linux - the modern Depressurizer alternative"
arch=('any')
url="https://github.com/Switch-Bros/SteamLibraryManager"
license=('MIT')
depends=(
    'hicolor-icon-theme'
    'python>=3.10'
    'python-pyqt6'
    'python-psutil'
    'python-pillow'
    'python-vdf'
    'python-yaml'
    'python-beautifulsoup4'
    'python-lxml'
    'python-requests'
    'python-requests-oauthlib'
    'python-qrcode'
    'python-steam'
    'python-protobuf'
    'python-pywebview'
    'python-packaging'
    'qt6-base'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-qt'
)
optdepends=(
    'python-keyring: secure token storage via system keyring'
    'python-steamgriddb: artwork browsing via SteamGridDB'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('26ef24ce0d78c3b626520eecb0fefa74738862e8e273df46a5d13cbdbc6e13d6')

build() {
    cd "SteamLibraryManager-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "SteamLibraryManager-$pkgver"
    pytest
}

package() {
    cd "SteamLibraryManager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 flatpak/${_app_id}.desktop \
        "$pkgdir/usr/share/applications/${_app_id}.desktop"

    # Icons (must match Icon= in desktop file)
    install -Dm644 steam_library_manager/resources/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
    install -Dm644 steam_library_manager/resources/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"

    # Metainfo (for GNOME Software / KDE Discover)
    install -Dm644 steam_library_manager/resources/${_app_id}.metainfo.xml \
        "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
