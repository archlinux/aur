# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
pkgver=6.2.0
pkgrel=1
pkgdesc="Python PyPi staging server and release tool"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
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
  'python-pluggy<2.0'
  'python-pyramid>=2'
  'python-repoze.lru>=0.6'
  'python-ruamel-yaml'
  'python-waitress>=1.0.1'
  'python-strictyaml')
makedepends=('python-setuptools')
optdepends=('devpi-client')
changelog=CHANGELOG
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  'devpi-server.service'
  'devpi-server.sysusers'
  'devpi-server.tmpfiles')
sha256sums=('f7f17d80097546d76aa4acfe54f1d86b93eafb681787e242cee3a6cfa0fad1b4'
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
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.rst AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
