
pkgname=python2-twisted
# Do not update. This is the last twisted version supporting Python2.
pkgver=20.3.0
pkgrel=5
pkgdesc="Asynchronous networking framework written in Python (20.3.0 is the last version supporting Python 2)"
arch=('x86_64')
url="https://twistedmatrix.com/"
license=('MIT')
depends=('python-twisted' 'python2-zope-interface' 'python2-service-identity'
         'python2-incremental' 'python2-constantly' 'python2-automat' 'python2-hyperlink'
         'python2-attrs' 'python2-pyhamcrest')
makedepends=('python2-setuptools')
optdepends=('python2-pyopenssl: for TLS client hostname verification'
            'python2-idna: for TLS client hostname verification'
            'python2-cryptography: for using conch'
            'python2-pyasn1: for using conch'
            'python2-appdirs: for using conch'
            'python2-bcrypt: for using conch'
            'python2-priority: for http2 support'
            'python2-pyserial: for serial support'
            'python2-soappy: for twisted.web.soap'
            'tk: for using tkconch')
source=("$pkgname-$pkgver.tar.gz::https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz")
sha512sums=('72307a0b9165d5f6b31f5563f4f76f9c759349d55f6dcaf43358eab3e8f1b2065e0b12c8ac43f14061ee17cb2d9b27f463bcb9e642750fb8e6e510e403bd2b06')

prepare() {
  sed -i 's:^#!.*bin.*python:#!/usr/bin/python2:' \
    twisted-twisted-$pkgver/src/twisted/mail/test/pop3testserver.py \
    twisted-twisted-$pkgver/src/twisted/trial/test/scripttest.py
}

build() {
  cd "$srcdir"/twisted-twisted-$pkgver
  python2 setup.py build
}

package() {
  cd twisted-twisted-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  # python-twisted already provides these command line tools.
  # Let's depend on python-twisted and rename the tools here so we don't conflict.
  for name in trial twistd twist ckeygen cftp conch pyhtmlizer tkconch mailmail; do
    mv "$pkgdir"/usr/bin/${name}{,2}
  done

  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
