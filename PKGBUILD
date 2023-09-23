# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=flet
pkgname=python-${_pkgname}
pkgver=0.10.2
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
	'libglvnd'
	'glu'
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
sha256sums=('57f3ebb01c3c8b6ed88627c550a86ae4cf276784b21b24fb5afd8f369dc9bd64'
            'SKIP'
            'SKIP'
            'af9718b926a07ac8e8689a2c623fe6921d88d0bcd52263f63848d11175e3b828')

_srcdir="${_pkgname}-${pkgver}"

prepare() {
	source '/opt/flutter-engine/pkgbuild-prepare.sh'
	cd "${_srcdir}"
	
	patch -p1 -i "${srcdir}/flet-linux.patch"
	
	cd 'client'
	flutter clean $flutter_select_engine
	flutter pub $flutter_select_engine get
}

build() {
	source '/opt/flutter-engine/pkgbuild-build.sh'
	cd "${_srcdir}"
	
	pushd 'client'
		flutter build linux --release $flutter_select_engine
		#flutter build web --release $flutter_select_engine
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
