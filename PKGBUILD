# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: George C. Privon <accounts5 at privon dot com>

_pyname=corner
pkgname=python-${_pyname}
pkgver=2.2.3
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://corner.readthedocs.io"
depends=('python-matplotlib>=2.1')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer')
#checkdepends=('python-nose')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-arviz'
              'python-pandas'
              'python-scipy')
optdepends=('python-scipy' 'python-arviz>=0.9')
license=('BSD-2-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('642a8e7df2365a93fa223428ab88f3d6')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
