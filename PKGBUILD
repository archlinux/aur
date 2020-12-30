# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.1.0
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
  '1591b924438507a0dea86d66735bfdbc0d549e0436447c257cedd2a02c856977'
  'f2e0ce7600fbb0f90086a6c903b8722ce4173f84586f4b642b7752dd459ac10a'
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