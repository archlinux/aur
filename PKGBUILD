# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=django
pkgver=1.3.1
pkgrel=2
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("http://media.djangoproject.com/releases/1.3/Django-$pkgver.tar.gz"
        diff-django_branches_releases_1.3.X-from-16771-to-17460.diff)
md5sums=('62d8642fd06b9a0bf8544178f8500767'
         'ea3d6cbde2fc2332ffe7f901cb60a974')
sha256sums=('af9118c4e8a063deb0b8cda901fcff2b805e7cf496c93fd43507163f3cde156b'
            '84e2652a8249e58fdbbd43bce7cd8d6bb2159058be6a675ebe15661ca3ee9ffc')

build() {
  cd "$srcdir/Django-$pkgver"
  patch -Np0 < ../diff-django_branches_releases_1.3.X-from-16771-to-17460.diff
  python2 setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/etc/bash_completion.d/django

  find "$pkgdir"/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
