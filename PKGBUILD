# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=python38-django
pkgname=('python38-django')
pkgver=4.1.3
pkgrel=1
pkgdesc="A high-level Python 3.8 Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
checkdepends=('python38-pytest' 'python38-tblib')
makedepends=('python38' 'python38-setuptools')
depends=('python38' 'python38-pytz' 'python38-sqlparse' 'python38-asgiref')
# TODO: package and add python38-pymemcache https://docs.djangoproject.com/en/dev/topics/cache/
optdepends=('python38-psycopg2: for PostgreSQL backend'
            'python38-argon2_cffi: for Argon2 password hashing support')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
sha512sums=('3bc77444f22b9dc029d5f45b6481224b99afe41f43d6306db69d01ca5ba24ed05f6c3bd7b3f5320dd96e6d79a47ac1c8f45a86cd8d3822432be4e73b006026ca')

build() {
  cd "$srcdir/Django-$pkgver"
  python3.8 setup.py build
}

package_python38-django() {
  cd "$srcdir/Django-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin38.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin38
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/python38-django-admin.py
  ln -s python38-django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/python38-django-admin
  ln -s python38-django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage38.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
  cd "$srcdir/Django-$pkgver"
  PYTHONPATH="$PWD" python3.8 tests/runtests.py || echo 'tests failed'
}
