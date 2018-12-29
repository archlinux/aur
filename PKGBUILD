# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.2.14
pkgrel=5
pkgdesc='A wrapper script for Borg backup software that creates and prunes backups'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools')
checkdepends=('python-flexmock' 'python-pytest')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://projects.torsion.org/witten/borgmatic/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
  "${pkgname}.service.patch"
)
sha256sums=(
  'b77f8aff75208a69211d2453baf287001b4f54f858c56f8daba240461485d0f8'
  '2862763feea83e3ee0fb65c9f3fec648312486cd8ab48cd7cac70a7bb742b55b'
  'f27cf21c8076d9de96ee7931ec6660f7f5d9e9fcaa6346612701eff32fa5127d'
)

_pytestdir="$(mktemp -d)"

prepare() {
  cd "${pkgname}"

  patch sample/systemd/borgmatic.service < "${srcdir}/borgmatic.service.patch"
  python setup.py -q install --root="${_pytestdir}"
}

check() {
  cd "${pkgname}"

  export PATH="${_pytestdir}/usr/bin:${PATH}"
  export PYTHONPATH="${_pytestdir}/usr/lib/python*/site-packages:${PYTHONPATH}"

  pytest
}

package() {
  cd "${pkgname}"
  
  python setup.py -q install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
}

# vim: ts=2 sw=2 et:
