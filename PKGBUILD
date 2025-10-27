# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Neal Gompa <ngompa13@gmail.com>

# Fedora spec: https://src.fedoraproject.org/rpms/pagure/blob/master/f/pagure.spec
# OpenSUSE spec: https://build.opensuse.org/package/view_file/openSUSE:Factory/pagure/pagure.spec?expand=1
# Mageia spec: http://svnweb.mageia.org/packages/cauldron/pagure/current/SPECS/pagure.spec?view=markup

pkgbase=pagure
pkgname=("$pkgbase" "$pkgbase-apache" "$pkgbase-mariadb" "$pkgbase-postgresql" "$pkgbase-sqlite")
pkgver=5.14.1
pkgrel=1
pkgdesc='A git-centered forge based on python using pygit2'
arch=(any)
url="https://pagure.io/$pkgbase"
license=(GPL-2.0-only)
_pydeps=(alembic
         arrow
         bcrypt
         binaryornot
         bleach
         blinker
         celery
         chardet
         cryptography
         docutils
         email-validator
         flask
         flask-wtf
         kitchen
         markdown
         munch
         pillow
         psutil
         pygit2
         openid
         openid-cla
         openid-teams
         redis
         requests
         six
         sqlalchemy
         straight.plugin
         wtforms)
depends=(git
         gitolite # This is technically optional, but our packaging assumes it
         libffi
         libgit2
         libjpeg
         python
         "${_pydeps[@]/#/python-}"
         redis)
optdepends=('clamav: Scan uploaded attachments')
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://pagure.io/pagure/archive/$pkgver/$_archive.tar.gz")
sha256sums=('4bdab80fb36b161cef6805dcadaa6db5513898e213ca15f9684be06d24b71a54')
_homedir="/var/lib/$pkgbase"
_user=$pkgbase

prepare() {
	cd "$_archive"
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	sed -i -e "s#/usr/lib/pythonX.Y/site-packages#$site_packages#" \
		-e 's/#//' \
		-e '/!mod_authz/,+4d' \
		-e '/# Apache 2.4/d' \
		-e "s#/path/to/git/repositorios#$_homedir#g" \
		-e "s/=git/=$_user/g" \
		files/pagure-apache-httpd.conf
	sed -i -e "/^#DB_URL/d;/^DB_URL/s/^.*$/execdir('pagure_database.cfg')/" \
		files/pagure.cfg.sample
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
}

package_pagure() {
	depends=("$pkgbase-database=$pkgver")
	optdepends=("$pkgbase-apache: Apache host configuration files")
	backup=("etc/$pkgbase/alembic.ini"
			"etc/$pkgbase/pagure.cfg")
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
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
	cd "$_archive"
	install -Dm644 -T "files/pagure-apache-httpd.conf" "$pkgdir/etc/httpd/conf/extra/$pkgbase.conf"
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
