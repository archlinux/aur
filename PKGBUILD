# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributer: Maarten van Gompel <proycon at anaproy dot nl

pkgbase=python-smart-open
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
#_pyname=${pkgbase#python-}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=7.0.5
pkgrel=1
pkgdesc="Utils for streaming large files (S3, HDFS, GCS, Azure Blob Storage, gzip, bz2...)"
arch=('any')
url="https://github.com/piskvorky/smart_open"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-nose'
              'python-wrapt')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e26329aca66b36264db8eea68a5933cf')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
    nosetests || warning "Tests failed"
}

package_python-smart-open() {
    depends=('python>=3.7' 'python-wrapt')
    optdepends=('python-boto3: s3, AWS support'
                'python-google-cloud-storage: gcs, Google Cloud Storage support'
                'python-azure-storage-blob: Azure support'
                'python-azure-common: Azure support'
                'python-azure-core: Azure support'
                'python-requests: http, webdfs support'
                'python-paramiko: ssh support'
                'python-zstandard: ast support')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-smart-open-doc() {
#    pkgdesc="Documentation for Python smart-open"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
