# Maintainer: Dominik Kummer <admin@arkades.org>

pkgbase=bkmk
pkgname=('bkmk' 'python-bkmk')
pkgver=0.1
pkgrel=1

pkgdesc="Bookmark format converter and Python library"
arch=('any')
url="https://github.com/infinity0/python-bkmk"
license=('MIT')

depends=('python>=3.9')

makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)

_name=bkmk

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)

sha256sums=(
    '697c43fd88239ca58a221fd718b9fa4df5aefdeb084207b1026af5a520365a54'
)

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m build --wheel --no-isolation

    # Install the wheel into a temporary staging directory.
    # Both split packages will use this installation.
    python -m installer \
        --destdir="${srcdir}/pkgroot" \
        dist/*.whl
}

package_python-bkmk() {
    pkgdesc="Python library for bookmark format conversion"
    depends=('python>=3.9')

    local _site_packages
    _site_packages="$(python -c \
        'import sysconfig; print(sysconfig.get_path("purelib"))')"

    # Install the Python module and distribution metadata.
    install -d "${pkgdir}/${_site_packages}"

    cp -a \
        "${srcdir}/pkgroot/${_site_packages}/." \
        "${pkgdir}/${_site_packages}/"

    # Install the upstream license.
    install -Dm644 \
        "${srcdir}/${_name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/python-bkmk/LICENSE"
}

package_bkmk() {
    pkgdesc="CLI bookmark format converter"
    depends=('python-bkmk')

    # Install only the generated CLI executable.
    install -Dm755 \
        "${srcdir}/pkgroot/usr/bin/bkmk" \
        "${pkgdir}/usr/bin/bkmk"
}
