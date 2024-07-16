# Maintainer: Younes Khoudli <khoyobegenn@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=4.36.0
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
changelog=changelog.txt
_deps=('beautifulsoup4' 'brotli' 'chardet' 'cloudscraper' 'html5lib' 'html2text'
       'requests-file')
depends=("${_deps[@]/#/python-}")
optdepends=('calibre: use FanFicFare as a calibre plugin'
            'python-pillow: support for converting/resizing story images and covers')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "0001-makeplugin-do-not-bundle-system-dependencies.patch")
sha256sums=('6c0451b776e9a61e66abc3ef9758d76b8c6335bc6672df81a0b09afca15e1cc9'
            '6d172dcc98a8f6dcef2048272bfabd810ceeb5740969fbe406ebcd7b638e072c')
b2sums=('f422edee23fa16e5b919322f45a725e1dbe33e8cd16b0f44415facd9ca3c6d8a377df5ab1e07f549d5a4381eeeff4a72d5d4285c9736cf387506c3b24feedf97'
        'eca0e505305ef74e0af1be6f5c1376091da4cd69bfc9f468f6040cf35d71890e3901b9cf0a9f9e25e6cb409651d402d8414116d0a8d43269bfdab2fdd0005279')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch -p1 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m build --wheel --no-isolation

    for i in calibre-plugin/translations/*.po; do
        msgfmt -vv "$i" -o "${i%.po}.mo"
    done
    python makeplugin.py
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 FanFicFare.zip "${pkgdir}"/usr/share/calibre/system-plugins/FanFicFare.zip
}
