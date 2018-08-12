# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.2.2
pkgrel=1
pkgdesc='A wrapper script for Borg backup software that creates and prunes backups'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools' 'python-flexmock' 'python-pytest')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://projects.torsion.org/witten/borgmatic/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
)
sha256sums=('a20d4950bdd9066e2d3be9c80faa80b9597a546bbaedb94382973b6e7a39fa25'
            '2862763feea83e3ee0fb65c9f3fec648312486cd8ab48cd7cac70a7bb742b55b')

prepare() {
  cd "${pkgname}"

  sed -i 's#/usr/local/bin/borgmatic#/usr/bin/borgmatic#' sample/systemd/borgmatic.service
}

check() {
  cd "${pkgname}"

  pytest
}

package() {
  cd "${pkgname}"
  
  python setup.py -q install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
