# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Alessandro Gario

pkgname=manuskript-git
_pkgname=manuskript
pkgver=0.14.0.r1.gaecdc21
pkgrel=1
arch=('any')

pkgdesc="Manuskript is an open-source tool for writers (git version)."
url="https://www.theologeek.ch/manuskript"
license=('GPL3')

provides=('manuskript')
conflicts=('manuskript')

makedepends=('git' 'gendesk')
depends=('python-pyqt5' 'qt5-svg' 'python-lxml')
optdepends=(
	'python-languagetool: spell and grammar check support'
    'python-pyenchant: spell check support'
    'python-markdown: export as html'
    'pandoc: more export formats'
)

source=("${pkgname}::git+https://github.com/olivierkes/manuskript#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    # generate a desktop file
    gendesk -f -n --icon="/opt/${_pkgname}/icons/Manuskript/icon-512px.png" --pkgname ${_pkgname} --pkgdesc "${pkgdesc}" --exec="${_pkgname} %U"
}


package() {

    # copy all the files
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    cp -R ${srcdir}/${pkgname}/* "${pkgdir}/opt/${_pkgname}"

    # symlink the runner to $path
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # install the desktop launcher
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
