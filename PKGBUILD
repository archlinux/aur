# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Jack Rubacha  <rubacha.jack03@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris <seitz.christoph@gmail.com>
# Contributor: m0ikz <ndelatorre@moikz.com.ar>
# Contributor: atweiden <archbaum@gmail.com>

pkgname=ansible-core-git
pkgver=r54176.fa92228b506
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://github.com/ansible/ansible'
license=('GPL3')
depends=('python' 'python-pyyaml' 'python-paramiko' 'python-jinja' 'python-resolvelib' 'python-typing-extensions')
provides=('ansible-core' 'python-ansible')
replaces=('ansible-core' 'python-ansible')
conflicts=('ansible-core' 'python-ansible')
optdepends=('sshpass: for ssh connections with password'
            'python-passlib: crypt values for vars_prompt'
            'python-netaddr: for the ipaddr filter'
            'python-systemd: log to journal'
            'python-pywinrm: connect to Windows machines'
            'python-dnspython: for dig lookup'
            'python-jmespath: json_query support'
            'python-pip: for module to manage Python libarary dependencies'
            'python-setuptools: for module to manage Python libarary dependencies')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-setuptools' 'python-straight.plugin' 'python-wheel' 'git')
backup=('etc/ansible/ansible.cfg')
source=($pkgname::git+https://github.com/ansible/ansible.git)
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"
  # remove the resolvelib upper boundary (at least for < 0.9.0): https://github.com/ansible/ansible/pull/79399
  sed -e 's/resolvelib.*/resolvelib/' -i requirements.txt
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "${pkgdir}"/usr/share/doc/${pkgname}/
}
