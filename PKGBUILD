# Maintainer: Yonggang Li <gnaggnoyil@gmail.com>

_pkgbasename=datatable
pkgname=python-${_pkgbasename}
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python package for manipulating 2-dimensional tabular data structures"
arch=('x86_64')
url="https://github.com/h2oai/${_pkgbasename}/"
license=('MPL2')
depends=('python>=3.10')
makedepends=('python-build' 'python-installer' 'git')
optdepends=(
    'python-numpy'
    'python-pandas'
    'python-xlrd'
)
#checkdepends=(
#    'python-pytest'
#    'python-docutils'
#)
provides=('python-datatable')
# We have to use git repo rather than github release since the source need its
# git hash to generate build info
source=(
    "git+https://github.com/h2oai/${_pkgbasename}.git#tag=v${pkgver}"
    "0001-fix_support_for_python310.patch"
)
sha256sums=('SKIP'
            'c7ca3a4856e5bd1e95d7e0e63d609369639f089ff3020e2ba97a9cde2a161871')

prepare() {
    cd "${srcdir}/${_pkgbasename}"
    patch -p1 -i "${srcdir}/0001-fix_support_for_python310.patch"
}

build() {
    # There are issue installing through `pip install datatable==1.0.0`
    # Ref: https://github.com/h2oai/datatable/issues/3150
    cd "${srcdir}/${_pkgbasename}"
    # The build ext uses 80% of cpu_count as nworkers
    # The build steps is determined by ci/ext.py and thus those FLAGS in
    # makepkg.conf will be generally ignored. `namcap` will then report warning
    # that the .so file "lacks FULL RELRO, check LDFLAGS" when executing
    # `extra-x86_64-build`
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/${_pkgbasename}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
