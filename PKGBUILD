# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap.bitmask
pkgname=bitmask_client
pkgver=0.9.1
pkgrel=6
pkgdesc='Encrypted communication for mere mortals.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'desktop-file-utils'
  'xdg-utils'
  'python2-argh'
  'python2-requests'
  'python2-srp'
  'python2-pyopenssl'
  'python2-coloredlogs'
  'python2-psutil'
  'python2-ipaddr'
  'python2-twisted'
  'python2-daemon16'
  'python2-keyring'
  'python2-zope-proxy'
  'python2-pyzmq'
  'python2-txzmq'
  'python2-oauth'
  'python2-logbook'
  'python2-pyside'
  'python2-leap_soledad_client'
  'python2-leap_keymanager'
  'python2-leap_mail'
  'python2-leap_pycommon'
)
makedepends=(
  'python2-docutils'
  'python-pyside-tools'
)
# Disable tests for now as they fail
#checkdepends=(
  #'python2-nose'
  #'python2-nose-exclude'
  #'python2-mock'
  #'python2-coverage'
  #'python2-pep8'
  #'python2-flake8'
  #'python2-tox'
#)
source=(
  "https://github.com/leapcode/$pkgname/archive/$pkgver.tar.gz"
  "https://github.com/leapcode/$pkgname/archive/debian/experimental.zip"
)
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('7e907adeef60c61378c505d29f69d1cf777495215b356ce7ea3b0dc2b5c70dab'
            '3e5678ff608aca5ee034584014e0e4ae8a539c70d453949d322c138ba48a5cea')

prepare() {
  # Workaround version acquire fail
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/$_srcname-$pkgver"

  cd "$srcdir/$_srcname-$pkgver"
  # Install to /usr/bin instead of /usr/sbin
  sed -i 's/sbin/bin/' setup.py

  # Point the tests to python2 executables
  #sed -i 's/\/bin\/nosetests/\/bin\/nosetests2/' run_tests.sh
  #sed -i 's/flake8/flake8-python2/' run_tests.sh
}

build() {
  cd "$srcdir/$_srcname-$pkgver"
  # Qt
  make
  # Python
  python2 setup.py build

  cd "$srcdir/$pkgname-debian-experimental/docs/man"
  rst2man2 bitmask.1.rst      bitmask.1
  rst2man2 bitmask-root.1.rst bitmask-root.1
}

#check() {
  #cd "$srcdir/$_srcname-$pkgver"
  #sh run_tests.sh -N
#}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"      AUTHORS\
                                                              CHANGELOG.rst\
                                                              README.rst

  cd "$srcdir/$pkgname-debian-experimental"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps"      debian/bitmask.xpm
  install -Dm644 -t "${pkgdir}/usr/share/applications" debian/bitmask.desktop

  install -Dm644 -t "${pkgdir}/usr/share/man/man1" docs/man/bitmask.1 \
                                                   docs/man/bitmask-root.1

  for i in 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/$i/apps/" \
                      debian/icons/hicolor/$i/apps/bitmask.png
  done
}

# vim:set ts=2 sw=2 et:
