# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Nicolas Quienot <niQo@aur>
# Contributor: Jesse Young <jesse.young@gmail.com>
# Contributor: Anton Eliasson <devel@antoneliasson.se>

pkgbase=pypy-httplib2
pkgname=(pypy-httplib2 pypy3-httplib2)
pkgver=0.9.2
pkgrel=1
pkgdesc='Comprehensive HTTP client library, supporting many features (build for pypy)'
url='https://github.com/jcgregorio/httplib2'
license=('MIT')
arch=('any')
makedepends=('pypy-setuptools' 'pypy3-setuptools' 'git')
depends=('ca-certificates')
provides=('httplib2') # Should I get rid of this?
replaces=('httplib2') # Or this?
source=("git://github.com/jcgregorio/httplib2.git#tag=$pkgver"
        'ssl_hostname.patch'
        'cert.patch')
sha256sums=('SKIP'
            'd29fa108291a24f0708f04867f0479247ecbdd1fcf1617588b6650038d95554a'
            'ba05f491fd07afec6abc6bccb08369906f8e6f1a808d94a54fe4e7be7d9771d9')

prepare() {
  pushd "${pkgbase/pypy-}"

  # Patch, ref FS#36839
  patch -p1 -i "$srcdir/ssl_hostname.patch"

  # Patch, ref FS#40179
  patch -p1 -i "$srcdir/cert.patch"

  popd

  # Prepare one build directory for each package
  cp -a "${pkgbase/pypy-}" "${pkgname[0]}"
  cp -a "${pkgbase/pypy-}" "${pkgname[1]}"
}

package_pypy-httplib2() {
  depends=('pypy')

  cd "$pkgname"
  pypy setup.py install -O1 --root="$pkgdir" --prefix=/opt/pypy
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pypy3-httplib2() {
  depends=('pypy3')

  cd "$pkgname"
  pypy3 setup.py install -O1 --root="$pkgdir" --prefix=/opt/pypy3
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
