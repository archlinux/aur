# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-dbbackup
pkgname=$_pkgname-git
pkgver=5.4.2.r0.gcf79a53
pkgrel=1
pkgdesc="Django management commands to back up and restore database and media files"
arch=("any")
url="https://github.com/Archmonger/django-dbbackup"
license=("BSD-3-Clause")
depends=("python" "python-django>=5.0")
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-hatchling"
)
checkdepends=(
	"python-pytest"
	"python-dotenv"
	"python-gnupg"
	"python-testfixtures"
	"python-psycopg2"
)
optdepends=(
	"python-gnupg: encrypted backups"
	"python-django-storages: remote storage backends"
	"python-psycopg2: PostgreSQL support"
	"python-mysqlclient: MySQL support"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	DJANGO_SETTINGS_MODULE=tests.settings python -m pytest -p no:django
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
