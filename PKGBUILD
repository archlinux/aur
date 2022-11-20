# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=python38-pycurl
pkgver=7.45.1
pkgrel=2
pkgdesc="A Python 3.x interface to libcurl"
arch=('x86_64')
url="http://pycurl.sourceforge.net/"
license=('LGPL' 'MIT')
depends=('python38' 'curl')
makedepends=('python38-setuptools')
checkdepends=('python38-bottle' 'python38-pytest' 'vsftpd' 'python38-flaky' 'python38-pyflakes')
source=("https://github.com/pycurl/pycurl/archive/REL_${pkgver//./_}/$pkgname-$pkgver.tar.gz")
sha512sums=('8b54b625d692d1f152a4e4ff29fbb8d66f51b5a657ab08e5493c6d4a9a7a1f58bb8407885d6a061ef64078db416e60d7f9a246c4a0e87f11d411cb706b96000d')

prepare() {
  mv pycurl-REL_${pkgver//./_} pycurl-$pkgver
}

build() {
  cd pycurl-$pkgver
  make
  python3.8 setup.py build
}

check() {
  export PYCURL_VSFTPD_PATH=vsftpd
  # We don't have HTTP2 enabled

  cd pycurl-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.10:$PYTHONPATH" make test || warning "Tests failed"
}

package() {
  cd pycurl-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  install -Dm644 COPYING-MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
}
