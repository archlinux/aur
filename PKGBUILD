# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=flet
pkgname=python-${_pkgname}-0-7-x
pkgver=0.7.4
pkgrel=4
pkgdesc='Easily build realtime web, mobile and desktop apps in your favorite language and securely share them with your team.'
url="https://${_pkgname}.dev/"
license=('Apache')
depends=(
	'python-repath'
	'python-typing-extensions'
	'python-websocket-client'
	'python-watchdog'
	'python-oauthlib'
	'python-websockets'
	'python-httpx'
	'python-packaging'
	'python-poetry')
makedepends=(
	'flutter-3-16-9'
	'goreleaser'
	'python-build'
	'python-installer'
	'python-wheel'
	'cmake')
arch=('any')
conflicts=('python-flet')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'flet-linux.patch')
sha256sums=('44b400ec6d37353cae40c67b53f484f7b6cf1cc634bd6201e0332882938c3e0d'
            'ec5a4520958aa116f99666463a0c8b871dbbd908f9fe7674777c470f72edead9')

_srcdir="${_pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	
	patch -p1 -i '../flet-linux.patch'
}

build() {
	cd "${_srcdir}"
	
	pushd 'client'
		flutter config --enable-linux-desktop
		flutter pub get
		flutter build linux --release
		flutter build web --release
	popd
	
	pushd 'server'
		APPVEYOR_BUILD_VERSION=${pkgver} goreleaser build --clean --snapshot --single-target
	popd
	
	for dir in 'sdk/python/packages/'{flet-core,flet}; do
		pushd "$dir"
			python -m build --wheel --no-isolation
		popd
	done
}

package() {
	cd "${_srcdir}"
	
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	
	for dir in 'sdk/python/packages/'{flet-core,flet}; do
		pushd "$dir"
			python -m installer --destdir="$pkgdir" 'dist/'*.whl
		popd
	done
	
	_client_installdir="opt/$pkgname"
	install -dm0755 "${pkgdir}/${_client_installdir}"
	cp -r "client/build/linux/x64/release/bundle/"* "$pkgdir/${_client_installdir}"
	ln -s "/${_client_installdir}/flet" "$pkgdir/usr/bin/flet_view"
	
	install -dm0755 "$pkgdir/usr/share/$pkgname"
	cp -r 'client/build/web' "$pkgdir/usr/share/$pkgname"
	
	install -Dm0755 "server/dist/fletd_"*'/fletd' -t "${pkgdir}/usr/bin"
	
	cd "$pkgdir/usr/lib/python"*
	install -dm0755 'site-packages/flet/bin'
	ln -s '/usr/bin/fletd' 'site-packages/flet/bin/fletd'
	ln -s "/usr/share/$pkgname/web" 'site-packages/flet/web'
}
