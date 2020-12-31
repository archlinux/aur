# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.1.0
pkgrel=2
pkgdesc='DDNS client for CloudFlare DNS'
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
  '1591b924438507a0dea86d66735bfdbc0d549e0436447c257cedd2a02c856977'
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
