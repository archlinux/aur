# Maintainer: envolution
# Contributor: mdaniels5757 <arch at mdaniels dot me>
# Contributor: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-commander
pkgver=16.11.22
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
  'python-requests>=2.30.0'
  'keeper-secrets-manager-core>=16.6.0'
  'python-aiortc'
  'python-protobuf>=3.19.0'
  'python-cryptography>=39.0.1'
  'python-pykeepass'
)
makedepends=(
  'python-installer'
  'python-build'
  'python-setuptools'
)
checkdepends=('python-ifaddr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('462a3d4f155bb3bcc91cdbeda1c998bbea3fa5e8371d0e87a7be59a0185635918f7d276aa7e44636a0be340aabf26eee72002cdc6968427b07bcdf8d15644b9e')

build() {
  cd "Commander-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "Commander-$pkgver"
  python -m pytest -s -v \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_add_enterprise_user \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_commands \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_report_commands \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_commands \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_quoting \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_vault_reports \
    --deselect=unit-tests/pam-tunnel/test_private_tunnel.py::TestPrivateTunnelEntrance::test_forward_data_to_tunnel_generic_exception
}

package() {
  cd "Commander-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
