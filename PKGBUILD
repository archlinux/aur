# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Neal Gompa <ngompa13@gmail.com>

# Fedora spec: https://src.fedoraproject.org/rpms/pagure/blob/master/f/pagure.spec
# OpenSUSE spec: https://build.opensuse.org/package/view_file/openSUSE:Factory/pagure/pagure.spec?expand=1
# Mageia spec: http://svnweb.mageia.org/packages/cauldron/pagure/current/SPECS/pagure.spec?view=markup

pkgbase=pagure
pkgname=("$pkgbase" "$pkgbase-apache" "$pkgbase-mariadb" "$pkgbase-postgresql" "$pkgbase-sqlite")
pkgver=5.9.1
pkgrel=0.20
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
optdepends=('clamav: Scan uploaded attachments')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("https://releases.pagure.org/$pkgbase/$pkgbase-$pkgver.tar.gz"
        "https://src.fedoraproject.org/rpms/pagure/raw/master/f/0501-Revert-Add-a-upper-limit-to-sqlalchemy.patch")
sha256sums=('ad4938975b202eee30098d112b250309d2690194099bc59f3f6d9d7069b78d3c'
            'c1da9e6ae2255f7896920ecb261f18c59f8ad6ba5726a8484f6287ae3962c854')
_homedir="/var/lib/$pkgbase"
_user=$pkgbase

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 < "../${source[1]##*/}"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    sed -i -e "s#/usr/lib/pythonX.Y/site-packages#$site_packages#" \
           -e 's/#//' \
           -e '/!mod_authz/,+4d' \
           -e '/# Apache 2.4/d' \
           -e "s#/path/to/git/repositorios#$_homedir#g" \
           -e "s/=git/=$_user/g" \
        files/pagure.conf
    sed -i -e "/^#DB_URL/d;/^DB_URL/s/^.*$/execdir('pagure_database.cfg')/" \
        files/pagure.cfg.sample
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
    depends=("$pkgbase-database=$pkgver")
    optdepends=("$pkgbase-apache: Apache host configuration files")
    backup=("etc/$pkgbase/alembic.ini"
             "etc/$pkgbase/pagure.cfg")
    cd "$pkgbase-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgbase/" {README,UPGRADING}.rst
    install -Dm644 -T "files/pagure.cfg.sample" "$pkgdir/etc/$pkgbase/pagure.cfg"
    install -Dm644 -t "$pkgdir/etc/$pkgbase/" "files/alembic.ini"
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/pagure_createdb.py" createdb.py
    install -Dm644 -t "$pkgdir/usr/share/$pkgbase/" files/{api_key_expire_mail,mirror_project_in}.py
    install -Dm755 -t "$pkgdir/usr/lib/$pkgbase/" files/{aclchecker,keyhelper}.py
    cp -r alembic "$pkgdir/usr/share/$pkgbase/"
    # TODO: package stuff in doc folder, needs building
}

package_pagure-apache() {
    pkgdesc+=" (Apache host configuration)"
    depends=("$pkgbase=$pkgver" 'apache' 'mod_wsgi')
    backup=("etc/httpd/conf/extra/$pkgbase.conf")
    cd "$pkgbase-$pkgver"
    install -Dm644 -t "$pkgdir/etc/httpd/conf/extra/" files/pagure.conf
    install -Dm644 -t "$pkgdir/usr/lib/$pkgbase/" files/{doc_,}pagure.wsgi
}

package_pagure-mariadb() {
    pkgdesc+=" (MariaDB database configuration)"
    depends=("$pkgbase=$pkgver" 'mariadb' 'python-mysqlclient') # alternative: python-pymysql
    provides=("$pkgbase-database")
    conflicts=("$pkgbase-postgresql" "$pkgbase-sqlite")
    backup=("etc/$pkgbase/pagure_database.cfg")
    install="$pkgbase-mariadb.install"
    install -Dm600 <(echo "DB_URL = 'mysql://$_user:<password>@localhost/$pkgbase'") \
        "$pkgdir/etc/$pkgbase/pagure_database.cfg"
}

package_pagure-postgresql() {
    pkgdesc+=" (PostgreSQL database configuration)"
    depends=("$pkgbase=$pkgver" 'postgresql' 'python-psycopg2') # alternative: python-pg8000
    provides=("$pkgbase-database")
    conflicts=("$pkgbase-mariadb" "$pkgbase-sqlite")
    backup=("etc/$pkgbase/pagure_database.cfg")
    install="$pkgbase-postgresql.install"
    install -Dm600 <(echo "DB_URL = 'postgres://$_user:<password>@localhost/$pkgbase'") \
        "$pkgdir/etc/$pkgbase/pagure_database.cfg"
}

package_pagure-sqlite() {
    pkgdesc+=" (SQLite database configuration)"
    depends=("$pkgbase=$pkgver" 'sqlite')
    provides=("$pkgbase-database")
    conflicts=("$pkgbase-mariadb" "$pkgbase-postgresql")
    backup=("etc/$pkgbase/pagure_database.cfg")
    install="$pkgbase-sqlite.install"
    install -Dm600 <(echo "DB_URL = 'sqlite:///var/tmp/$pkgbase.sqlite'") \
        "$pkgdir/etc/$pkgbase/pagure_database.cfg"
}
