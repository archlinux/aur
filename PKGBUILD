# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

# shellcheck disable=2034,2148,2154

pkgbase=pyexiftool
_pkgname=PyExifTool
pkgname='python-pyexiftool'
pkgver=0.5.4
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
sha512sums=('b83607a01878506174b674be3be10773b12c5c674ba1fc1e1ca46ae7fcb037da3b4c4a99d1fafc4369a413cd472588f3109fe9c85d1c3607a58983e4249e1e46')

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
