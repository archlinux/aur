# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=webledger
_pkgname=${pkgname#web}
provides=(${_pkgname})
pkgver=2.1.7
pkgrel=1
pkgdesc="Web based ledger system"
arch=("any")
url="https://github.com/jnphilipp/ledger"
license=("GPL3+")
makedepends=("git" "help2man" "python" "python-virtualenv")
depends=("python" "python-django" "python-gobject" "python-dbus" "systemd" "uwsgi" "uwsgi-plugin-python")
source=("git+https://github.com/jnphilipp/ledger.git"
        "git+https://github.com/jnphilipp/django_bootstrap5.git")
md5sums=(SKIP SKIP)

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.django-bootstrap5.url $srcdir/django-bootstrap5
  git submodule update
}

check() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "$srcdir/$_pkgname"
    git checkout $pkgver
    make clean
    make venv PYTHON_LIB_DIR=$site_packages
    make test
}

package() {
    cd "$srcdir/$_pkgname"
    git checkout $pkgver
    make install DEST_DIR=$pkgdir
}
