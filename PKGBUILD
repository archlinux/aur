# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

# shellcheck disable=2034,2148,2154

pkgbase=pyexiftool
_pkgname=PyExifTool
pkgname='python-pyexiftool'
pkgver=0.5.0
pkgrel=1
pkgdesc="Library to communicate with an instance of ExifTool command-line application"
arch=('any')
url="https://github.com/sylikc/${pkgbase}"
license=("GPL3")
makedepends=("python-pip")
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_pkgurl="https://files.pythonhosted.org/packages/py3/$_pkgname_prefix/$_pkgname/$_pkgname_underscored-$pkgver-py3-none-any.whl"
source=("$_pkgurl")
sha512sums=('09267ee5e725ffd37cf2b2df46a83b1d4bdbd401096d4a9f24d5a8d4477e1e8678f164bfcd96fb73f873aef151933fe82859e6180b1a6dac1ea91bc87319f6c8')

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
