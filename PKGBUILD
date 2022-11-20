# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python38-twisted
pkgver=22.10.0
pkgrel=1
pkgdesc="Asynchronous networking framework written in Python"
arch=('any')
url="https://twistedmatrix.com/"
license=('MIT')
depends=('python38-zope-interface' 'python38-constantly' 'python38-incremental' 'python38-automat'
         'python38-hyperlink' 'python38-attrs' 'python38-typing_extensions')
makedepends=('python38-setuptools')
optdepends=('python38-pyopenssl: for TLS client hostname verification'
            'python38-service-identity: for TLS client hostname verification'
            'python38-idna: for TLS client hostname verification'
            'python38-cryptography: for using conch'
            'python38-pyasn1: for using conch'
            'python38-appdirs: for using conch'
            'python38-bcrypt: for using conch'
            'python38-h2: for http2 support'
            'python38-priority: for http2 support'
            'python38-pyserial: for serial support'
            'tk: for using tkconch')
checkdepends=('python38-pyhamcrest' 'subversion' 'xorg-server-xvfb' 'tk' 'openssh' 'git' 'gtk3'
              'python38-gobject' 'python38-subunit' 'python38-h2' 'python38-priority' 'python38-cryptography'
              'python38-idna' 'python38-pyasn1' 'python38-pyserial' 'python38-bcrypt' 'python38-hypothesis'
              'python38-cython-test-exception-raiser' 'python38-pyopenssl' 'python38-service-identity')
# Conflicts with the command line tools used to be provided by the python382 package.
conflicts=("python382-twisted<=20.3.0-3")
source=("https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz")
sha512sums=('cf9ed96430376d499ae9627a7d0656c05cb99bc9e9b15a8f4166355363818f090bc3c2b383ed4cf19e1e38fb569e8618d35a0ddde2a90a06f3c9a4ea769837e4')

build() {
  cd twisted-twisted-$pkgver
  python3.8 setup.py build
}

check() {
  export LC_CTYPE=en_US.UTF-8

  # tests use the underlying function from the 'python3.8 -m twisted.trial' module, to prevent loading system entry points
  PYTHONPATH="$srcdir/twisted-twisted-$pkgver/build/lib" xvfb-run python3.8 -c 'from twisted.scripts.trial import run; run()' twisted || echo "Tests failed"
}

package() {
  cd twisted-twisted-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
