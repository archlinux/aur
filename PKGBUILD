# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=('python2-django-icehouse')
_pkgname=python2-django
pkgver=1.6.7
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
makedepends=('python2' 'python2-setuptools')
source=("https://www.djangoproject.com/m/releases/${pkgver:0:3}/Django-$pkgver.tar.gz")
md5sums=('f31e2f953feb258e3569e962790630b6')
sha256sums=('9a64211c96a3262bb2545acc82af5d8f3da0175299f7c7e901e4ed455be965fb')

prepare() {
  cp -a "$srcdir/Django-$pkgver" "$srcdir/Django-$pkgver-python2"

  find "$srcdir/Django-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/Django-$pkgver-python2"
  python2 setup.py build
}

package() {
  depends=('python2')
  optdepends=('mysql-python: for MySQL backend'
              'python2-psycopg2: for PostgreSQL backend')
  replaces=('django')
  provides=('python2-django')
  conflicts=('django' 'python2-django')
  cd "$srcdir/Django-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin2.py
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
