# Maintainer: Sam  <dev at samarthj dot com>
# Contributor: Renato Caldas <renato@calgera.com>

# shellcheck disable=2034,2148,2154

_pkgname=pdm
pkgname=python-pdm
pkgver=1.7.2
pkgrel=2
pkgdesc="A modern Python package manager with PEP 582 support."
arch=('any')
url="https://pdm.fming.dev/"
license=('MIT')

depends=(
  'python>=3.8'
  'python-appdirs'
  'python-atoml>=1.0.3'
  'python-click>7'
  'python-dotenv'
  'python-installer'
  'python-pep517'
  'python-pdm-pep517>=0.8'
  'python-pythonfinder'
  'python-resolvelib'
  'python-shellingham'
  'python-tomli>=1.1.0'
)
makedepends=("python-pip>=20.1")
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-py3-none-any.whl")
sha512sums=('bbcc42195cb955aef1b31ea8b200156d9bf13e6428cd39edd4d30cb03c6d0c9f69a04f99dbac2d5f2cdb21c633b1282b6c2ee55327b507f17c600b4fd72c8747')

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
