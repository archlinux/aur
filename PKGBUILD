# Maintainer: Younes Khoudli <khoyobegenn@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=4.62.0
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
sha256sums=('4cdf9f65293d979b434d8b4359f2d10f986f0e1f25a033b1fe61e1bb010fe555'
            'e694544ba755c1605e978e8c61d5a48996d4487421392c8c2c5a975b02473c14')
b2sums=('d10a574132cb64c1bf530688d3e739e9488f6fdcee2b8bdf3280b1376f749eacb96ff32da5e1981469c109fcfd0fdd92564afb675ae3d914ffa77ae8d74d1f41'
        '312c6a031d9fd100f9e28d2b771ae6e760e5511f9ea39954227a8dde4a8bec5f51ef5f743d133e1a76cc67171ab474fdc55c5497bc34c11eb59d5126903cba0d')

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
