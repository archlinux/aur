# Maintaner: Nikita Tarasov <nikatar@disroot.org>

pkgname=ansible2.9
_pkgname=ansible
pkgver=2.9.27
pkgrel=2
pkgdesc='Ansible 2.9 LTS with Mitogen: speed up your playbooks'
arch=('any')
url='https://www.ansible.com'
license=('GPL3')
depends=('python3.7')
provides=('python-ansible')
makedepends=('fakeroot')
provides=('python-ansible' 'ansible')
conflicts=('ansible' 'ansible-core')
replace=('ansible')
backup=('etc/ansible/ansible.cfg')
source=("https://releases.ansible.com/ansible/ansible-${pkgver}.tar.gz")
sha256sums=('479159e50b3bd90920d06bc59410c3a51d3f9be9b4e1029e11d1e4a2d0705736')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  python3.7 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python3.7 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/ansible/COPYING

  install -d "${pkgdir}"/usr/share/ansible/doc
  cp -dpr --no-preserve=ownership ./examples "${pkgdir}"/usr/share/ansible/doc/
  install -Dm644 examples/ansible.cfg "${pkgdir}"/etc/ansible/ansible.cfg

  install -d "${pkgdir}"/usr/share/man/man1
  cp -dpr --no-preserve=ownership docs/man/man1/*.1 "${pkgdir}"/usr/share/man/man1

  ### LIBRARIES ###
  python3.7 -m pip install --target="${pkgdir}"/usr/lib/python3.7/site-packages jinja2 cryptography PyYAML mitogen==0.2.9

  ### OPTIONAL LIBRARIES ###
  python3.7 -m pip install --target="${pkgdir}"/usr/lib/python3.7/site-packages passlib netaddr zabbix-api
}
