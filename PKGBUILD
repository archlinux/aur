# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgbase=curator
pkgname=(python-elasticsearch-curator python2-elasticsearch-curator curator)
pkgver=5.6.0
pkgrel=1
pkgdesc='Curator: Tending your Elasticsearch indices'
url='https://github.com/elastic/curator'
arch=('x86_64')
license=('APACHE')
makedepends=('python' 'python-setuptools' 'python-elasticsearch' 'python-boto3'
             'python-requests-aws4auth' 'python-click' 'python-urllib3' 'python-yaml'
             'python-voluptuous' 'python-certifi' 'python-six' 'python-sphinx'
             'python2' 'python2-setuptools' 'python2-elasticsearch' 'python2-boto3'
             'python2-requests-aws4auth' 'python2-click' 'python2-urllib3' 'python2-yaml'
             'python2-voluptuous' 'python2-certifi' 'python2-six' 'python2-sphinx')
checkdepends=('python-pytest' 'python-mock'
              'python2-pytest' 'python2-mock')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/elastic/curator/archive/v${pkgver}.tar.gz)
sha512sums=('7dc02b5d15228ea96254dc7dd8069d8396c5d3df883b7ab42936c7612b0f16f5399131563703ccd05469facee7ddf20a720daf62a2713943a4b9a0c9448dd676')

build() {
  cd curator-${pkgver}
  python setup.py build
  python2 setup.py build
  make -C docs man text
}

check() {
  cd curator-${pkgver}
  py.test test/unit
  py.test2 test/unit
}

package_python-elasticsearch-curator() {
  pkgdesc+=' (python API)'
  depends=('python' 'python-elasticsearch' 'python-elasticsearch' 'python-boto3'
           'python-requests-aws4auth' 'python-click' 'python-urllib3' 'python-yaml'
           'python-voluptuous' 'python-certifi' 'python-six')
  cd curator-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/curator.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  rm -rf "${pkgdir}"/usr/bin
}

package_python2-elasticsearch-curator() {
  pkgdesc+=' (python2 API)'
  depends=('python2' 'python2-elasticsearch' 'python2-elasticsearch' 'python2-boto3'
           'python2-requests-aws4auth' 'python2-click' 'python2-urllib3' 'python2-yaml'
           'python2-voluptuous' 'python2-certifi' 'python2-six')
  cd curator-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/curator.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  rm -rf "${pkgdir}"/usr/bin
}

package_curator() {
  depends=('python' 'python-setuptools' 'python-elasticsearch-curator')
  provides=("elasticsearch-curator=${pkgver}-${pkgrel}")
  cd curator-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  rm -rf "${pkgdir}"/usr/lib
}

# vim: ts=2 sw=2 et:
