# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=server
pkgname=etebase-server
pkgver=0.11.0
pkgrel=1
pkgdesc="A self-hostable Etebase (EteSync 2.0) server"
arch=(any)
depends=(
	'python-redis'
	'python-aiofiles'
	'python-django'
	'python-fastapi'
	'python-pynacl'
	'python-msgpack'
)
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'postgresql: storage backend'
	'uvicorn: application container, systemd service'
	'python-daphne: application container'
	'python-ldap: LDAP user verification'
)
url="https://github.com/etesync/$_pkgname"
license=('AGPL3')
backup=("etc/$pkgname/$pkgname.ini")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        $pkgname.sysusers
        $pkgname.tmpfiles
        $pkgname.service
        $pkgname.nginx.conf
        $pkgname.ini.patch
        '0001-fix-settings-ensure-environment-variables-always-ove.patch'
        $pkgname)
sha256sums=('ae8b79977b9ac5ff58aaf5bfabce1957183db00751322633b77028e7f88798b8'
            'd42e2518975363aed2900fe4e03eefade98ed9b6f8b8140fd1eddc081d4081e7'
            'f8b9bdbfdd90365a6b463ab2af4320eb2fddb527e6c33d0f02f4f8820864eb43'
            '8ecd76be056ea582b01f6230de9a74b9c4ce4a637f2b0a27edc5b6f7848b5fba'
            '120fd364e4dc64f5ed93f3a147a45da4ae55d4b7d5f2bd525c3f838171c8d640'
            'd4b4dc44deab70c0d4c9e485763721fedff3eb938c201d96e6dacc75592b24c2'
            '0d9e43f7855a0eed184eabaf41a30b448db83db5e35b5d3647f55c16e1cf7c32'
            '3f040318ab3fac72c8033b0b567f635e7da5afb9e6e8f8b391d4978226136983')

prepare() {
	cd "$_pkgname-$pkgver"

	patch -p1 < "$srcdir/0001-fix-settings-ensure-environment-variables-always-ove.patch"
}

build() {
	cd "$_pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	DJANGO_STATIC_ROOT="$pkgdir/usr/share/webapps/$pkgname/static" ./manage.py collectstatic

	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

	install -Dm644 "$pkgname.ini.example" "$pkgdir/etc/$pkgname/$pkgname.ini"
	patch --directory="$pkgdir/etc/$pkgname/" -p1 < "$srcdir/$pkgname.ini.patch"

	install -Dm644 "$srcdir/$pkgname.nginx.conf" "$pkgdir/usr/share/examples/$pkgname/$pkgname.nginx.conf"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
