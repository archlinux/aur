# Maintainer: SrKaysama <srkaysama@waifu.club>

pkgname=lemongrab
pkgver=0.1dev
pkgrel=5
pkgdesc='An attempt at a cross-platform version of the popular "screenfetch" script.'
arch=( 'any' )
url='https://github.com/Aareon/lemongrab/'
provides=('lemongrab')
depends=('python')
makedepends=('python-pip')
license=('MIT')
source=('git+https://github.com/Aareon/lemongrab.git' lemongrab.sh )
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    _version="$(cat setup.py | grep version | sed 's/ version=//' | cut -c 5-10 )"
    echo "${_version}"
}

build(){
    cd "${srcdir}/${pkgname}"
    python setup.py build

}

package() {
    # Python package
    cd "${srcdir}/${pkgname}"
    ls -o "${srcdir}/${pkgname}.sh"
    #install -d "${pkgdir}/usr/lib/python3.6/site-packages/${pkgname}/"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    # Files

    install -d "${pkgdir}/opt/${pkgname}"
    ls -o "${srcdir}"
    cp -a "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
    cp -a "${pkgdir}/usr/lib/python3.6/site-packages/${pkgname}/__pycache__/__main__.cpython-36.pyc" "${pkgdir}/opt/${pkgname}/__main__.pyc"

    # Exec
    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}.sh"

    # Bin
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}