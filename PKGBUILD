# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.4.0
pkgrel=1
pkgdesc='Dynamic DNS client for Cloudflare'
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
  '67a4a73dc05154dfb54d21f1429decb05e3e1d80e5a27d8e339740169ebd04f2'
  '7cc3f2402decf9da7584468d1f42cb12d1708b22cef1f4898bfa46d5d48ac31b'
  'ce77a09082e10103e84015ae1dbc0cf12a77d64aa6201674c08d2de51ee265d8'
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
