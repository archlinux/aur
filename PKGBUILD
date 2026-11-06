# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=python-django-lts
pkgver=5.2.19
pkgrel=2
pkgdesc="A high-level Python web framework, long-term support release"
provides=("python-django=$pkgver")
conflicts=('python-django')
replaces=('python-django')
arch=('any')
license=('BSD-3-Clause')
url="https://www.djangoproject.com/"
makedepends=('python-installer')
depends=('python>=3.10' 'python-sqlparse>=0.3.1' 'python-asgiref>=3.8.1')
# TODO: package and add python-pymemcache https://docs.djangoproject.com/en/dev/topics/cache/
optdepends=('python-psycopg: for PostgreSQL backend'
            'python-psycopg2: for PostgreSQL backend'
            'python-argon2-cffi: for Argon2 password hashing support')
_wheel="django-$pkgver-py3-none-any.whl"
_distinfo="django-$pkgver.dist-info"
source=("https://files.pythonhosted.org/packages/py3/d/django/$_wheel"
        "django-$pkgver-bash-completion::https://raw.githubusercontent.com/django/django/$pkgver/extras/django_bash_completion")
noextract=("$_wheel")
sha256sums=('5965d974a5218a2b68a11dd1276434707f23886525c23f0598eccedaf4f4ca00'
            '7e8e23ce8be3c9f7e82900ddcf7938aa202c4fe42e87374f09ed25f9ba2013cf')

prepare() {
  bsdtar -xf "$srcdir/$_wheel" -C "$srcdir" "$_distinfo/licenses"
}

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"

  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 "$srcdir/django-$pkgver-bash-completion" \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/$_distinfo/licenses/"{LICENSE,LICENSE.python,AUTHORS}
}
