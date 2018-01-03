# Maintainer: winnie <aur@msgpeek.net>

_py="python"
pkgname=netzob
pkgver=1.0.2
_release_name=${pkgname}-Release-${pkgname}-${pkgver}
pkgrel=3
HOLDVER=1
pkgdesc="Netzob is an opensource tool which supports the expert in its operations of reverse engineering, evaluation and simulation of communication protocols."
arch=('i686' 'x86_64')
url="http://netzob.org"
license=('GPL3')
depends=("impacket"  "${_py}" "${_py}-jsonpickle" "${_py}-colorama" "${_py}-numpy" "${_py}-sphinx" "${_py}-pcapy" "${_py}-bitarray" "${_py}-babel" "${_py}-netaddr" "${_py}-bintrees" "${_py}-minepy" "${_py}-arpreq" "${_py}-pylstar")
makedepends=("${_py}-setuptools" "${_py}-mock")
conflicts=('netzob-git')
options=(!emptydirs)
install=
source=(${_release_name}.tar.gz::https://github.com/netzob/netzob/archive/Release/${pkgname}-${pkgver}.tar.gz)
provides=('netzob')
sha256sums=('54934c90cc8e80cca7f1fdbc74ba3cf5bf1fb94536366a6f313ccc92f969e390')

build() {
    cd "${srcdir}/${_release_name}/netzob"

    msg "Starting build."
    ${_py} setup.py build

    msg "Building docs."
    sphinx-apidoc -T -e -f -o doc/documentation/source/developer_guide/API/ src/netzob/
    find doc/documentation/source/developer_guide/API/ -type f -exec sed -i ':a;N;$!ba;s/Subpackages\n-----------\n\n.. toctree::\n/Subpackages\n-----------\n\n.. toctree::\n    :maxdepth: 1\n    /g' {} +
    sphinx-build -b html doc/documentation/source/ doc/documentation/build/

}

package() {
    cd "${srcdir}/${_release_name}/netzob"

    msg "Starting install."
    ${_py} setup.py install --root="$pkgdir" || return 1

    msg "Installing docs."
    mkdir -p "$pkgdir/usr/share/doc"
    cp -r doc/documentation/build "$pkgdir/usr/share/doc/netzob"

    msg "Install successful. Cleaning up."
}

