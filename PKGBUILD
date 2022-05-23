# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=stickerpicker
pkgname="$_pkgname-git"
pkgver=r78.99ced88
pkgrel=1
pkgdesc="Element sticker picker widget"
arch=(any)
url="https://github.com/maunium/$_pkgname"
license=('AGPL3')
depends=(
	'python'
	'python-aiohttp'
	'python-yarl'
	'python-pillow'
	'python-telethon'
	'python-cryptg'
	'python-magic'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	"0001-Change-default-dirs-to-point-to-package-directories.patch"
	"stickerpicker.tmpfiles"
	"nginx.conf"
)
sha256sums=('SKIP'
            'c314dffebf5cc36d1dde79cf49eca20c1823167a1917f31504e940ae40446b92'
            '41df176c7557a0c632ed4c3b3473dc2660ccbb2fde3a4a14c2e40e52f5632902'
            '0ae7588129d7d9cc594a41b3ec79a9bed2f7b7b23b3e815dde2860c053c28805')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Change-default-dirs-to-point-to-package-directories.patch"
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	# No tests
	#pytest
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 655 "$srcdir/stickerpicker.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm 655 "$srcdir/nginx.conf" "$pkgdir/usr/share/doc/$_pkgname/nginx.example.conf"

	install -dm 755 "$pkgdir/usr/share/webapps/$_pkgname"
	cp -a web/* "$pkgdir/usr/share/webapps/$_pkgname"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
