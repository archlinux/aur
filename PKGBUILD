# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python-crfsuite
pkgver=0.9.11
pkgrel=1
pkgdesc="A Python binding for crfsuite"
arch=('x86_64')
url="https://github.com/scrapinghub/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
       "crfsuite.zip"::"https://github.com/chokkan/crfsuite/archive/refs/heads/master.zip"
       "liblbfgs.zip"::"https://github.com/chokkan/liblbfgs/archive/refs/heads/master.zip")
noextract=('crfsuite.zip' 'liblbfgs.zip')
sha512sums=('063a80bb3265528aa1925af03a0f633b16b48193efa84a2169696795fb7613ebecd7d7892dd2fe78bc50aa455c0a7eb073b16eadd365b70469de34f6cf0500d7'
            '3ddaddc385f1fd4771c18c42ebb2d8a0e0fb1f54375f450078ff7cc8485fb31159008f16125042e040a5ff2b0369b5e216b6853276d3e9dc44ed35d7d7cbbe4a'
            '2b567b61e327cebf4aa0d8b36eb635a6758cd069520fbd7a546f591e6cc3dae178946cf4312f28815c166558f03088271e56133f011b8091ed453ff74fa8d7bd')

prepare() {
    cd "${pkgname}-${pkgver}"
    cython pycrfsuite/_pycrfsuite.pyx --cplus -a -3 -I pycrfsuite
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
