# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.8.0
pkgrel=1

arch=("any")
license=("GPL-3.0-or-later")

makedepends=(
    "python-build"
    "python-hatchling"
    "python-installer"
    "python-wheel"
)
depends=(
    "python"
    "python-configargparse"
    "python-geocoder"
    "python-importlib-resources"
    "python-pyaml"
    "python-requests"
)

source=("https://github.com/christophfink/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
b2sums=('d666e0297711c006b3865f4efaa7e592b640c1a73bf51f9047044ff399642933e2592a8716122ae7b62d3bcde3f8bc6ba4a370fe04af579c7db4c9c94c058f9c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install \
        -Dm0644 \
        "src/wolkenbruch/wolkenbruch.yml.template" \
        "${pkgdir}/etc/wolkenbruch.yml"

    install \
        -Dm0644 \
        "extra/systemd/wolkenbruch.service" \
        "${pkgdir}/usr/lib/systemd/user/wolkenbruch.service"

    install \
        -Dm0644 \
        "extra/systemd/wolkenbruch.timer" \
        "${pkgdir}/usr/lib/systemd/user/wolkenbruch.timer"
}
