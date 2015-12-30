# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django17
pkgname=('python-django17' 'python2-django17')
pkgver=1.7.11
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design (Version 1.7)"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=("https://www.djangoproject.com/m/releases/${pkgver:0:3}/Django-$pkgver.tar.gz")
md5sums=('030b2f9c99a6e4e0418eadf7dba9e235')
sha256sums=('2039144fce8f1b603d03fa5a5643578df1ad007c4ed41a617f02a3943f7059a1')

prepare() {
  cp -a "$srcdir/Django-$pkgver" "$srcdir/Django-$pkgver-python2"

  find "$srcdir/Django-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build

  cd "$srcdir/Django-$pkgver-python2"
  python2 setup.py build
}

package_python-django17() {
  depends=('python' 'python-setuptools')
  optdepends=('python-psycopg2: for PostgreSQL backend')
  provides=("python-django=$pkgver")
  conflicts=('python-django')
  cd "$srcdir/Django-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-django17() {
  depends=('python2' 'python2-setuptools')
  optdepends=('mysql-python: for MySQL backend'
              'python2-psycopg2: for PostgreSQL backend')
  provides=("python2-django=$pkgver")
  conflicts=('django' 'python2-django')
  cd "$srcdir/Django-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/django-admin.py "$pkgdir"/usr/bin/django-admin2.py
  mv "$pkgdir"/usr/bin/django-admin "$pkgdir"/usr/bin/django-admin2
  # TODO: this probably won't work due to the `complete` command within not
  # knowing about modified our exectuable names
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin2.py
  ln -s django-admin2.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin2

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
