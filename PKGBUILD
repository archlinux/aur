# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

# shellcheck disable=2034,2148,2154

pkgbase=pyexiftool
_pkgname=PyExifTool
pkgname='python-pyexiftool'
pkgver=0.4.11
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
sha512sums=('737a72850eeb5abd4f9cf89229dcac289411b777541c2b3c3abfa0b08c4c5896a01b8f69c0c7e232c42bffccd53b6fb0c8c8275d0afb15ec79e1a9e88bfea8a3')

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
