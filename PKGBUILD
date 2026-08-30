# Maintainer: Locez <locez@locez.com>
pkgname=kotonoha-git
_pkgname=kotonoha
pkgver=0.1.0.r140.gbde674e
pkgrel=1
pkgdesc="Wayland lyrics overlay for MPRIS-compatible media players"
arch=('x86_64')
url="https://github.com/locez/kotonoha"
license=('ISC' 'LGPL2.1' 'MIT')
depends=(
    'python>=3.10'
    'python-aiohttp'
    'python-dbus-fast'
    'python-pyqt6'
    'python-qasync'
    'qt6-base'
    'qt6-svg'
    'qt6-wayland'
    'layer-shell-qt'
    'wayland'
)
optdepends=(
    'python-mutagen: read lyrics embedded in local audio tags'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'pkgconf'
    'python-build'
    'python-installer'
    'python-scikit-build-core'
)
checkdepends=(
    'python-pytest'
    'python-pytest-asyncio'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local _version
    _version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' pyproject.toml | head -n1)
    if [[ -z $_version ]]; then
        error "Unable to read the project version from pyproject.toml"
        return 1
    fi
    printf '%s.r%s.g%s\n' \
        "$_version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation \
        --config-setting=cmake.define.KOTONOHA_INSTALL_LICENSE=OFF
}

check() {
    cd "$_pkgname"
    # Qt consults LANGUAGE when resolving QLocale, even when LC_ALL is set.
    LC_ALL=C.UTF-8 LANG=C.UTF-8 LANGUAGE=en PYTHONPATH=src pytest
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/kotonoha.desktop \
        "$pkgdir/usr/share/applications/kotonoha.desktop"
    install -Dm644 src/kotonoha/assets/icon.png \
        "$pkgdir/usr/share/pixmaps/kotonoha.png"
    install -Dm644 packaging/dev.locez.kotonoha.metainfo.xml \
        "$pkgdir/usr/share/metainfo/dev.locez.kotonoha.metainfo.xml"
    install -Dm644 packaging/kotonoha.1 \
        "$pkgdir/usr/share/man/man1/kotonoha.1"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
