# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=tidal-dl-ng
_pkgname=${pkgname//-/_}
pkgver=0.25.6
pkgrel=5
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
    'python-darkdetect'
    'pyqtdarktheme'
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
    "tidal-dl-ng.desktop"
)
sha256sums=('4c759f531411f3fa5c9a95805e74cc7da6b10a39dd87a13b9db82c283f028570'
            '1d2f9b06b7bba762f9a8770b163e001e5044a38b9d5befa8ea44fa3c98bcf172'
            'ecdc2868d0df9fa41e3bca50f3f0bcfede7543b54700f45b2095b9662da6dd9c'
            'd31967428982ea704f7111959faa821772ddcc5290f06350b4209615d08c27d0')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -rf dist
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

    # Install desktop file and icon
    install -Dm755 "${srcdir}/tidal-dl-ng.desktop" "${pkgdir}/usr/share/applications/tidal-dl-ng.desktop"
    install -Dm644 "${pkgdir}/usr/lib/python3.13/site-packages/tidal_dl_ng/ui/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-dl-ng.png"
}
