# Maintainer: Fedor Suchkov <f.suchkov@gmail.com>

_pkgname=FanFicFare
pkgname=fanficfare-git
pkgver=4.29.0.r0.gce24ac70
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
_deps=(
    'beautifulsoup4'
    'chardet'
    'html5lib'
    'html2text'
    'cloudscraper'
    'urllib3'
    'requests'
    'requests-file'
    'brotli'
)
depends=("${_deps[@]/#/python-}")
makedepends=('git' 'python-setuptools')
optdepends=('calibre: use FanFicFare as a calibre plugin'
            'python-pillow: support for converting/resizing story images and covers')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git"
        "0001-makeplugin-do-not-bundle-system-dependencies.patch")
sha256sums=('SKIP'
            '6d172dcc98a8f6dcef2048272bfabd810ceeb5740969fbe406ebcd7b638e072c')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    patch -p1 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
}

build() {
    cd "${srcdir}/${_pkgname}"

    python -m build --wheel --no-isolation

    for i in calibre-plugin/translations/*.po; do
        msgfmt -vv "$i" -o "${i%.po}.mo"
    done
    python makeplugin.py
}

package() {
    cd "${srcdir}/${_pkgname}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 FanFicFare.zip "${pkgdir}"/usr/share/calibre/system-plugins/FanFicFare.zip
}
