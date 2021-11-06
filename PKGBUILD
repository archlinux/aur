# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

# shellcheck disable=2034,2148,2154

pkgbase=pyexiftool
_pkgname=PyExifTool
pkgname='python-pyexiftool'
pkgver=0.4.9
pkgrel=2
pkgdesc="Library to communicate with an instance of ExifTool command-line application"
arch=('any')
url="https://github.com/sylikc/${pkgbase}"
license=("GPL3")
makedepends=("python-pip")
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_pkgurl="https://files.pythonhosted.org/packages/py3/$_pkgname_prefix/$_pkgname/$_pkgname_underscored-$pkgver-py3-none-any.whl"
source=("$_pkgurl")
sha512sums=('e2726009f5f8131507ad15af8c154ec1d40affcae34cc37d14df90f11f88d38b6104f1f58c1856f853091dc5318e70aa267badc2f1cf22302688ece43692cf2b')

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
