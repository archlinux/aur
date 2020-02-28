# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Fedora spec: https://src.fedoraproject.org/rpms/pagure/blob/master/f/pagure.spec
# OpenSUSE spec: https://build.opensuse.org/package/view_file/openSUSE:Factory/pagure/pagure.spec?expand=1
# Mageia spec: http://svnweb.mageia.org/packages/cauldron/pagure/current/SPECS/pagure.spec?view=markup

pkgbase=pagure
pkgname=("$pkgbase" "$pkgbase-apache" "$pkgbase-mariadb" "$pkgbase-postgresql" "$pkgbase-sqlite")
pkgver=5.8.1
pkgrel=0.17
pkgdesc="A git-centered forge based on python using pygit2"
arch=("any")
url="https://pagure.io/$pkgbase"
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
source=("https://releases.pagure.org/$pkgbase/$pkgbase-$pkgver.tar.gz"
        "https://src.fedoraproject.org/rpms/pagure/raw/master/f/0501-Revert-Add-a-upper-limit-to-sqlalchemy.patch")
sha256sums=('5e150bad0a3f932d265cb59d46c8b6a532be0f757aab695a8c37df3f5f4db687'
            'c1da9e6ae2255f7896920ecb261f18c59f8ad6ba5726a8484f6287ae3962c854')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 < "../${source[1]##*/}"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    sed -i -e "s#/usr/lib/pythonX.Y/site-packages#$site_packages#" files/pagure.conf
}

build() {
    cd "$pkgbase-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgbase-$pkgver"
    tox
}

package_pagure() {
    depends=("$pkgbase-backend=$pkgver")
    optdepends=("$pkgbase-apache: Apache host configuration files")
    backup=("etc/$pkgbase/alembic.ini"
             "etc/$pkgbase/pagure.cfg")
    cd "$pkgbase-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgbase/" {README,UPGRADING}.rst
    install -Dm644 -T "files/pagure.cfg.sample" "$pkgdir/etc/$pkgbase/pagure.cfg"
    install -Dm644 -t "$pkgdir/etc/$pkgbase/" "files/alembic.ini"
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/" files/{api_key_expire_mail,mirror_project_in}.py
    install -Dm755 -t "$pkgdir/usr/lib/$pkgbase/" files/{aclchecker,keyhelper}.py
    cp -r alembic "$pkgdir/usr/share/$pkgbase/"
}

package_pagure-apache() {
    pkgdesc+=" (Apache host configuration)"
    depends=("$pkgbase=$pkgver" 'apache')
    backup=("etc/httpd/conf/extra/$pkgbase.conf")
    cd "$pkgbase-$pkgver"
    install -Dm644 -t "$pkgdir/etc/httpd/conf/extra/" files/pagure.conf
}

package_pagure-mariadb() {
    pkgdesc+=" (MariaDB backend configuration)"
    depends=("$pkgbase=$pkgver" 'mariadb' 'python-mysqlclient') # alternative: python-pymysql
    provides=("$pkgbase-backend")
    conflicts=("$pkgbase-postgresql" "$pkgbase-sqlite")
    install="$pkgbase-mariadb.install"
    cd "$pkgbase-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/" createdb.py
}

package_pagure-postgresql() {
    pkgdesc+=" (PostgreSQL backend configuration)"
    depends=("$pkgbase=$pkgver" 'postgresql' 'python-psycopg2') # alternative: python-pg8000
    provides=("$pkgbase-backend")
    conflicts=("$pkgbase-mariadb" "$pkgbase-sqlite")
    install="$pkgbase-postgresql.install"
    cd "$pkgbase-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/" createdb.py
}

package_pagure-sqlite() {
    pkgdesc+=" (SQLite backend configuration)"
    depends=("$pkgbase=$pkgver" 'sqlite')
    provides=("$pkgbase-backend")
    conflicts=("$pkgbase-mariadb" "$pkgbase-postgresql")
    install="$pkgbase-sqlite.install"
    cd "$pkgbase-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/" createdb.py
}
