# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes
pkgver=1.5.18
pkgrel=1
pkgdesc="Application for managing recipes, planning meals, building shopping lists and much much more."
arch=('any')
url="https://github.com/TandoorRecipes/recipes"
license=('GPL')
groups=()
depends=('python-virtualenv')
makedepends=('nodejs' 'postgresql' 'postgresql-libs' 'python-virtualenv' 'yarn')
provides=("tandoor-recipes")
conflicts=("tandoor-recipes")
replaces=()
backup=(
    'etc/tandoor/tandoor.conf'
)
options=(!strip)
install=tandoor.install
source=("https://github.com/TandoorRecipes/recipes/archive/refs/tags/$pkgver.tar.gz"
	'tandoor.service'
	'tandoor-sysuser.conf'
	'tandoor-directory.conf'
)
sha1sums=('f88b748644c55812f08deedd41bd02bf6e0cc6bc'
          '2477c21bff44ed1051281dd66a6f13a296db11ca'
          '431a88a4ab33ec118961d80c00e3a5944d2c5691'
          '6072447d59acbc452b1e4dc5b0064c5ccafae97b')



build() {
	cd "$srcdir/recipes-$pkgver/vue"
	yarn --cache-folder "$srcdir/yarn-cache" --ignore-engines install 
	yarn --cache-folder "$srcdir/yarn-cache" build
}


package() {
	cd "$srcdir"
	python -m venv "$pkgdir/usr/share/tandoor/venv"
	source "$pkgdir/usr/share/tandoor/venv/bin/activate"
	pip install --isolated --require-virtualenv --cache-dir "$srcdir/pip-cache" --disable-pip-version-check -r "$srcdir/recipes-$pkgver/requirements.txt"
	find "$pkgdir/usr/share/tandoor/venv" -name __pycache__ -type d -exec rm -rf {} +
	find "$pkgdir/usr/share/tandoor/venv/bin" -type f -exec sed -i "s|$pkgdir||g" {} \;

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" tandoor.service
	install -Dm644 tandoor-sysuser.conf "$pkgdir/usr/lib/sysusers.d/tandoor.conf"
	install -Dm644 tandoor-directory.conf "$pkgdir/usr/lib/tmpfiles.d/tandoor.conf"

	cd recipes-$pkgver
	install -Dm644 .env.template "$pkgdir/etc/tandoor/tandoor.conf"
	mkdir -p "$pkgdir/usr/share/tandoor"
	rm -rf "$srcdir/recipes/vue/node_modules/.cache"
	cp -r manage.py vue recipes cookbook "$pkgdir/usr/share/tandoor"
}
