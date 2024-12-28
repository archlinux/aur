# Maintainer: envolution
# Contributor: mdaniels5757 <arch at mdaniels dot me>
# Contributor: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-commander
pkgver=17.0.0
pkgrel=2
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
provides+=('python-keeper-dag' 'python-discovery-common')
conflicts+=('python-keeper-dag' 'python-discovery-common')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ed4c451154726cc9a40d39be85a5aefd715c226bfd3253facab53ec321a478fd9f3ef3639719524b957f4559e6972b7f6c97ff43bf413d044eeda077d2f93f48')

build() {
  cd "Commander-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "Commander-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  for whl in libs/*.whl; do
    test-env/bin/python -m installer "$whl"
  done
  test-env/bin/python -m pytest -s -v \
    --deselect=unit-tests/pam/test_private_tunnel.py::TestPrivateTunnelEntrance::test_forward_data_to_tunnel_generic_exception \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_add_enterprise_user \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_commands \
    --deselect=tests/test_enterprise_commands.py::TestEnterpriseCommands::test_report_commands \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_commands \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_quoting \
    --deselect=tests/test_vault_commands.py::TestConnectedCommands::test_vault_reports
}

package() {
  cd "Commander-$pkgver"
  for whl in libs/*.whl; do
    python -m installer --destdir="$pkgdir" "$whl"
  done
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
