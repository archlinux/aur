# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=4.10
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
sha512sums_x86_64=('71b246c6d36480cf2036475f2a15a35c11de7f8c68b3245f97bb125700ab26fa4bc18e88a332ecd9087c67dcb0aac786abe20c05673d37916aa52bf167941960')
sha512sums_i686=('e5525f2a8713298bb93fb0ab65d7bf406e24c6433c2730399f4bbe86b014112452fb837bd7544434fd452c54224eedd281859fb890b8a4f946dcb47e0594a99c')
sha512sums_aarch64=('a7144c49960ad78366959052cff2dfe4b56bd871adf8c27113c7418cce5768344abca16c5906ab643630a230dc09d9c9c07a2dbcf99422b66817a2c146d2d7b5')

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
