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
pkgrel=3
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
    "0004-remove-ther-upper-bound-of-setuptools-version.patch"
)
sha512sums=('6a375db9481be199b0bd1fd41ffc7631bd69cab1ebdacdb0a41f42cdba60ee4916a3eb4238fd865b5b75f4f32ba42a9ee073d56d6986ce3aecf27bb75f02898c'
            '0b5780f3d0cc2a74e92309beb3360779c49e4312b17c9004942789ac7153f09561d441170255b502b4a8299b097baef01a91cdac41f5a93acc9ba370acdb8c4b'
            'bebff668cb1425032ea8fb945e68a3e6ba652db28203479fab79a87313d9c1ea72f611f10a3b9e9aedea58b84145ed958378151d047621e9edb5383c8061792b'
            'd7929a11f0d90ffce5542555dc90b51c6f06c1461c017990a649daddbaf2958f084c6ac2784e40b189c2c4fb7403c4aa7a9b2337f67bf53c5cd32b0199b68021'
            'f1b7778361a00e3d4d09e691ae795af318e2b75ffffa63530ddda139f65307ce4b1884a21e6fddb4ba9f6b7da7930bf5501ff9adab57985b9e4087b08c8f15a2')
b2sums=('f1d6da6785d4ec19a9903042cb6f7bbedf6fc838f8e25a3dc82ac96f89d302130790a8e3f38bbaeb248e96319fb592192bb626275ef77b8917136894103129d0'
        'eec00d58f9bf4c7aa8c29d342c84d71572954bd4b6699fb6e0773cf58bdb9d9deccded75cc29641ea40c2e5890bd1060616803d79d179ad072e3de34305f72e3'
        'a459463e9e8e0b84c8abca2ef82c77abb98821e41ba4144f09b779a6dd115338e3182e390e106fca5cedecc12e84e0783dbfda49d08b41004cbb93b5937be40a'
        'c38c51ee661444ae0e195594ec53b5f26ce5499f27c5abe30d5ee81ca0fe5d8d87216799f5fb5d1bb03ae2035adf8b0dfedebe3cb409221f2ead9f9cf3055571'
        '145228c67675ec9bdc591889bd8baf2bbd03971d0b510518380cf4fb5cc164aaab4647c8aec3f5ca5f4279b573ae934f243a107b4346f9c13e61637516d48591')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 < ../0001-do-not-pin-resolvelib.patch
  patch -p1 < ../0002-add-3.13-as-supported-controller-version.patch
  patch -p1 < ../0003-remove-crypt-related-tests.patch
  patch -p1 < ../0004-remove-ther-upper-bound-of-setuptools-version.patch
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
