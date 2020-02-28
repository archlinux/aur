# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Fedora spec: https://src.fedoraproject.org/rpms/pagure/blob/master/f/pagure.spec
# OpenSUSE spec: https://build.opensuse.org/package/view_file/openSUSE:Factory/pagure/pagure.spec?expand=1
# Mageia spec: http://svnweb.mageia.org/packages/cauldron/pagure/current/SPECS/pagure.spec?view=markup

pkgname=pagure
pkgver=5.8.1
pkgrel=0.7
pkgdesc="A git-centered forge based on python using pygit2"
arch=("any")
url="https://pagure.io/$pkgname"
license=("GPL2")
_pydeps=('alembic'
         'arrow'
         'bcrypt'
         'binaryornot'
         'bleach'
         'blinker'
         'celery'
         'chardet'
         'cryptography'
         'docutils'
         'flask'
         'flask-wtf'
         'kitchen'
         'markdown'
         'munch'
         'pillow'
         'psutil'
         'pygit2'
         'openid'
         'openid-cla'
         'openid-teams'
         'redis'
         'requests'
         'six'
         'sqlalchemy'
         'straight.plugin'
         'wtforms')
depends=('git'
         'gitolite' # This is technically optional, but our packaging assumes it
         'libffi'
         'libgit2'
         'libjpeg'
         'python'
         "${_pydeps[@]/#/python-}"
         'redis')
makedepends=('python-setuptools')
checkdepends=('python-tox')
optdepends=('mariadb: MariaDB backend'
            'postgresql: PostgreSQL backend'
            'python-pg8000: Python driver for PostgreSQL'
            'python-psycopg2: Python driver for PostgreSQL'
            'python-mysqlclient: Python driver for MariaDB'
            'python-pymysql: Python driver for MariaDB')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://src.fedoraproject.org/rpms/pagure/raw/master/f/0501-Revert-Add-a-upper-limit-to-sqlalchemy.patch")
sha256sums=('5e150bad0a3f932d265cb59d46c8b6a532be0f757aab695a8c37df3f5f4db687'
            'c1da9e6ae2255f7896920ecb261f18c59f8ad6ba5726a8484f6287ae3962c854')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "../${source[1]##*/}"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    tox
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {README,UPGRADING}.rst
}
