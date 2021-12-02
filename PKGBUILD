# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgbase=curator
pkgname=(python-elasticsearch-curator curator)
pkgver=5.7.6
pkgrel=7
pkgdesc='Curator: Tending your Elasticsearch indices'
url='https://github.com/elastic/curator'
arch=('x86_64')
license=('APACHE')
makedepends=('python' 'python-setuptools' 'python-elasticsearch' 'python-boto3'
             'python-requests-aws4auth' 'python-click' 'python-urllib3' 'python-yaml'
             'python-voluptuous' 'python-certifi' 'python-six' 'python-sphinx'
             'python-cx_freeze' 'xz' 'mpdecimal')
checkdepends=('python-pytest' 'python-mock')
options=('!makeflags')
source=(https://github.com/elastic/curator/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz cx-freeze-6.7.patch)
sha256sums=('a48486cacf0b32038358babfc5a8755c9a24992ff5279226b923298b426fe253'
            '1003aff5daa7adcf31703bca26be8bb0fe7109732118c7e4e6e32e2eb931f07a')
sha512sums=('d4f46fad5d8107899fc4c9ee1b7dad595749415cee53f55993c517743df6119ff7680f3ad96f1a937d793dad395416257b56a4b3cdcd6a99b162ad7f77196051'
            '5d153fb9d264ad7e55f34f368f2065eaf6c1e2546254527d13e99fdd3cca565dd6f9fc0fa21cd583c74d96af8e22bd5bc846278c6fa7149c2cc25194484c2f6c')

prepare() {
  sed -e 's|click>=6.7,<7.0|click|' \
      -e 's|urllib3>=1.24.2,<1.25|urllib3|' \
      -e 's|pyyaml==3.12|pyyaml|' \
      -i curator-${pkgver}/setup.py # Admit click 8
  patch -d curator-$pkgver -p1 < cx-freeze-6.7.patch # Fix build with cx-freeze 6.7
}

build() {
  cd curator-${pkgver}
  python setup.py build
  make -C docs man text
}

check() {
  cd curator-${pkgver}
  py.test test/unit
}

package_python-elasticsearch-curator() {
  pkgdesc+=' (python API)'
  depends=('python' 'python-elasticsearch' 'python-elasticsearch' 'python-boto3'
           'python-requests-aws4auth' 'python-click' 'python-urllib3' 'python-yaml'
           'python-voluptuous' 'python-certifi' 'python-six' 'python-cx_freeze'
           'xz' 'mpdecimal')
  cd curator-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
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
