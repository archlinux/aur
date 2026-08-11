# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_install_path:=opt}

_pkgname=flet
pkgname=python-${_pkgname}
pkgver=0.86.5
pkgrel=2
pkgdesc='Easily build realtime web, mobile and desktop apps in your favorite language and securely share them with your team.'
url="https://${_pkgname}.dev/"
license=('Apache-2.0')
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs'
	'mpv')
makedepends=(
	'goreleaser'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'go'
	'fvm'
	'git'
	'patchelf'
	'cmake'
	'ninja'
	'clang')
arch=('x86_64')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'flet-linux.patch')
sha256sums=('2376e9f1fa4ce0c2f6b54bdf5676efbbee6c25fc054c4be08afeac5712a366ac'
            'e252e4eec325886d76dfc54c90604ea81ec0d6791b7e22bb93f63cec6378c50c')

_srcdir="${_pkgname}-${pkgver}"
_engine_version=3.44.8

prepare() {
	cd "${_srcdir}"

	patch -p1 -i "${srcdir}/flet-linux.patch"
}

build() {
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"
	export CC='clang'
	export CXX='clang++'

	cd "${_srcdir}"

	pushd 'client'
		fvm install "$_engine_version"
		fvm use -f "$_engine_version"

		fvm flutter --disable-analytics

		fvm flutter --no-version-check pub get
		fvm flutter build linux --release -v
	popd

	#cd 'sdk/python'
	#python -m build --wheel --no-isolation

	for dir in 'sdk/python/packages/'{flet-cli,flet-desktop,flet,flet-web}; do
		pushd "$dir"
			python -m build --wheel --no-isolation
		popd
	done
}

package() {
	depends+=(
		'python-repath'
		'python-websocket-client'
		'python-watchdog'
		'python-oauthlib'
		'python-websockets'
		'python-httpx'
		'python-packaging'
		'python-poetry'
		'python-copier'
		'python-qrcode'
		'python-cookiecutter'
		'python-binaryornot'
		'python-chardet'
		'python-rich')
	cd "${_srcdir}"

	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"

	#pushd 'sdk/python'
	#	python -m installer --destdir="$pkgdir" 'dist/'*.whl
	#popd
	for dir in 'sdk/python/packages/'{flet-cli,flet-desktop,flet,flet-web}; do
		pushd "$dir"
			python -m installer --destdir="$pkgdir" 'dist/'*.whl
		popd
	done

	local _client_installdir="${_install_path}/$pkgname"
	install -dm0755 "${pkgdir}/${_client_installdir}"
	cp -r 'client/build/linux/x64/release/bundle/'* "$pkgdir/${_client_installdir}"
	ln -s "/${_client_installdir}/flet" "$pkgdir/usr/bin/flet_view"

	# Fix runpath
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/${_install_path}/$pkgname/$_pkgname"
	for i in "$pkgdir/${_install_path}/$pkgname/lib"/*.so; do
		[ -z "$(patchelf --print-rpath "$i")" ] && continue
		patchelf --set-rpath '$ORIGIN' "$i"
	done

	#install -dm0755 "$pkgdir/usr/share/$pkgname"
	#cp -r 'client/build/web' "$pkgdir/usr/share/$pkgname"

	cd "$pkgdir/usr/lib/python"*
	install -dm0755 'site-packages/flet/bin'
	#ln -s "/usr/share/$pkgname/web" 'site-packages/flet/web'

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
	install -Dm755 <(cat << EOF
#!/usr/bin/env sh
python '$site_packages/flet_cli/cli.py' "\$@"
EOF
	) "${pkgdir}/usr/bin/${_pkgname}_cli"
}
