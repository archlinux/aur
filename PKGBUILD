# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_electron_pkg=electron41

_archive_extension="tar.gz"

pkgname=ipfs-desktop
pkgver=0.49.1
pkgrel=1
epoch=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$pkgname"
license=(MIT)
depends=(
	"$_electron_pkg"
)
makedepends=(
	nodejs
	npm
)

source=(
	"$pkgname-$pkgver.$_archive_extension::$url/archive/refs/tags/v$pkgver.$_archive_extension"
	"$pkgname.desktop"
	"$pkgname-startup.sh"
)
b2sums=('643e89643b68508373938df8eb1d086311d9f1a3964ecbc1b422a87438fc9e8e45f0a0ffede4b97b16652b06130a731a8cc51a13ef9e06704a1e210ea1f29f0f'
        '849d57fd59653ed0c6eca01769ad12a01f37f6a5316f1a83c0bf7cae576074b978e3ca555d50a56114d177e5fe4817338106698716f054a3e18ae1c81d7a8785'
        '6f603c79a83057d4f4077a859656dbce513be3aa0ab9993dc5b994929e6e26f2f8f58ecd030ea415c44f2d0fbc7dd0cc16526172613555b0f619c530ee7d583d')
_pkgsrc="$pkgname-$pkgver"

_electron_env() {
	export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/${_electron_pkg}/version")
}

_warn_if_electron_outdated() {
	local _installed _latest_local _vf _v

	[[ -r "/usr/lib/${_electron_pkg}/version" ]] || return 0
	_installed=$(< "/usr/lib/${_electron_pkg}/version")
	_latest_local=$_installed

	shopt -s nullglob
	for _vf in /usr/lib/electron*/version; do
		_v=$(< "$_vf")
		if [[ "$(printf '%s\n%s\n' "$_latest_local" "$_v" | sort -V | tail -n1)" != "$_latest_local" ]]; then
			_latest_local=$_v
		fi
	done
	shopt -u nullglob

	if [[ $_installed != "$_latest_local" ]]; then
		echo "==> WARNING: Packaging uses not the latest major version of electron installed. ${_electron_pkg} ${_installed} is used, but a newer local Electron version (${_latest_local}) is available on the system." >&2
	fi
}

build() {
	_warn_if_electron_outdated
	_electron_env

	local _builder_options=(
		"-c.electronDist=/usr/lib/${_electron_pkg}"
		"-c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
	)

	cd "$_pkgsrc"
	npm ci --no-audit --no-fund \
		2> >(sed '/glob@11\.1\.0: Old versions of glob are not supported/d' >&2)
	npm run build
	npm exec -- electron-builder --linux --dir --publish never "${_builder_options[@]}"
}

package() {
	_electron_env

	depends=("$_electron_pkg")

	mkdir -pm755 "$pkgdir/usr/lib/$pkgname"
	cp -a "$_pkgsrc/dist/linux-unpacked/resources"/* -t "$pkgdir/usr/lib/$pkgname/"
	rm -f \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/tsconfig.json"
	rm -f \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/LICENSE" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/README.md" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/build-log" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/install.sh" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/LICENSE" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/LICENSE-APACHE" \
		"$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/kubo/kubo/LICENSE-MIT"

	install -Dm644 "$_pkgsrc/assets/webui/ipfs-logo-512-ice.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm755 "$srcdir/ipfs-desktop-startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/ipfs-desktop.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
