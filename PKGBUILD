# Maintainer: mdraw.gh at gmail dot com

# If anyone knows how to make the http-parser submodule work
# without this ugly hack in package(), please tell me!

pkgname=('python-httptools')
pkgver='0.0.9'
pkgrel=2
pkgdesc='Fast HTTP parser'
arch=('i686' 'x86_64')
url='https://github.com/MagicStack/httptools'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/MagicStack/httptools/archive/v${pkgver}.tar.gz"
        '0001-setup.py-Use-Cython-directly.patch')
sha256sums=('ce82e03f2d705b1efc03bed5773436f2466de755d2faaf08e902a0f025700053'
            'f32dd7a31a858ec52c4ed7559a7dc358fb03702160bf388c7dbd4ad5802524d4')

prepare() {
    cd "${srcdir}/httptools-${pkgver}"
    patch -p1 -i "${srcdir}/0001-setup.py-Use-Cython-directly.patch"
}

package_python-httptools() {
    cd "${srcdir}/httptools-${pkgver}"

    # Git submodule workaround
    pushd vendor
    rm -rf http-parser
    git clone https://github.com/nodejs/http-parser.git
    pushd http-parser
    git checkout '9b0d5b3' # re-check this hash when updating
    popd
    popd

    python setup.py install --root="${pkgdir}" --optimize=1
}
