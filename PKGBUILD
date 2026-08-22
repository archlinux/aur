# Maintainer: Younes Khoudli <khoyobegenn@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=4.60.0
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
sha256sums=('8ed58136996751c9b1afb48a84e1d063b3d54fc2040f5d685a867e607c140d45'
            'c72d1490c3150036d5f9f421583d6a07dcbbf335459906a61c689c6a0ce3a7f4')
b2sums=('23738b33e0a06385b248f7c28f37024734c575eb4f76043a72ca6c710959a7beb0ab6d94f0255537cff0bcebc95bc2bf9a73270a4fe5c40ddac1c66f2a6847ef'
        '86e456d47bd7aeb2297cddc039860c45db04ff48e3da421255bdf2debc39b39228320b7a16dafcb1900514d8b9c43d4e527bff6b8f1ba3c9efaf82629af7747d')

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
