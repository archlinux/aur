# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=git-nautilus-icons
pkgver=2.2.0
pkgrel=2
pkgdesc="A Nautilus, Nemo, and Caja extension to overlay icons on files in git repositories"
arch=('any')
url="https://github.com/chrisjbillington/${pkgname}"
license=('BSD 2-Clause "Simplified"')
depends=('python-gobject')
makedepends=(python-setuptools-scm python-build python-installer python-wheel)
optdepends=('python-nautilus: nautilus support'
            'nemo-python: nemo support'
            'python-caja: caja support')
conflicts=("${pkgname}-common"
           'git-caja-icons'
           'git-nemo-icons')
replaces=("${pkgname}-common"
           'git-caja-icons'
           'git-nemo-icons')

source=(https://github.com/chrisjbillington/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('fc4b977a5786a6bb97636dde6a103de3555259d7bd11469df35ba77f06033c4c00770ce9d58b4389b17d492baf0f998dffbc1d7094e91a2264737ffc18560a0a')


build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${pkgname//-/_}=${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # compile Python bytecode for modules outside of site-packages:
    python -m compileall -d / "${pkgdir}"/usr/share
    python -O -m compileall -d / "${pkgdir}"/usr/share
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
