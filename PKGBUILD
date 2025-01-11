# Maintainer: envolution
# Contributor: mdaniels5757 <arch at mdaniels dot me>
# Contributor: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-commander
pkgver=17.0.3
pkgrel=1
epoch=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
  'python-asciitree'
  'python-bcrypt'
  'python-colorama'
  'python-prompt_toolkit'
  'python-pycryptodomex'
  'python-pyperclip'
  'python-pysocks'
  'python-tabulate'
  'python-websockets'
  'python-fido2'
  'python-requests'
  'keeper-secrets-manager-core>=16.6.0'
  'python-aiortc'
  'python-protobuf'
  'python-cryptography'
  'python-pykeepass'
  'python-pydantic'
)
makedepends=(
  'python-installer'
  'python-build'
  'python-setuptools'
)
checkdepends=('python-ifaddr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5a4919cad39bdef436eb7a5393fd0a02dd4dc82f27b691861dc5f0b6bf728791236e0fceb9929fb57f116e9e7a7afca32c33960790e682e337469d4ea8ef8900')

build() {
  cd "Commander-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "Commander-$pkgver"
  python -m pytest -s -v -k \
    "not test_forward_data_to_tunnel_generic_exception and \
     not test_add_enterprise_user and \
     not test_commands and \
     not test_report_commands and \
     not test_quoting and \
     not test_vault_reports"
}

package() {
  cd "Commander-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
