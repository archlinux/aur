# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_install_path:=opt}

_pkgname=flet
pkgname=python-${_pkgname}
pkgver=0.24.1
pkgrel=2
pkgdesc='Easily build realtime web, mobile and desktop apps in your favorite language and securely share them with your team.'
url="https://${_pkgname}.dev/"
license=('Apache')
depends=(
	'python-repath'
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
	'gst-plugins-base-libs'
	'mpv')
makedepends=(
	'goreleaser'
	'python-build'
	'python-installer'
	'python-wheel'
	'go'
	'fvm'
	'git'
	'patchelf')
arch=('x86_64')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'flet-linux.patch')
sha256sums=('8e007f71953fae93f8c808e07b527406f1784f10885879523c6a92fa08114c01'
            'af9718b926a07ac8e8689a2c623fe6921d88d0bcd52263f63848d11175e3b828')

_srcdir="${_pkgname}-${pkgver}"
_engine_version=3.24.2

prepare() {
	cd "${_srcdir}"

	patch -p1 -i "${srcdir}/flet-linux.patch"
}

build() {
	cd "${_srcdir}"

	pushd 'client'
		fvm install "$_engine_version"
		fvm use -f "$_engine_version"

		fvm flutter --disable-analytics

		fvm flutter --no-version-check pub get
		fvm flutter build linux --release
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

	local _client_installdir="${_install_path}/$pkgname"
	install -dm0755 "${pkgdir}/${_client_installdir}"
	cp -r "client/build/linux/x64/release/bundle/"* "$pkgdir/${_client_installdir}"
	ln -s "/${_client_installdir}/flet" "$pkgdir/usr/bin/flet_view"

	# Fix runpath
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/${_install_path}/$pkgname/$_pkgname"
	for i in "$pkgdir/${_install_path}/$pkgname/lib"/*.so; do
		[ -z "$(patchelf --print-rpath "$i")" ] && continue
		patchelf --set-rpath '$ORIGIN' "$i"
	done

	#install -dm0755 "$pkgdir/usr/share/$pkgname"
	#cp -r 'client/build/web' "$pkgdir/usr/share/$pkgname"

	install -Dm0755 "server/dist/fletd_"*'/fletd' -t "${pkgdir}/usr/bin"

	cd "$pkgdir/usr/lib/python"*
	install -dm0755 'site-packages/flet/bin'
	ln -s '/usr/bin/fletd' 'site-packages/flet/bin/fletd'
	#ln -s "/usr/share/$pkgname/web" 'site-packages/flet/web'
}
