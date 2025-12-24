# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python-crfsuite
pkgver=0.9.12
pkgrel=1
pkgdesc="A Python binding for crfsuite"
arch=('x86_64')
url="https://github.com/scrapinghub/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
       "crfsuite.zip"::"https://github.com/chokkan/crfsuite/archive/refs/heads/master.zip"
       "liblbfgs.zip"::"https://github.com/chokkan/liblbfgs/archive/refs/heads/master.zip")
noextract=('crfsuite.zip' 'liblbfgs.zip')
b2sums=('1575895071b9a2cbfd2da19824404c0a21aaa582d331e3ccce76c7f9adc1a6cc44151c20b95307d91daaf8c7beb2e27da76e4312f6f7de79255b4862e71e1cb6'
        '8cb74727595702862e0bdcf24a5b1c175121a7e717f3e4856cd2dba0fc122287b459b96992a45448c919b68fa1f6c1a2cef3fdbce7c7041782f8453ce973878b'
        '16cb5681cb00e6600304730a0792770da574ba533a6167571f22004020bd92ea1f0edaa11d9f0eea91cb23be0a78969d8a5b9d13906dd77a3ad869fb242f7d7b')

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
