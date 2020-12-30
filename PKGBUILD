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
source=(.source::"https://github.com/uetchy/${pkgname}/archives/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('SKIP' '1198d4d36c57c333acc7aa0a99339a66590145d098dd276b697ce639215bd5ca')

prepare() {
  cd "${srcdir}/.source"
  dephell deps convert --level DEBUG --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/.source"
  /usr/bin/python setup.py build
}

package() {
  cd "${srcdir}"/.source
  /usr/bin/python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m600 "etc/cfddns.yml" \
                   "${pkgdir}/etc/cfddns/cfddns.yml"

  install -D -m644 "LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/${pkgname}.service" \
                   "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}