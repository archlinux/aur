# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=radicale
_pkgname=Radicale
pkgver=1.1.1
pkgrel=1
pkgdesc="A Simple Calendar Server"
arch=any
url="http://www.radicale.org/"
license=('GPL3')
depends=('python>=3.2')
makedepends=('python-setuptools')
backup=('etc/radicale/config')
install='radicale.install'
source=(
	http://pypi.python.org/packages/source/R/Radicale/Radicale-$pkgver.tar.gz
  radicale-$pkgver.patch
	radicale.service
  radicale.install
)
md5sums=('a29dd538377ea24cec83237a636122ae'
         '7d6a8ecdcb02f43780d106d8946338b3'
         '62af2e07ad32a0fcece32fae68e92daf'
         '5613eec93efc5ef2ef68abd124fb6b61')
optdepends=(
  'python-pam: For PAM authentication'
  'python-requests: For HTTP authentication'
  'python-ldap: For LDAP authentication'
  )

prepare() {
  cd $srcdir/$_pkgname-$pkgver

  patch -p1 < $startdir/$pkgname-$pkgver.patch
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -m644 -D "$srcdir/$_pkgname-$pkgver/config" "$pkgdir/etc/radicale/config"
  install -m644 -D "$srcdir/radicale.service" "$pkgdir/usr/lib/systemd/system/radicale.service"

  install -m644 -D "$srcdir/$_pkgname-$pkgver/radicale.fcgi" \
    "$pkgdir/usr/share/$pkgname/radicale.fcgi"
  install -m644 -D "$srcdir/$_pkgname-$pkgver/radicale.wsgi" \
    "$pkgdir/usr/share/$pkgname/radicale.wsgi"
}
