# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.8.1
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
b2sums=("026af6cbd70e487a1f022c549e52321ae0dd7b0441237e26744a0ff05e8b4a66f39521c7f5845cc36a7afe63af28737a9ddc4718cff36dded7b46784400abd11")

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
