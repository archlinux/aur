# Maintainer: Nicholas Yang <nicolasyang243@proton.me>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris <seitz.christoph@gmail.com>
# Contributor: m0ikz <ndelatorre@moikz.com.ar>
# Contributor: atweiden <archbaum@gmail.com>

pkgname=ansible-core-2.16
_pkgname=ansible
pkgver=2.16.6
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://www.ansible.com'
license=('GPL-3.0-or-later AND BSD-2-Clause AND PSF-2.0 AND MIT AND Apache-2.0')
depends=(
  'python'
  'python-cryptography'
  'python-jinja'
  'python-packaging'
  'python-pyyaml'
  'python-resolvelib'
  # not directly required, but either convenient or indirectly required
  'python-paramiko'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-docutils'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'git'
  'openssh'
  'python-bcrypt'
  'python-botocore'
  'python-passlib'
  'python-pexpect'
  'python-pytest'
  'python-pytest-mock'
  'python-pytest-xdist'
  'python-pytest-forked'
  'python-pywinrm'
  'python-voluptuous'
)
optdepends=(
  'python-argcomplete: shell completions'
  'python-dnspython: for dig lookup'
  'python-jmespath: json_query support'
  'python-netaddr: for the ipaddr filter'
  'python-passlib: crypt values for vars_prompt'
  'python-pip: for module to manage Python libarary dependencies'
  'python-pywinrm: connect to Windows machines'
  'python-setuptools: for module to manage Python libarary dependencies'
  'python-systemd: for journald support'
  'sshpass: for ssh connections with password'
)
provides=('python-ansible' 'ansible-base' 'ansible-core')
conflicts=('ansible-core')
replaces=('ansible-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ansible/ansible/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5a9d50f098878f08211f205b776fcb109bc348d6a095bf6e502c1f06c2e148a711720cdbd656bf868f95e7afe2d701c25b5cbcbf1531906eb32f5abdca73fdd7')
b2sums=('8a6585749de09ff5b0846b67bbce492e049efbaffedc4f8c4a334a9a6ccc1522dba6273cc2272d1c5eed8e9d7f345013a65aa86ab466b053f27a6fcc08cea0c6')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  python packaging/cli-doc/build.py man --output-dir man
}

check() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  # tests require upstream wrapper to find ansible-core internals: https://github.com/ansible/ansible/issues/80472
  cd "${_pkgname}-${pkgver}"
  # we do not have libselinux packaged
  rm -v test/units/module_utils/basic/test_selinux.py
  bin/ansible-test units --python "${python_version}" --truncate 0
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 man/ansible*1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 licenses/MIT-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT-license.txt"
  install -Dm 644 licenses/simplified_bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/simplified_bsd.txt"
}
