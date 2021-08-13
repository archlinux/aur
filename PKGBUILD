# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

_pkgname=atoml
pkgname=python-atoml
pkgver=1.0.3
pkgrel=1
pkgdesc="Yet another style-preserving TOML library for Python."
arch=('any')
url="https://pdm.fming.dev/"
license=('MIT')
makedepends=("python-pip")
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-py3-none-any.whl")
sha512sums=('7e131dc4d90da83d80a200683e766efdac42b83725f576e9661386cdf37f1c3b04eca11325b8d439aac88bb0dbfcfc6e7cc2b769ca8a9d07825ec8b6b1c08c5f')

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
  python -O -m compileall -j "$(nproc)" -s "$pkgdir" "$pkgdir/usr/lib/python3.9/site-packages/"
  rm -rf "$pkgdir/usr/lib/python3.9/site-packages/${_pkgname//-/_}-$pkgver.dist-info/direct_url.json" || true
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
