# Maintainer: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes-git
pkgver=1.2.2.r4132.c5fcfd07a
pkgrel=2
pkgdesc=""
arch=('any')
url="https://github.com/TandoorRecipes/recipes"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'nodejs' 'postgresql' 'postgresql-libs' 'python-virtualenv' 'nginx' 'yarn')
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
    '2477c21bff44ed1051281dd66a6f13a296db11ca'
    'b564ef5c07d98c9983cb891e1e974dbf678e5c73'
    '431a88a4ab33ec118961d80c00e3a5944d2c5691'
    '6072447d59acbc452b1e4dc5b0064c5ccafae97b'
    'd97eedbb1e58a98e3bd4c34ed124542e20758b80'
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
	python -m venv "$pkgdir/usr/share/tandoor/venv"
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
