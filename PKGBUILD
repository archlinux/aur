# Maintainer: Lorenz Steinert <aur@uraziel.de>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Jérôme de Courval <decje9@gmail.com>
pkgname=tandoor-recipes
pkgver=2.3.0
pkgrel=3
pkgdesc="Application for managing recipes, planning meals, building shopping lists and much much more."
arch=('any')
url="https://github.com/TandoorRecipes/recipes"
license=('GPL')
groups=()
depends=('python-virtualenv')
makedepends=('nodejs' 'python-virtualenv' 'yarn')
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
	'tandoor.socket'
	'tandoor-sysuser.conf'
	'tandoor-directory.conf'
)
sha512sums=(
  '45356f2e2651b2f584ecd963d5ced6ac539646f5ba767284a277de08281c3c36126278789d982db641822885cf72fd2e511ed72f818c80d584b7156866120a94'
  '95dae7231412d20007f949536731dad9a95d82d208aa409698bf0ee81a5921fa893584747d2e0881eeb640198fb3c657447179707e27b0b0b6da1e15e06ceca0'
  '51e62f35632d709398bac39c11afcf452200a9ccfe55be5d0e6cf7f5f164a9bbd6bca0faebf3eb544017943e5d4597513ca0dfa0ee88de765b2f1b202341316c'
  '45fdbf45419a8619a5c04cb3c1327a57d080418a86596eac80da73bce13e4404595383bc1e77e21b86678d398c0c024fe06c4640219d23a39d945b0628bf8379'
  'feb8d5f02fa92d030ebb36aff15151e40e274b16e7d883ffee1aed92fe9546b3422aa584105aa05781623a7fddfda6d21898fb272f5a3e640ee5590f482fca19'
)



build() {
	cd "$srcdir/recipes-$pkgver/vue3"
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

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" tandoor.service tandoor.socket
	install -Dm644 tandoor-sysuser.conf "$pkgdir/usr/lib/sysusers.d/tandoor.conf"
	install -Dm644 tandoor-directory.conf "$pkgdir/usr/lib/tmpfiles.d/tandoor.conf"

	cd recipes-$pkgver
	install -Dm644 .env.template "$pkgdir/etc/tandoor/tandoor.conf"
	mkdir -p "$pkgdir/usr/share/tandoor"
	rm -rf "$srcdir/recipes/vue3/node_modules/.cache"
	cp -r manage.py vue3 recipes cookbook "$pkgdir/usr/share/tandoor"
}
