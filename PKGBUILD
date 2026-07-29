# Maintainer: Lisa Magdalena Riedler <inventree.aur@riedler.wien>

pkgname=inventree-git
pkgver=1.4.2.18105
pkgrel=1
pkgdesc="Intuitive Inventory Management"
arch=('any')
url='https://inventree.org/'
license=('MIT')
depends=('python' 'pango' 'libjpeg-turbo' 'libwebp')
optdepends=(
	'python-psycopg: for PostgreSQL'
	'pgcli: for PostgreSQL'
	'python-mysqlclient: for MySQL'
	'python-mariadb-connector: for MySQL'
)
makedepends=('python-invoke' 'python-dotenv')
source=("git+https://github.com/inventree/inventree.git#branch=master"
        'fix-installer.patch'
        'config.yaml'
        'env.sh')
sha256sums=('SKIP'
            '37fcef1d112c92112d5e20f00567be34a759d9b590582be8c240fbdfeb302a22'
            '19f0779fcfceb9ed4f7b41c087a7f50d2fae0cc1e08e4dbb9962902785e1daf3'
            '2783d57f4f9f34c3b33395c78c8c926e9bd2a780e91e29bb92796424784d8c10')
provides=('inventree')
conflicts=('inventree')
backup=('var/opt/inventree/config/config.yaml' 'var/opt/inventree/.bashrc')
install=main.install

pkgver() {
	cd inventree
	printf "%s.%s" "$(git describe origin/stable --tags --abbrev=0)" "$(git rev-list --count HEAD)"
}

prepare() {
	cd inventree
	git apply -3 "$srcdir"/fix-installer.patch
}

build() {
	: # nothing to do, I think? we need $pkgdir for everything
}

package() {
	cd "$srcdir"
	install -d "$pkgdir"/opt/inventree
	cp -R inventree "$pkgdir"/opt/ # unfortunately install has no -R, so we're just using cp here
	install -Dm644 config.yaml "$pkgdir"/var/opt/inventree/config/config.yaml
	install -Dm644 env.sh "$pkgdir"/var/opt/inventree/.bashrc
}
