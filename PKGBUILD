# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.7.2
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
b2sums=('f13b2b8fa1d66b9585722522ab63e00fac7dd7d371f8c7d20f01bb867f4158aa81c07c65553e5329d9346eecef071edb9a14606124fbd6025e5e48c4b23b5e8d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation

    sed 's/^/# /' -i "src/wolkenbruch/wolkenbruch.yml.template"
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
