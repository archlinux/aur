# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.4.2
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
sha256sums=("5488709f4b62f20d62561a6f496e4097acce9c48c3440359c9e9d12c402022ef")

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
