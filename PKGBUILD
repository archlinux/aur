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
pkgver=2.16.14
pkgrel=2
pkgdesc='Radically simple IT automation platform (legacy version with python 3.6 remote support)'
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
    "0001-do-not-pin-resolvelib.patch"
    "0002-add-3.13-as-supported-controller-version.patch"
    "0003-remove-crypt-related-tests.patch"
)
sha512sums=('6a375db9481be199b0bd1fd41ffc7631bd69cab1ebdacdb0a41f42cdba60ee4916a3eb4238fd865b5b75f4f32ba42a9ee073d56d6986ce3aecf27bb75f02898c'
            'eb39ca61e051e1c781ab302e26626cecb1b7f21952c506b3dffcbc90282a9c7e9f0ef58c3ba1f0eb9e0cc49925e14e3453e302f194931d2426363889ce513084'
            'f71d69e583f9eeda34013d109bb51a1fac04377184261185938f3fd6656644c8841c8163d03b6b4f27be0dde4eeb9639bef7d16ff8bf1855da48129b16c772eb'
            '9761f8bb4cf24d5f636a68f1a71d09710e96a0df6bd59ef102b516255544264c50217f6055f2b00bd1f10fdb6213754528df2c04cfe935c2f14d68289a67c648')
b2sums=('f1d6da6785d4ec19a9903042cb6f7bbedf6fc838f8e25a3dc82ac96f89d302130790a8e3f38bbaeb248e96319fb592192bb626275ef77b8917136894103129d0'
        '822b30e528877d630f0b1d01a739a5617fdc1ae74e3af29c605c5bc5571bcb650677fd0671e7279011289e35be82295a5bdc6b687a9918f0501f10ab22d082db'
        'ffe584c3fbd3d1e178064dfb2b8cdcc57470a2e1cb11825007c23d6d3a6b7d7ff42877c6bc07c7fa90f040d022589e4d6c6fcf5fda31d6e7d27593d62f32065b'
        'e97afc388000f8134744055ee03ae39d3a118425528fc189f15bfac32bb8ad3103a83f745dd4dc31e211d85bb05d3c81fc6ca2615e4698cf28db7252d48401c0')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 < ../0001-do-not-pin-resolvelib.patch
  patch -p1 < ../0002-add-3.13-as-supported-controller-version.patch
  patch -p1 < ../0003-remove-crypt-related-tests.patch
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
