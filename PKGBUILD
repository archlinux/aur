# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributer: Alessandro Gario

pkgname=manuskript-git
_pkgname=manuskript
pkgver=0.6.0.r0.gd32ee37
pkgrel=1
arch=('any')

pkgdesc="Manuskript is an open-source tool for writers (git version)."
url="http://www.theologeek.ch/manuskript"
license=('GPL3')

provides=('manuskript')
conflicts=('manuskript')

makedepends=('git' 'gendesk')
depends=('python-pyqt5' 'qt5-svg' 'python-lxml')
optdepends=(
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
    gendesk -f -n --pkgname ${_pkgname} --pkgdesc "${pkgdesc}" --exec="${_pkgname} %U"

    # add the custom icon
    printf "\nIcon=/opt/${_pkgname}/icons/Manuskript/icon-512px.png" >> "${_pkgname}.desktop"
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
