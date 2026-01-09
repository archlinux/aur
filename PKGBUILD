# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
_pkgname=devpi_server
pkgver=6.17.0
pkgrel=1
pkgdesc="Python PyPi staging server and release tool"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'python>=3.9'
  'python-argon2_cffi'
  'python-attrs'
  'python-defusedxml'
  'devpi-common'
  'python-httpx'
  'python-itsdangerous'
  'python-lazy'
  'python-legacy-cgi'
  'python-passlib'
  'python-platformdirs'
  'python-pluggy'
  'python-py'
  'python-pyramid'
  'python-repoze.lru'
  'python-ruamel-yaml'
  'python-strictyaml'
  'python-waitress'
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('devpi-client')
changelog=CHANGELOG
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz"
  'devpi-server.service'
  'devpi-server.sysusers'
  'devpi-server.tmpfiles')
sha256sums=('b49a6b802512808001ddac078d42150d92820c5f676ad337eff21b89785e9e8e'
            '1ebfe9edc2bf0f368162f15540e48a8e046db0023b5da23e98daf43f0e075a95'
            '4327d0e72b277ef7b05dfb4b3bac6ab4c70d55a96c9ad114a90ebb00c954bd48'
            'bcd2321ff41bebcf08392ca02dbfaa0ac2693eba3432f0e5793ff384753ce0f1')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dvm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dvm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dvm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
