# Maintainer: Younes Khoudli <khoyobegenn@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=4.27.0
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "0001-makeplugin-do-not-bundle-system-dependencies.patch")
sha256sums=('c4609f7511c7dd534b5ad171ae63c7aa35c9d8b04cec7e706f8de140ea07246d'
            '6d172dcc98a8f6dcef2048272bfabd810ceeb5740969fbe406ebcd7b638e072c')
b2sums=('bc5faf071a8b4f6a1bc482ffa09f78b16f18cf887dc69fcfb67d00fc12d323072d90f42ad759dd0fa0b6f4ba4e4bb9afd03a7011bea0912f3d5b056cf1887ec8'
        'eca0e505305ef74e0af1be6f5c1376091da4cd69bfc9f468f6040cf35d71890e3901b9cf0a9f9e25e6cb409651d402d8414116d0a8d43269bfdab2fdd0005279')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch -p1 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build

    for i in calibre-plugin/translations/*.po; do
        msgfmt -vv "$i" -o "${i%.po}.mo"
    done
    python makeplugin.py
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 FanFicFare.zip "${pkgdir}"/usr/share/calibre/system-plugins/FanFicFare.zip
}
