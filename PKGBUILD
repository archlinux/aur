# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.6.0
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
sha256sums=("b0f6c2019462cc41ac3038c08a4ae211a19d89840dd40e3d595de6eeaa48be59")

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
