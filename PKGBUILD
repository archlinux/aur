# Maintainer: Lorenz Steinert <aur@uraziel.de>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes
pkgver=2.6.9
pkgrel=1
pkgdesc="Application for managing recipes, planning meals, building shopping lists and much much more."
arch=('any')
url="https://github.com/TandoorRecipes/recipes"
license=('GPL')
groups=()
depends=()
makedepends=('python-virtualenv' 'postgresql' 'postgresql-libs' 'nodejs' 'yarn')
provides=("tandoor-recipes")
conflicts=("tandoor-recipes")
replaces=()
backup=(
    'etc/tandoor/tandoor.conf'
)
options=(!strip)
install=tandoor.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TandoorRecipes/recipes/archive/refs/tags/$pkgver.tar.gz"
	'tandoor.service'
	'tandoor.socket'
	'tandoor-sysuser.conf'
	'tandoor-directory.conf'
)
sha512sums=('4001e79fe59525f527e425e20f8f6fd2447d64096ff6328acd81fec652665145c01de7426d647a4af0aacb681151cd2a1c806d085c5f11a7527cd9ebdfd3930a'
            '95dae7231412d20007f949536731dad9a95d82d208aa409698bf0ee81a5921fa893584747d2e0881eeb640198fb3c657447179707e27b0b0b6da1e15e06ceca0'
            '51e62f35632d709398bac39c11afcf452200a9ccfe55be5d0e6cf7f5f164a9bbd6bca0faebf3eb544017943e5d4597513ca0dfa0ee88de765b2f1b202341316c'
            '3c1314875b85244160ab7052258fdc4bb7637a1c43b85d62f4f2af2fa905c08ab76a7b2aca7c85e2fa02884f88bd6c7eb31796171cb38b3b77197c3d2ef8784e'
            '1ddd4ef1bff31bdb1b6ff1843207e0b05bdd613cab7e5eb66bae66687e8358acdfb451cfa5f0a581c5525aa9d63188bb64bab93c73ddff7bff2ace8c694fed63')



build() {
	cd "$srcdir/recipes-$pkgver/vue3"
	yarn --cache-folder "$srcdir/yarn-cache" --ignore-engines install 
	yarn --cache-folder "$srcdir/yarn-cache" build
}


package() {
	python -m venv "$pkgdir/usr/share/tandoor/venv"
	source "$pkgdir/usr/share/tandoor/venv/bin/activate"
	pip install --isolated --require-virtualenv --cache-dir "$srcdir/pip-cache" --disable-pip-version-check -r "$srcdir/recipes-$pkgver/requirements.txt"

	find "$pkgdir/usr/share/tandoor/venv" -name __pycache__ -type d -exec rm -rf {} +
	find "$pkgdir/usr/share/tandoor/venv" -type f -exec sed -i "s|$pkgdir||g" {} \;

	cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" tandoor.service tandoor.socket
	install -Dm644 tandoor-sysuser.conf "$pkgdir/usr/lib/sysusers.d/tandoor.conf"
	install -Dm644 tandoor-directory.conf "$pkgdir/usr/lib/tmpfiles.d/tandoor.conf"

	cd "$srcdir/recipes-$pkgver"
	install -Dm644 .env.template "$pkgdir/etc/tandoor/tandoor.conf"
	mkdir -p "$pkgdir/usr/share/tandoor"
	rm -rf "$srcdir/recipes/vue3/node_modules/.cache"
	cp -r manage.py vue3 recipes cookbook "$pkgdir/usr/share/tandoor"
}
