# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.0.0
pkgrel=1
pkgdesc='DDNS client for CloudFlare DNS'
arch=('any')
url='https://github.com/uetchy/cfddns'
license=('MIT')
depends=('python' 'python-cloudflare' 'python-click')
makedepends=('git' 'python-dephell')
backup=('etc/cfddns/cfddns.yml')
source=("archive.tar.gz::${url}/archive/v${pkgver}.tar.gz"
       "${pkgname}.service")
sha256sums=(
  '86dabd00586ccac237c5b2fa135216d64f0989b2ad851ada3ada1d2479525539'
  '1198d4d36c57c333acc7aa0a99339a66590145d098dd276b697ce639215bd5ca'
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