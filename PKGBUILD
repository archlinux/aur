# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mfusepy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.1.1
pkgrel=1
pkgdesc="Ctypes bindings for the high-level API in libfuse 2 and 3"
arch=('any')
url="https://github.com/mxmlnkn/mfusepy"
license=('ISC')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest-order'
#             'python-pytest-xdist'
              'python-ioctl-opt'
              'fuse2')
#             'fuse3')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-loopback.py::https://github.com/mxmlnkn/mfusepy/raw/refs/tags/v${pkgver}/examples/loopback.py"
        "${pkgver}-memory.py::https://github.com/mxmlnkn/mfusepy/raw/refs/tags/v${pkgver}/examples/memory.py"
        "${pkgver}-memory_nullpath.py::https://github.com/mxmlnkn/mfusepy/raw/refs/tags/v${pkgver}/examples/memory_nullpath.py"
        "${pkgver}-readdir_returning_offsets.py::https://github.com/mxmlnkn/mfusepy/raw/refs/tags/v${pkgver}/examples/readdir_returning_offsets.py"
        "${pkgver}-readdir_with_offset.py::https://github.com/mxmlnkn/mfusepy/raw/refs/tags/v${pkgver}/examples/readdir_with_offset.py"
    )
md5sums=('7d812fd614d61baa4c1aad7ef8e9ee36'
         '1ece541bd275b431df282627f3fff5cd'
         '287bd1be09476006e285c365648fcfd1'
         '043b00e7cd70920df66de35fe6da0a93'
         'b97c524c50bd6fc20f9b55e82647a27f'
         '1c917b5bf5dcfbfc00af97d6746422d5')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i "s/fusermount/fusermount3/g" tests/test_examples.py
#   sed -i 's:"fuse", "fuse3":"fuse3", "fuse":' tests/test_struct_layout.py
    for tps in ${srcdir}/${pkgver}-*.py; do ln -rs ${tps} ${tps##*-}; done
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-mfusepy() {
    depends=('python>=3.9')
    optdepends=('fuse2' 'fuse3')
#   optdepends=('python-mfuse-doc: Documentation for mfusepy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-mfusepy-doc() {
#    pkgdesc="Documentation for Python mfusepy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
