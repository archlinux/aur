# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.7.3
pkgrel=2

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
b2sums=('bd17b9c5776f31af26c3d47ae275a36dfc26a993f62c2f193f585a80ea36e07a77161ca651d72433c0938ecb1a725bb4634c8f1d7c994ec40d650906a10bbc72')

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
