# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python-crfsuite
pkgver=0.9.10
_pkgver=0.99
pkgrel=1
pkgdesc="A Python binding for crfsuite"
arch=('any')
url="https://github.com/scrapinghub/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
        "001-Fix-GCC-14-build-error.patch"
       "crfsuite.zip"::"https://github.com/chokkan/crfsuite/archive/refs/heads/master.zip"
       "liblbfgs.zip"::"https://github.com/chokkan/liblbfgs/archive/refs/heads/master.zip")
noextract=('crfsuite.zip' 'liblbfgs.zip')
sha512sums=('18cd6b549658c35485db56ed20b550381231f220fc9873d79e9643b3d1f52cd1ace96b3ed489f5a4398a4a499d72d7f02b257b21718464abc606f792946cfe8d'
            '0e8031112ce62eaeaa993a7156269a1786ee9f53729a07c2328fdd680fcd827111e298d7d8151910424e6386f0f63219df2772874b910ede6c8baa35f7225db0'
            '3ddaddc385f1fd4771c18c42ebb2d8a0e0fb1f54375f450078ff7cc8485fb31159008f16125042e040a5ff2b0369b5e216b6853276d3e9dc44ed35d7d7cbbe4a'
            '2b567b61e327cebf4aa0d8b36eb635a6758cd069520fbd7a546f591e6cc3dae178946cf4312f28815c166558f03088271e56133f011b8091ed453ff74fa8d7bd')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 < "$srcdir"/"001-Fix-GCC-14-build-error.patch"
    cython pycrfsuite/_pycrfsuite.pyx --cplus -a -2 -I pycrfsuite
    bsdtar --strip-components=1 -xvf "$srcdir/crfsuite.zip" -C crfsuite
    bsdtar --strip-components=1 -xvf "$srcdir/liblbfgs.zip" -C liblbfgs
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
