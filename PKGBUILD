# Maintainer: Locez <locez@locez.com>
pkgname=kotonoha-git
_pkgname=kotonoha
pkgver=0.3.0.r254.g5a98630
pkgrel=1
pkgdesc="Wayland lyrics overlay for MPRIS-compatible media players"
arch=('x86_64')
url="https://github.com/locez/kotonoha"
license=('ISC' 'LGPL2.1' 'MIT')
depends=(
    'python>=3.11'
    'python-aiohttp'
    'python-dbus-fast'
    'python-pyqt6'
    'python-qasync'
    'qt6-base'
    'qt6-svg'
    'qt6-wayland'
    'layer-shell-qt'
    'wayland'
    # Package-manager hooks compile against the installed Qt private ABI.
    'cmake'
    'gcc'
    'make'
    'pkgconf'
)
optdepends=(
    'python-mutagen: read lyrics embedded in local audio tags'
)
makedepends=(
    'git'
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
install=kotonoha-git.install
source=("git+$url.git" 'kotonoha-rebuild-bridge.hook')
sha256sums=('SKIP' '53face40fd076228586bf94d8d038fc55ca8fddb591641d791637af83d1f2a26')

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
        --config-setting=cmake.define.KOTONOHA_BUILD_BRIDGE=OFF \
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

    # The post-transaction hook owns the generated binary; pacman owns the link.
    local _site_packages
    _site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
    ln -s /var/lib/kotonoha/libkoto-layer.so \
        "$pkgdir$_site_packages/kotonoha/libkoto-layer.so"
    install -Dm755 scripts/rebuild_bridge.py \
        "$pkgdir/usr/lib/kotonoha/rebuild-bridge"
    install -Dm644 CMakeLists.txt \
        "$pkgdir/usr/share/kotonoha/native/CMakeLists.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/kotonoha/native/LICENSE"
    install -Dm644 src/kotonoha/layer_shell_bridge.cpp \
        "$pkgdir/usr/share/kotonoha/native/src/kotonoha/layer_shell_bridge.cpp"
    install -Dm644 src/kotonoha/protocols/*.xml \
        -t "$pkgdir/usr/share/kotonoha/native/src/kotonoha/protocols"
    install -Dm644 "$srcdir/kotonoha-rebuild-bridge.hook" \
        "$pkgdir/usr/share/libalpm/hooks/kotonoha-rebuild-bridge.hook"

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
