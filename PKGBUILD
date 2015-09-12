# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgbase=yara-git
pkgname=('yara-git' 'python-yara-git' 'python2-yara-git')
pkgver=3.4.0
pkgrel=1
pkgdesc="Tool aimed at helping malware researchers to identify and classify malware samples"
url="https://plusvic.github.io/yara/"
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=(${pkgbase}::git+https://github.com/plusvic/${pkgbase})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgbase}
  autoreconf --force --install
  ./configure --prefix=/usr --with-crypto
  make
}

package_yara() {
  depends=('openssl')
  provides=('yara')
  conflicts=('yara')
  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
}

package_python-yara() {
  depends=('python' 'yara' 'openssl')
  provides=('python-yara')
  conflicts=('python-yara')
  cd ${pkgbase}/${pkgbase}-python
  python setup.py install --root="${pkgdir}" -O1
}

package_python2-yara() {
  depends=('python2' 'yara' 'openssl')
  provides=('python2-yara')
  conflicts=('python2-yara')
  cd ${pkgbase}-${pkgver}/${pkgbase}-python
  python2 setup.py install --root="${pkgdir}" -O1
}

# vim: ts=2 sw=2 et:
