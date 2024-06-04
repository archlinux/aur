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
pkgver=2.16.7
pkgrel=2
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
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ansible/ansible/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/ansible/ansible/pull/83347.patch"
)
sha512sums=(
    '8c40d7631797d7bb8ee1ee2fae9c0233e9ba9ef14bb28e6a3f7653849daa1d91e487af2239bd783d3aa6a4531cd509d60fe641b2736ab3c2b8958f4385e7944e'
    'e999554b4aa8facfc03df800138451d1b72b2c04aa66bdeaf30be460d7db65b03e8be63346b74e10950d93b16c01ab3a477cb639dc62a34fb8c84a0d43911550'
)
b2sums=(
    'bc0abf83a00a9b506bee7e1eec9ec4a4c8ee399079bab5a05b479925046879b27d50d36eb1b27347694156cef611442c0173a5f94531efef373a534fa4272497'
    'd9ae25d9bb5bd1f901db9b3652defc46fd15dd7936189648079877e8ea627fee0636be4d2c1816cfff2dbecd6000c5e48b22f1ba43f1f6168a1c9a4a2b9f4af0'
)

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 < ../83347.patch
}

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
