# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# former Co-maintainer: Jan Korte <j.korte@me.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=retext-git
_pkgname=ReText
_appname="me.mitya57.${_pkgname}"
pkgver=8.1.0.r2.g1997ef4
_pyver=3.13
pkgrel=1
pkgdesc="A simple editor for Markdown and ReStructuredText markup languages."
arch=('any')
url="https://github.com/retext-project/retext"
license=('GPL-2.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'python'
    'python-chardet'
    'python-docutils'
    'python-markdown'
    'python-markups>=2.0.0'
    'python-pygments'
    'python-pyqt6'
    'xdg-utils'
    'python-gobject'
    'gtk4'
  )
makedepends=(
    'git'
    'imagemagick'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'qt6-tools'
)
optdepends=(
    'python-pyqt6-webengine: for WebEngine preview'
    'python-pyenchant: for spell checking support'
)
source=("${pkgname//-/.}::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build () {
    cd "${srcdir}/${pkgname//-/.}"
    python -m build --wheel --no-isolation
    python -m installer --destdir="${srcdir}" dist/*.whl
    sed -i "s/${_appname}/${pkgname%-git}/g" "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml"
}
package () {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/python${_pyver}/site-packages/${_pkgname}"* \
        "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
}