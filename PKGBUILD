# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

_pkgname=atoml
pkgname=python-atoml
pkgver=1.1.0
pkgrel=2
pkgdesc="Yet another style-preserving TOML library for Python."
arch=("any")
url="https://github.com/frostming/atoml.git"
license=("MIT")
makedepends=("python-pip")
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_pkgurl="https://files.pythonhosted.org/packages/py3/$_pkgname_prefix/$_pkgname/$_pkgname_underscored-$pkgver-py3-none-any.whl"
source=("$_pkgurl")
sha512sums=('37505f8a74a301c0d9f7bea686f48ac94d6fdd5b36a4ec2c132e069df65307439b9270624f7b629dbaab28ad3d58eeed83fb8fc52579683db3fb545ddf11aa9c')

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
