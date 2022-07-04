# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.8.0
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="https://www.galpy.org"
license=('BSD')
makedepends=('python-setuptools' 'gsl'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-nose' 'python-scipy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ed53bb6e0e637242f7e3d8d122f09a51')

#get_pyver() {
#    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
#}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/${_pyname}/snapshot

    sed -i "/directnbody/s/directnbody/galpy.snapshot.directnbody/" Snapshot.py
    sed -i "/from\ Snapshot/s/Snapshot/galpy.snapshot.Snapshot/" snapshotMovies.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py build
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest "build/lib.linux-${CARCH}-$(get_pyver)"
#   python setup.py test
    nosetests
}

package_python-galpy() {
    depends=('python-setuptools' 'python-scipy' 'python-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy'
                'gsl>=1.14: For some advanced features'
                'python-astropy: For Quantity support'
                'python-astroquery: For the Orbit.from_name initialization method'
                'python-numexpr: For or plotting arbitrary expressions of Orbit quantities'
                'python-jax: For use of constant-anisotropy DFs in galpy.df.constantbetadf'
                'python-tqdm: For displaying a progress bar for certain operations (e.g., orbit integration of multiple objects at once'
                'python-pynbody: Foruse of SnapshotRZPotential and InterpSnapshotRZPotential')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
#   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-galpy-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
