# Maintainer: Jack Rubacha  <rubacha.jack03@gmail.com>
# Mainainter: Paul Nicholson <brenix@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris <seitz.christoph@gmail.com>
# Contributor: m0ikz <ndelatorre@moikz.com.ar>
# Contributor: atweiden <archbaum@gmail.com>

pkgname=ansible-git
pkgver=r50663.e6e98407178
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://www.ansible.com'
license=('GPL3')
depends=('python' 'python-yaml' 'python-paramiko' 'python-jinja')
provides=('ansible' 'python-ansible')
replaces=('ansible' 'python-ansible')
conflicts=('ansible' 'python-ansible')
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
makedepends=('fakeroot' 'python-setuptools' 'python-straight.plugin' 'git' 'python-sphinx')
backup=('etc/ansible/ansible.cfg')
source=($pkgname::git+https://github.com/ansible/ansible.git)
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  python setup.py build
  make docs
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/ansible/COPYING

  install -d "${pkgdir}"/usr/share/ansible/doc
  cp -dpr --no-preserve=ownership ./examples "${pkgdir}"/usr/share/ansible/doc/
  install -Dm644 examples/ansible.cfg "${pkgdir}"/etc/ansible/ansible.cfg

  install -d "${pkgdir}"/usr/share/man/man1
  cp -dpr --no-preserve=ownership docs/man/man1/*.1 "${pkgdir}"/usr/share/man/man1
}
