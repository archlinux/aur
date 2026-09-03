# Maintainer: taotieren <admin@taotieren.com>

pkgname=kotonoha
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland lyrics overlay for MPRIS-compatible media players"
provides=(${pkgname})
conflicts=(${pkgname})
arch=($CARCH)
url="https://github.com/locez/kotonoha"
_pydeps=(
    aiohttp
    dbus-fast
    mutagen
    pyqt6
    qasync
)
depends=(
    hicolor-icon-theme
    libgcc
    libstdc++
    qt6-base
    layer-shell-qt
    wayland
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    cmake
    git
    ninja
    qt6-svg
    qt6-wayland
    pkgconf
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-scikit-build-core'
    'python-wheel'
)
optdepends=()
license=('LGPL-2.1-or-later' 'MIT AND ISC')
source=("${pkgname}::git+${url}.git#tag=v$pkgver")
sha256sums=('0f948acf4e576e5366765b7c8ca6a9b8a46914100f1fc9bdd49cf93cdb2891f9')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation \
        --config-setting=cmake.define.KOTONOHA_INSTALL_LICENSE=OFF
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 packaging/kotonoha.desktop -t "$pkgdir/usr/share/applications/kotonoha.desktop"
    install -vDm644 src/kotonoha/assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kotonoha.svg"
    install -vDm644 packaging/dev.locez.kotonoha.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
    install -vDm644 packaging/kotonoha.1 -t "$pkgdir/usr/share/man/man1/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp -rv LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"
}
