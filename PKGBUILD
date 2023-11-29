# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=flet
pkgname=python-${_pkgname}
pkgver=0.14.0
pkgrel=1
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
	'python-poetry'
	'python-copier'
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs')
makedepends=(
	'goreleaser'
	'python-build'
	'python-installer'
	'python-wheel'
	'go'
	'flutter-engine'
	'git')
arch=('any')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"flutter::git+https://github.com/flutter/flutter.git"
	"flutter-engine::git+https://github.com/flutter/engine.git"
	'flet-linux.patch')
sha256sums=('321782196a87652c309d281707d0e71234966059496e02c58deb45ceee788004'
            'SKIP'
            'SKIP'
            'af9718b926a07ac8e8689a2c623fe6921d88d0bcd52263f63848d11175e3b828')

_srcdir="${_pkgname}-${pkgver}"
_engine_version=3.16.1

prepare() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-prepare.sh'
	
	patch -p1 -i "${srcdir}/flet-linux.patch"
	
	cd 'client'
	flutter clean
	flutter pub get
}

build() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-build.sh'
	
	pushd 'client'
		flutter build linux --release
		#flutter build web --release
	popd
	
	pushd 'server'
		APPVEYOR_BUILD_VERSION=${pkgver} goreleaser build --clean --snapshot --single-target
	popd
	
	for dir in 'sdk/python/packages/'{flet-core,flet,flet-runtime}; do
		pushd "$dir"
			python -m build --wheel --no-isolation
		popd
	done
}

package() {
	cd "${_srcdir}"
	
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	
	for dir in 'sdk/python/packages/'{flet-core,flet,flet-runtime}; do
		pushd "$dir"
			python -m installer --destdir="$pkgdir" 'dist/'*.whl
		popd
	done
	
	local _client_installdir="opt/$pkgname"
	install -dm0755 "${pkgdir}/${_client_installdir}"
	cp -r "client/build/linux/x64/release/bundle/"* "$pkgdir/${_client_installdir}"
	ln -s "/${_client_installdir}/flet" "$pkgdir/usr/bin/flet_view"
	
	#install -dm0755 "$pkgdir/usr/share/$pkgname"
	#cp -r 'client/build/web' "$pkgdir/usr/share/$pkgname"
	
	install -Dm0755 "server/dist/fletd_"*'/fletd' -t "${pkgdir}/usr/bin"
	
	cd "$pkgdir/usr/lib/python"*
	install -dm0755 'site-packages/flet/bin'
	ln -s '/usr/bin/fletd' 'site-packages/flet/bin/fletd'
	#ln -s "/usr/share/$pkgname/web" 'site-packages/flet/web'
}
