# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.5.0
pkgrel=0

arch=("x86_64" "i686")
license=("BSD")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-geocoder"
    "python-pyaml"
    "python-requests"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("4ee2b796057780f09716eecf36bffa82f7e6e4fe29b936daf9883f0bab24e52d")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # install systemd service + timer
    install -Dm644 \
        "extra/systemd/wolkenbruch@."{timer,service} \
        -t "${pkgdir}/usr/lib/systemd/system/"

    install -Dm644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
