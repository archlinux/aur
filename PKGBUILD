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
pkgver=r54896.aab732cb826
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://github.com/ansible/ansible'
license=('GPL3')
depends=('python' 'python-pyyaml' 'python-paramiko' 'python-jinja' 'python-resolvelib' 'python-typing_extensions')
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
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=($pkgname::git+https://github.com/ansible/ansible.git
        'relax_setuptools_version_requirements.patch')
sha512sums=('SKIP'
            'a1cc609a8020bb4dca0b6b4c0bb53a4ff0648b79a3e98334e2dbd9584abf565366040c8fe40bbe2c929aed2123565a8ceba22ed60ae5a2ba08e6a7e92ece703b')

prepare() {
  cd "$pkgname"

  # Temporary patch to allow building with latest setuptools
  # Currently, upstream has set the upper version version bound for it at `< 72.1.0`
  # See https://github.com/ansible/ansible/blob/devel/pyproject.toml#L2
  patch -Np1 < "${srcdir}/relax_setuptools_version_requirements.patch"
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
