# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=tidal-dl-ng
_pkgname=${pkgname//-/_}
pkgver=0.24.4
pkgrel=3
pkgdesc='A tool for downloading music and albums from TIDAL'
arch=(any)
url='https://pypi.org/project/tidal-dl-ng/'
license=(AGPL-3.0-only)
depends=(
    'python>=3.13'
    'python-requests'
    'python-mutagen'
    'python-pycryptodome'
    'python-tidalapi'
    'python-dataclasses-json'
    'python-pathvalidate'
    'python-m3u8'
    'python-coloredlogs'
    'python-rich'
    'python-toml'
    'python-typer'
    'python-python-ffmpeg'
    'pyside6'
    'python-pyqtdarktheme'
    'python-darkdetect'
)
makedepends=(
    'python-poetry-core'
    'python-installer'
    'python-build'
)
source=(
    "https://files.pythonhosted.org/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "tidal-dl-ng"
    "tidal-dl-ng-gui"
    "python313.patch"
)
sha256sums=('c0ea3a8c3d9b7a7c5b8db46ecc20712a24517486b346dac36141ec248b109ad0'
            '1d2f9b06b7bba762f9a8770b163e001e5044a38b9d5befa8ea44fa3c98bcf172'
            'ecdc2868d0df9fa41e3bca50f3f0bcfede7543b54700f45b2095b9662da6dd9c'
            '64ff19bdd6b7ae294ca79b67f92fa8bf843e9c1941c29911d94dafda30e4a12d')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -rf dist
    cat ../python313.patch | patch -p1
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install scripts
    install -Dm755 "${srcdir}/tidal-dl-ng" "${pkgdir}/usr/bin/tidal-dl-ng"
    install -Dm755 "${srcdir}/tidal-dl-ng-gui" "${pkgdir}/usr/bin/tidal-dl-ng-gui"
}
