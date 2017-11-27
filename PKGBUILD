# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.1.11
pkgrel=1
pkgdesc='A wrapper script for Borg backup software that creates and prunes backups'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools' 'python-tox')
provides=('borgmatic')
install="${pkgname}.install"
# Main repository moved over to gittea. Switch to using commits until tags are
# fixed:
_commit='3e26e70d0c188641efa978d777202064c7200b99'
source=(
  "git+https://projects.torsion.org/witten/borgmatic.git#commit=${commit}"
  "${pkgname}.install"
)
sha256sums=(
  'SKIP'
  '2862763feea83e3ee0fb65c9f3fec648312486cd8ab48cd7cac70a7bb742b55b'
)

prepare() {
  cd "${pkgname}"

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
  cd "${pkgname}"

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
  cd "${pkgname}"
  
  python setup.py -q install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
