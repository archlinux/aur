# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=flet
pkgname=python-${_pkgname}
pkgver=0.10.1
_flutter_ver=3.13.4
pkgrel=2
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
	'clang'
	'git'
	'unzip'
	'cmake'
	'ninja'
	'go')
arch=('any')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"flutter::git+https://github.com/flutter/flutter.git#tag=${_flutter_ver}"
	'flet-linux.patch')
sha256sums=('f755b3baa9be25fe973748d9a869ee43ed1ff5a71062e28c730dbafaebb18db1'
            'SKIP'
            'af9718b926a07ac8e8689a2c623fe6921d88d0bcd52263f63848d11175e3b828')

_srcdir="${_pkgname}-${pkgver}"

_flutter() {
	flutter --suppress-analytics "$@"
}

_setpath() {
	export PATH="$srcdir/flutter/bin:$PATH"
}

_use_system_dart() {
	sed -i 's|"$FLUTTER_ROOT/bin/internal/update_dart_sdk.sh"|#|' 'flutter/bin/internal/shared.sh'
	sed -i -E 's|_wait_for_lock$|#_wait_for_lock|' 'flutter/bin/internal/shared.sh'
	rm -rf 'flutter/bin/cache/dart-sdk' || true
	ln -s '/opt/dart-sdk' 'flutter/bin/cache/dart-sdk'
	
	(cat << EOF
#!/usr/bin/env sh

/usr/bin/dart "\$@"
EOF
	) > 'flutter/bin/dart'
}

prepare() {
	#_use_system_dart
	
	cd "${_srcdir}"
	
	patch -p1 -i "${srcdir}/flet-linux.patch"
	
	_setpath
	
	flutter --disable-telemetry
	
	cd 'client'
	_flutter config --enable-linux-desktop
	_flutter clean
	_flutter pub get
}

build() {
	cd "${_srcdir}"
	
	_setpath
	
	pushd 'client'
		_flutter build linux --release
		_flutter build web --release
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
