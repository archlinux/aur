# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-infi.unittest
pkgver=1.1.0
pkgrel=5
pkgdesc="Various extensions to the unittest module"
arch=("any")
license=("BSD3")
depends=("python-infi" "python-munch")
source=(
    "https://github.com/Infinidat/infi.unittest/archive/${pkgver}.tar.gz"
    "requirements.patch"
)
sha256sums=(
    "311e0ebcab6e67821ab044735d29d2b6aaebc562a7bc6bb6aa665ea2f1afaadf"
    "94fca55157ce215ef89b641b10d7da69c7e3ab8a8ca07cf3462c826a6e89419e"
)

prepare() {
    cd "infi.unittest-${pkgver}"
    patch -p1 < "${srcdir}/requirements.patch"
}

package() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0], end='')")
    local _pyversion=$(python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]), end='')")

    cd "infi.unittest-${pkgver}"

    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-infi.unittest/LICENSE"
    # The infi namespace is provided by the python-infi package
    rm "${pkgdir}${_site_packages}/infi.unittest-${pkgver}-py${_pyversion}-nspkg.pth"
    # Remove traces of the base infi package files from the egg metadata
    rm "${pkgdir}${_site_packages}/infi.unittest-${pkgver}-py${_pyversion}.egg-info/namespace_packages.txt"
    sed -i '/namespace_packages\.txt/d' "${pkgdir}/${_site_packages}/infi.unittest-${pkgver}-py${_pyversion}.egg-info/SOURCES.txt"
    sed -i '/^infi\/__init__\.py$/d' "${pkgdir}/${_site_packages}/infi.unittest-${pkgver}-py${_pyversion}.egg-info/SOURCES.txt"
}
