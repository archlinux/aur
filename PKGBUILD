# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=('python-django18')
pkgver=1.8.17
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
conflicts=('python-django')
makedepends=('python' 'python-setuptools')
optdepends=('python-psycopg2: for PostgreSQL backend')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
md5sums=('e76842cdfbcb31286bd44f51e087a04c')
sha256sums=('021bd648fcf454027063187e63a1ab4136c6929430ef5dfbe36235f60015eb07')

prepare() {
  cp -a "$srcdir/Django-$pkgver" "$srcdir/Django-$pkgver-python2"

  find "$srcdir/Django-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package() {
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
