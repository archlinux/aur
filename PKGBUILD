# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
pkgver=6.1.0
pkgrel=1
pkgdesc="reliable private and pypi.python.org caching server"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
depends=(
  'python>=3.6'
  'python-py>=1.4.23'
  'python-argon2_cffi'
  'python-appdirs'
  'python-attrs'
  'python-defusedxml'
  'devpi-common>=3.3.0'
  'devpi-common<4'
  'python-execnet>=1.2'
  'python-itsdangerous>=0.24'
  'python-passlib'
  'python-pluggy>=0.6.0'
  'python-pluggy<1.0'
  'python-pyramid>=2'
  'python-repoze.lru>=0.6'
  'python-ruamel-yaml'
  'python-waitress>=1.0.1'
  'python-strictyaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'devpi-server.service'
        'devpi-server.sysusers'
        'devpi-server.tmpfiles')
sha256sums=('2585e6355f5414458b4e64a7a9d7daa8167ece0f66469d63d80bb5728e0f6098'
            '1ebfe9edc2bf0f368162f15540e48a8e046db0023b5da23e98daf43f0e075a95'
            '4327d0e72b277ef7b05dfb4b3bac6ab4c70d55a96c9ad114a90ebb00c954bd48'
            'bcd2321ff41bebcf08392ca02dbfaa0ac2693eba3432f0e5793ff384753ce0f1')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  install -Dm 644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
