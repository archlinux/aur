# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=stickerpicker
pkgname="$_pkgname-git"
pkgver=r100.4c13a2c
pkgrel=1
pkgdesc="Element sticker picker widget"
arch=(any)
url="https://github.com/maunium/$_pkgname"
license=('AGPL-3.0-or-later')
depends=(
	'python'
	'python-aiohttp'
	'python-cryptg'
	'python-magic'
	'python-pillow'
	'python-telethon'
	'python-yarl'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('nginx: reverse proxy example configuration')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	"stickerpicker.tmpfiles"
	"nginx.conf"
)
sha256sums=('SKIP'
	            '41df176c7557a0c632ed4c3b3473dc2660ccbb2fde3a4a14c2e40e52f5632902'
	            '0ae7588129d7d9cc594a41b3ec79a9bed2f7b7b23b3e815dde2860c053c28805')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	rm -rf build dist ./*.egg-info
	perl -0pi -e 's/from \.lib import matrix, util\n\n/from \.lib import matrix, util\n\nDEFAULT_CONFIG_FILE = "\/etc\/webapps\/stickerpicker\/config.json"\nDEFAULT_PACK_DIR = "\/var\/lib\/stickerpicker\/packs\/"\n\n/' sticker/stickerimport.py
	perl -0pi -e 's/default="config\.json"/default=DEFAULT_CONFIG_FILE/; s/default="web\/packs\/"/default=DEFAULT_PACK_DIR/' sticker/stickerimport.py
	perl -0pi -e 's/default="config\.json"/default="\/etc\/webapps\/stickerpicker\/config.json"/; s/web\/packs\//\/var\/lib\/stickerpicker\/packs\//g' sticker/pack.py
	perl -0pi -e 's/default="config\.json"/default="\/etc\/webapps\/stickerpicker\/config.json"/' sticker/download_thumbnails.py
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "$srcdir/stickerpicker.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm644 "$srcdir/nginx.conf" "$pkgdir/usr/share/doc/$_pkgname/nginx.example.conf"

	install -dm 755 "$pkgdir/usr/share/webapps/$_pkgname"
	cp -a web/* "$pkgdir/usr/share/webapps/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
