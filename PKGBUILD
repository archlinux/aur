# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=4.6
pkgrel=2
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64' 'i686' 'aarch64')
url="http://www.pyinstaller.org"
license=('custom:PyInstaller')
depends=('python-altgraph' 'pyinstaller-hooks-contrib')
makedepends=("python-pip")
optdepends=('python-pycrypto: bytecode encryption support'
  'upx: executable compression support')
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_py="py3"
_py_hosted_url="https://files.pythonhosted.org/packages/$_py"
_pkg_whlname_prefix="$_pkgname_underscored-$pkgver-$_py-none-manylinux2014"
_pkg_whlname_x86_64="${_pkg_whlname_prefix}_x86_64.whl"
_pkg_whlname_i686="${_pkg_whlname_prefix}_i686.whl"
_pkg_whlname_aarch64="${_pkg_whlname_prefix}_aarch64.whl"
source_x86_64=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_x86_64")
source_i686=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_i686")
source_aarch64=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_aarch64")
sha512sums_x86_64=('64ef287114fa740d4c248d1afe38a92179b340e2782bd42f3bbe5206d007d1b1b5af2503fb5aa00611e65dbb4954a6f507aec183ef84342f70eda8947503f5e0')
sha512sums_i686=('7a10c611edd1d0d76666e5a6d8f548ef7c75c4bf193e18d5de9ef0d05ba09ec88cbcc19b356e7d93f96a3816948fc341b6d235f8204261eee6adcc610b247099')
sha512sums_aarch64=('1593b3aa24c4cbb4834d98574296b8a3c73839fc8548df3f9e675adbc39de0820f2c38f76a590e9ddf0c8616c84e5a524d45b24194f5121f216839364d1b7bbb')

package() {
  cd "$srcdir" || exit
  PIP_CONFIG_FILE=/dev/null pip install \
    --root="$pkgdir" \
    --isolated \
    --ignore-installed \
    --no-deps \
    --no-compile \
    --no-warn-script-location \
    "${_pkg_whlname_prefix}_${CARCH}.whl"
  python -O -m compileall -s "$pkgdir" "$pkgdir/usr/lib/"
  mapfile -t direct_url_file < <(find "$pkgdir"/usr/lib -type f -name 'direct_url.json')
  rm -rvf "${direct_url_file[@]}" || true
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
