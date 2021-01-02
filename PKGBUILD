# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.2.0
pkgrel=1
pkgdesc='Dynamic DNS client for CloudFlare'
arch=('any')
url='https://github.com/uetchy/cfddns'
license=('MIT')
depends=('python' 'python-cloudflare' 'python-click')
makedepends=('git' 'python-dephell')
install="${pkgname}.install"
backup=('etc/cfddns/cfddns.yml')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.install"
)
sha256sums=(
  '02f3f4fda4ebe39d20fdc40ce64b3ded8bb1e556e611b5937405fa8c6c49d1ae'
  '7cc3f2402decf9da7584468d1f42cb12d1708b22cef1f4898bfa46d5d48ac31b'
  '2c7b7a5a25855a84c080c83b241e5135d39f63adee25e82de6dc902a7589924b'
)
_archive=${pkgname}-${pkgver}

prepare() {
  cd "${srcdir}/${_archive}"
  dephell deps convert --level DEBUG --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/${_archive}"
  /usr/bin/python setup.py build
}

package() {
  cd "${srcdir}/${_archive}"
  /usr/bin/python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m600 "etc/cfddns.yml" \
                   "${pkgdir}/etc/cfddns/cfddns.yml"

  install -D -m644 "LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/${pkgname}.service" \
                   "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
