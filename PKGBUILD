# Maintainer: Sam  <dev at samarthj dot com>
# Contributor: Renato Caldas <renato@calgera.com>

# shellcheck disable=2034,2148,2154

_pkgname=pdm
pkgname=python-pdm
pkgver=1.8.0
pkgrel=2
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
sha512sums=('401fe69ccdfae3de052c3b9d1efd78a81fc864341c97373cd4a3c37cba027b129e2aed88f771c5c72330076744250b71b5f31fe56e098ec46cc0ab84cfad735f')

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
  python -O -m compileall -j "$(nproc)" -s "$pkgdir" "$pkgdir/usr/lib/"
  mapfile -t direct_url_file < <(find "$pkgdir"/usr/lib -type f -name 'direct_url.json')
  rm -rvf "${direct_url_file[@]}" || true
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
