# Maintainer: Sam  <dev at samarthj dot com>
# Contributor: Renato Caldas <renato@calgera.com>

# shellcheck disable=2034,2148,2154

_pkgname=pdm
pkgname=python-pdm
pkgver=1.10.0
pkgrel=3
pkgdesc="A modern Python package manager with PEP 582 support."
arch=("any")
url="https://pdm.fming.dev/"
license=("MIT")
depends=(
  "python>=3.8"
  "python-appdirs"
  "python-atoml>=1.0.3"
  "python-click>7"
  "python-dotenv"
  "python-installer"
  "python-pep517"
  "python-pdm-pep517>=0.8"
  "python-pythonfinder"
  "python-resolvelib"
  "python-shellingham"
  "python-tomli>=1.1.0"
)
makedepends=("python-pip>=20.1")
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_pkgurl="https://files.pythonhosted.org/packages/py3/$_pkgname_prefix/$_pkgname/$_pkgname_underscored-$pkgver-py3-none-any.whl"
source=("$_pkgurl")
sha512sums=('65e84e5c5431ce65368b07c9f40fc960adb5e4ae4f150b4774266d25dfe619ef24aff7150e11cdaf1ee9ca1a8a3e536d6d915208ced453376ba90a735d0859c9')

package() {
  cd "$srcdir" || exit
  PIP_CONFIG_FILE=/dev/null pip install \
    --root="$pkgdir" \
    --isolated \
    --ignore-installed \
    --no-deps \
    --no-compile \
    --no-warn-script-location \
    ${_pkgname//-/_}-$pkgver-py3-none-any.whl
  python -O -m compileall -s "$pkgdir" "$pkgdir/usr/lib/"
  mapfile -t direct_url_file < <(find "$pkgdir"/usr/lib -type f -name 'direct_url.json')
  rm -rvf "${direct_url_file[@]}" || true
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
