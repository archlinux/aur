# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sshfs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2025.11.0
pkgrel=1
pkgdesc="SSH Filesystem -- Async SSH/SFTP backend for fsspec"
arch=('any')
url="https://github.com/fsspec/sshfs"
license=('Apache-2.0')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#            'python-sphinx'
checkdepends=('python-pytest-asyncio'
#             'python-pytest-xdist'
              'python-fsspec'
              'python-asyncssh'
              'python-mock-ssh-server'
              'python-importlib-metadata')  # cryptography, typing_extensions <- asyncssh
#             'openssh'
#             'openbsd-netcat'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3df11a59c2b6f493c0035a5c43636915')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i '/importlib_/s/importlib_/\importlib./' tests/test_sshfs.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-sshfs() {
    depends=('python>=3.7' 'python-fsspec>=2021.8.1' 'python-asyncssh>=2.11.0')
#   optdepends=('python-sshfs-doc: Documentation for SSHFS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sshfs-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
