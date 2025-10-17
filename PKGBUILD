# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-universal-pathlib
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
# "python-${_pname}-doc")
pkgver=0.3.4
pkgrel=1
pkgdesc="pathlib api extended to use fsspec backends"
arch=('any')
url="https://github.com/fsspec/universal_pathlib"
license=('MIT')
makedepends=('python-setuptools-scm>=8'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest'
              'python-fsspec'
              'python-cheroot'
              'python-moto'
              'python-s3fs'
              'python-smbprotocol'
              'python-webdav4'
              'python-wsgidav'
              'python-pathlib-abc'
              'python-pydantic-settings') # requests <- moto; aiohttp <- aiobotocore <- s3fs; upath/tests/third_party/...
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9ab89805f657bb8fe0b3d2306175ace5')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    # no xdist: socket already in use
    # botocore.exceptions.EndpointConnectionError: Could not connect to the endpoint URL: "http://127.0.0.1:5555/test_bucket"
    pytest \
        --ignore=upath/tests/implementations/test_s3.py \
        --deselect=upath/tests/test_relative.py::test_protocol_storage_options_fs_preserved[gcs-storage_options2-gcs://bucket/foo/bar/baz.txt-gcs://bucket/foo] || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-universal-pathlib() {
    depends=('python>=3.9' 'python-fsspec>=2024.5.0' 'python-pathlib-abc>=0.5.1')
#   optdepends=('python-universal-pathlib-doc: Documentation for upath')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-universal-pathlib-doc() {
#    pkgdesc="Documentation for Python Universal Pathlib"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
