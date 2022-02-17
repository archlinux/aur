# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-hooks-contrib
_pkgname=pyinstaller-hooks-contrib
pkgver=2022.2
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('custom:PyInstaller')
makedepends=("python-pip")
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_py="py2.py3"
_py_hosted_url="https://files.pythonhosted.org/packages/$_py"
_pkg_whlname="$_pkgname_underscored-$pkgver-$_py-none-any.whl"
source=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname")
sha512sums=('a54a511d84116740fb5c7e147712dff603c6f03984226eb817752ffc1c81aab0d74cf9d6b893f7a74ee40f316c09082a809679359aadc625336152fc9ee61b44')

package() {
  cd "$srcdir" || exit
  PIP_CONFIG_FILE=/dev/null pip install \
    --root="$pkgdir" \
    --isolated \
    --ignore-installed \
    --no-deps \
    --no-compile \
    --no-warn-script-location \
    "${_pkg_whlname}"
  python -O -m compileall -s "$pkgdir" "$pkgdir/usr/lib/"
  mapfile -t direct_url_file < <(find "$pkgdir"/usr/lib -type f -name 'direct_url.json')
  rm -rvf "${direct_url_file[@]}" || true
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE.GPL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL.txt"
  install -Dm644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE.APL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.APL.txt"
}
