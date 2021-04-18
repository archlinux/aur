# Maintainer: Roshless <pkg@roshless.com>

pkgname=nnrss
pkgver=1.3.1
pkgrel=2
pkgdesc='Web/API RSS aggregator'
url='https://git.roshless.me/~roshless/nnrss'
arch=('any')
license=('AGPL')
depends=('python-flask' 'python-sqlalchemy' 'python-werkzeug'
	 'python-feedparser' 'python-listparser' 'python-apscheduler'
	 'python-wtforms')
optdepends=('gunicorn: recommended WSGI server'
	    'python-psycopg2: connect to PostgreSQL database'
	    'sqlite: local file database')
makedepends=('python-setuptools')
install="$pkgname.install"
backup=("var/lib/$pkgname/config.ini")
source=("https://git.roshless.me/~roshless/$pkgname/archive/${pkgver}.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd $pkgname-$pkgver
  install -Dm644 "dist/config.ini" "$pkgdir/var/lib/$pkgname/config.ini"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('ff6dc4a3d49b07f1bb008dab66cfb81f'
         '85e39687367524c7b87bfb95571020bf'
         '8b9a147720fbe9f6c013f6aa7dbb8140'
         '364b51a829d7cf46a9557b97f8d3ce28')
