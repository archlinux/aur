# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.6.2
pkgrel=1

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
sha256sums=("ecee8db7acebb1626b528a38b28907655e7c0c14c5cc31baac06b1511f4b3815")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # install systemd service + timer
    install -Dm644 \
        "extra/systemd/wolkenbruch."{timer,service} \
        -t "${pkgdir}/usr/lib/systemd/user/"

    install -Dm644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
