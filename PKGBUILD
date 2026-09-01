# Maintainer: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes-git
pkgver=1.2.2.r4969.8bb70710d
pkgrel=2
pkgdesc=""
arch=('any')
url="https://github.com/TandoorRecipes/recipes"
license=('GPL')
groups=()
depends=('python313' 'postgresql' 'postgresql-libs')
makedepends=('git' 'nodejs' 'yarn')
optdepends=('nginx: reverse proxy')
provides=("tandoor-recipes")
conflicts=("tandoor-recipes")
replaces=()
backup=(
    'etc/tandoor/tandoor.conf'
    'etc/nginx/sites-available/tandoor.conf'
)
options=(!strip)
install=tandoor.install
source=(
	'git+https://github.com/TandoorRecipes/recipes.git' 
	'tandoor.service'
	'tandoor.socket'
	'tandoor-sysuser.conf'
	'tandoor-directory.conf'
    'tandoor-nginx.conf'
)
noextract=()
sha1sums=(
    'SKIP' 
    '2b4fe62b9458512b37e3a44f4e50eaa271677e90'
    'b564ef5c07d98c9983cb891e1e974dbf678e5c73'
    '431a88a4ab33ec118961d80c00e3a5944d2c5691'
    '3eabdaaeba5d356f7d7e4b47680a1e0864249b7f'
    '8d1d8d9a3cf6963cf7eb145d25a3d724479a89c2'
)

pkgver() {
	cd "$srcdir/recipes"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/recipes/vue3"
	yarn --cache-folder "$srcdir/yarn-cache" --ignore-engines install 
	yarn --cache-folder "$srcdir/yarn-cache" build
}


package() {
	cd "$srcdir"
	python3.13 -m venv "$pkgdir/usr/share/tandoor/venv"
	source "$pkgdir/usr/share/tandoor/venv/bin/activate"
	pip install --isolated --require-virtualenv --cache-dir "$srcdir/pip-cache" --disable-pip-version-check -r "$srcdir/recipes/requirements.txt"
	find "$pkgdir/usr/share/tandoor/venv" -name __pycache__ -type d -exec rm -rf {} +
	find "$pkgdir/usr/share/tandoor/venv/bin" -type f -exec sed -i "s|$pkgdir||g" {} \;

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" tandoor.service tandoor.socket
	install -Dm644 tandoor-sysuser.conf "$pkgdir/usr/lib/sysusers.d/tandoor.conf"
	install -Dm644 tandoor-directory.conf "$pkgdir/usr/lib/tmpfiles.d/tandoor.conf"
	install -Dm644 tandoor-nginx.conf "$pkgdir/etc/nginx/sites-available/tandoor.conf"

	cd recipes
	install -Dm644 .env.template "$pkgdir/etc/tandoor/tandoor.conf"
	mkdir -p "$pkgdir/usr/share/tandoor"
	rm -rf "$srcdir/recipes/vue3/node_modules/.cache"
	cp -r manage.py vue3 recipes cookbook "$pkgdir/usr/share/tandoor"
}
