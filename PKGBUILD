# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

_reponame=ncbi-genome-download
pkgbase=python-ncbi-genome-download
pkgname=('python2-ncbi-genome-download' 'python-ncbi-genome-download')
pkgver=0.2.10
pkgrel=1
pkgdesc="Scripts to download genomes from the NCBI FTP servers"
arch=('any')
url="https://github.com/kblin/ncbi-genome-download"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pytest' 'python2-pytest' 'python-coverage' 'python2-coverage' 'python-pytest-cov' 'python2-pytest-cov' 'python-requests-mock' 'python2-requests-mock' 'python-pytest-mock' 'python2-pytest-mock')
source=(ncbi-genome-download-$pkgver.tar.gz::https://github.com/kblin/ncbi-genome-download/archive/$pkgver.tar.gz)
sha256sums=('9a1800b6bedf8a972e63c6d2465441262f300dc56615db9c83f2c1bff5a91a35')

prepare() {
  cd "${srcdir}"
  cp -a ${_reponame}-$pkgver ${_reponame}-py2-$pkgver
  cd ${_reponame}-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"
  cd "${srcdir}"/${_reponame}-py2-$pkgver
  python2 setup.py build

  msg "Building Python3"
  cd "${srcdir}"/${_reponame}-$pkgver
  python setup.py build
}

package_python2-ncbi-genome-download() {
  depends=('python2' 'python2-appdirs')
  cd "${srcdir}"/${_reponame}-py2-$pkgver

  python2 setup.py install --root="${pkgdir}"/ --optimize=1
  mv "${pkgdir}"/usr/bin/ncbi-genome-download "${pkgdir}"/usr/bin/ncbi-genome-download2
  mv "${pkgdir}"/usr/bin/ngd "${pkgdir}"/usr/bin/ngd2
  install -D LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python-ncbi-genome-download() {
  depends=('python' 'python-appdirs')
  cd "${srcdir}"/${_reponame}-$pkgver

  python setup.py install --root="${pkgdir}"/ --optimize=1
  install -D LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

# vim:ts=2:sw=2:et:
