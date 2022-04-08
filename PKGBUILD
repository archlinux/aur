# Maintaner: Nikita Tarasov <nikatar@disroot.org>

pkgname=ansible2.9
_pkgname=ansible
pkgver=2.9.27
pkgrel=1
pkgdesc='Ansible 2.9 LTS'
arch=('any')
url='https://www.ansible.com'
license=('GPL3')
depends=('python' 'python-yaml' 'python-paramiko' 'python-jinja')
provides=('python-ansible')
optdepends=('sshpass: for ssh connections with password'
            'python-passlib: crypt values for vars_prompt'
            'python-pyopenssl: openssl modules'
            'python-netaddr: for the ipaddr filter'
            'python-systemd: log to journal'
            'python-pywinrm: connect to Windows machines'
            'python-dnspython: for dig lookup'
            'python-ovirt-engine-sdk: ovirt support'
            'python-boto3: aws_s3 module'
            'python-jmespath: json_query support'
            'python-ldap: ldap support'
            'acme-tiny: openssl_certificate module')
makedepends=('fakeroot' 'python-setuptools')
provides=('ansible')
conflicts=('ansible' 'ansible-core')
replace=('ansible')
backup=('etc/ansible/ansible.cfg')
source=("https://releases.ansible.com/ansible/ansible-${pkgver}.tar.gz")
sha256sums=('479159e50b3bd90920d06bc59410c3a51d3f9be9b4e1029e11d1e4a2d0705736')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/ansible/COPYING

  install -d "${pkgdir}"/usr/share/ansible/doc
  cp -dpr --no-preserve=ownership ./examples "${pkgdir}"/usr/share/ansible/doc/
  install -Dm644 examples/ansible.cfg "${pkgdir}"/etc/ansible/ansible.cfg

  install -d "${pkgdir}"/usr/share/man/man1
  cp -dpr --no-preserve=ownership docs/man/man1/*.1 "${pkgdir}"/usr/share/man/man1
}
