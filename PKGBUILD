# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-multiformats
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.1.post4
pkgrel=1
pkgdesc="Python implementation of multiformats protocols"
arch=('any')
url="https://multiformats.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer')
#            'python-sphinx'
#            'python-sphinx_rtd_theme'
#            'python-bases'
#            'python-multiformats-config')  # wheel required by new setuptools typing-validation <- bases
checkdepends=('python-pytest'
              'python-bases'
              'python-multiformats-config'
              'python-pyskein'
              'python-blake3'
              'python-mmh3'
              'python-pycryptodomex') # bases, multiformats-config already in makedepends, no xdist
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('63c9331d1ed581b2b6a8026abb5e0f12')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/Resource/c \        resource," test/test_03_multihash.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

    msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-multiformats() {
    depends=('python>=3.7'
             'python-typing_extensions>=4.6.0'
             'python-typing-validation>=1.1.0'
             'python-bases>=0.3.0'
             'python-multiformats-config>=0.3.0')
    optdepends=('python-blake3: for the skein hash functions'
                'python-pyskein: for the blake3 hash function'
                'python-mmh3: for the murmur3 hash functions'
                'python-pycryptodomex: for the ripemd-160 hash function, the kangarootwelve hash function, the keccak hash functions and the sha2-512-224/sha2-512-256 hash functions.'
                'python-multiformats-doc: Documentation for multiformats')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-multiformats-doc() {
#    pkgdesc="Documentation for Python multiformats"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
