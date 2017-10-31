# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.1.7
pkgrel=4
pkgdesc='A wrapper script for Borg backup software that creates and prunes backups'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools' 'python-tox')
provides=('borgmatic')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://torsion.org/hg/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('939ae88c8f9d2caf77b29a1bb9a53df52fc274ed6f004793616da0c6dab73eae'
            'ca30f277f9ea3663e61a94e898fcbc3bd34073fdbb37da3f18ebb42a04ec0381')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Workaround for borgmatic requiring python-ruamel-yaml <= 15.0. This will
  # break when  Arch's python-ruamel-yaml version exceeds 15. Long-term a
  # change should be proposed to address this upstream:
  #
  #    https://tree.taiga.io/project/witten-borgmatic/issue/37
  #
  # We will welcome patches to maintain compatibility with Arch's
  # python-ruamel-yaml version if upstream is slow to adopt it.
  sed -i 's/ruamel.yaml<=0.15/ruamel.yaml<0.16/' setup.py
  sed -i 's#/usr/local/bin/borgmatic#/usr/bin/borgmatic#' sample/systemd/borgmatic.service
}

check() {
  cd "${pkgname}-${pkgver}"

  # Required because borgmatic uses python 3.4, but Arch's default python
  # version is 3.6. Once borgmatic moves to 3.6 upstream, this workaround
  # should be removed.
  #
  # Again, if patches are required to maintain compatibility with Arch's
  # python version, we will gladly accept them.
  sed -i 's/envlist=py34/envlist=py36/' tox.ini

  tox
}

package() {
  cd "${pkgname}-${pkgver}"
  
  python setup.py -q install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
