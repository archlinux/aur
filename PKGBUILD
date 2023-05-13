# Maintainer: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes-git
pkgver=1.2.2.r994.135640dd
pkgrel=1
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
backup=("etc/tandoor/tandoor.conf")
options=(!strip)
install=tandoor.install
source=(
	'git+https://github.com/TandoorRecipes/recipes.git' 
	'tandoor.service'
	'tandoor.socket'
	'tandoor-sysuser.conf'
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/recipes"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/recipes/vue"
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

	cd recipes
	install -Dm644 .env.template "$pkgdir/etc/tandoor/tandoor.conf"
	mkdir -p "$pkgdir/usr/share/tandoor"
	rm -rf "$srcdir/recipes/vue/node_modules/.cache"
	cp -r manage.py vue recipes cookbook "$pkgdir/usr/share/tandoor"

	# cd "$pkgdir/usr/share/tandoor"
	# export $(cat $srcdir/recipes/.env.template |grep "^[^#]" | xargs)
	# python manage.py collectstatic --no-input
	# python manage.py collectstatic_js_reverse
}
