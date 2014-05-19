# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django' 'python2-django')
pkgver=1.6.5
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=("https://www.djangoproject.com/m/releases/${pkgver:0:3}/Django-$pkgver.tar.gz")
md5sums=('e4c5b2d35ecb3807317713afa70a0c77')
sha256sums=('36940268c087fede32d3f5887cce9af9e5d27962a0c405aacafc2a3cc1f755c5')

build() {
  cd "$srcdir/Django-$pkgver"
  python2 setup.py build
}

package_python-django() {
  depends=('python')
  optdepends=('python-psycopg2: for PostgreSQL backend')
  cd "$srcdir/Django-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin3.py
  sed -i -e "s/django-admin.py/django-admin3.py/g" \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin3.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-django() {
  depends=('python2')
  optdepends=('mysql-python: for MySQL backend'
              'python2-psycopg2: for PostgreSQL backend')
  replaces=('django')
  conflicts=('django')
  cd "$srcdir/Django-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin2.py
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  find "$pkgdir"/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
