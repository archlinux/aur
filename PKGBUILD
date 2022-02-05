# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=4.9
pkgrel=1
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
sha512sums_x86_64=('aa00e1b6a21450958aaf24f4c50574c7b1bb96da816f08cf53b0215bd8f2c909d2088170342c79be9363791dbafb3d2f93a2b47278b0e743d5c04158288440b7')
sha512sums_i686=('d5cd59c2ca54868933a546c8b3b6bd61878dbb9ae2f95fcad03e3f4f7d38d7c04b00d809134207da7dd22cae9954b042db41c81aa5ccd4bf052cfc85ae47ad00')
sha512sums_aarch64=('52d0df02dace3abe15bef7b5673a2bbd38bc33fc36c1ba2ea2e24b77fd54768c87a1a8a2737208a37bc18ad2989cf78361a1d68681d7519ae3e949a4fdaef7ac')

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
