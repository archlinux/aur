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
pkgver=r55169.0c7dcb65cff
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://github.com/ansible/ansible'
license=('GPL3')
depends=('python' 'python-pyyaml' 'python-paramiko' 'python-jinja' 'python-resolvelib' 'python-typing_extensions')
provides=('ansible-core' 'python-ansible')
replaces=('ansible-core' 'python-ansible')
conflicts=('ansible-core' 'python-ansible')
# checkdepends=('git'
#               'openssh'
#               'python-bcrypt'
#               'python-botocore'
#               'python-passlib'
#               'python-pexpect'
#               'python-pytest'
#               'python-pytest-mock'
#               'python-pytest-xdist'
#               'python-pytest-forked'
#               'python-pywinrm'
#               'python-voluptuous'
# )
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
        'relax_strict_dependencies_upper_bound.patch')
sha512sums=('SKIP'
            '7b5364f9ea28bd8ed5d01a3fa43304e922a94946df1495874b4c0b58ea30da10f1c848f93f5e8e485497f3a23a5b0007705bdab2a854d76a9be528738615d0bd')

prepare() {
  cd "$pkgname"

  # Upstream is applying very strict upper bound version requirements for some dependencies (e.g. setuptools, wheel & resolvelib)
  # We relax those to avoid unexpected / unnecessary build failures
  patch -Np1 < "${srcdir}/relax_strict_dependencies_upper_bound.patch"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  python -m build --wheel --no-isolation
  python packaging/cli-doc/build.py man --output-dir man
}

# check() {
#   local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#
#   # tests require upstream wrapper to find ansible-core internals: https://github.com/ansible/ansible/issues/80472
#   cd "${pkgname}"
#   # we do not have libselinux packaged
#   rm -v test/units/module_utils/basic/test_selinux.py
#   bin/ansible-test units --python "${python_version}" --truncate 0
# }

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 man/ansible*1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 licenses/MIT-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT-license.txt"
  install -Dm 644 licenses/simplified_bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/simplified_bsd.txt"
}
