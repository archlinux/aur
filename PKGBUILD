# Maintainer: SelfRef <arch@selfref.dev>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>

_pkgbase=jan
pkgname=${_pkgbase}
pkgver=0.8.0
pkgrel=1
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer"
url="https://jan.ai/"
arch=('x86_64')
license=('Apache-2.0')
source=("$_pkgbase::git+https://github.com/menloresearch/jan.git#tag=v$pkgver")
sha256sums=('b75e59bbdd6deb9659888219b3cc17e3a590f30871bfd07a7bcf7101cfe2c41f')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=(!lto)
depends=(
	'gtk3'
	'webkit2gtk-4.1'
)
optdepends=(
	'libappindicator-gtk3: for tray icon support'
	'uv: for MCP servers based on Python'
	'npm: for MCP servers based on Node.js'
)
makedepends=(
	'git'
	'nvm'
	'yarn'
	'cargo'
	'libappindicator-gtk3'
)

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

_ensure_corepack_yarn() {
	export COREPACK_HOME="${srcdir}/corepack"
	mkdir -p "$COREPACK_HOME"
	corepack enable
	corepack prepare yarn@4.5.3 --activate
}

prepare() {
	cd "$_pkgbase"
	_ensure_local_nvm
	nvm install 20
	_ensure_corepack_yarn

	# Keep package versions aligned with the upstream CI build workflow.
	for _json_file in \
		./src-tauri/tauri.conf.json \
		./web-app/package.json \
		./src-tauri/plugins/tauri-plugin-hardware/package.json \
		./src-tauri/plugins/tauri-plugin-llamacpp/package.json
	do
		sed -i "0,/\"version\": \"[^\"]*\",/s//\"version\": \"$pkgver\",/" "$_json_file"
	done

	for _cargo_toml in \
		./src-tauri/Cargo.toml \
		./src-tauri/plugins/tauri-plugin-hardware/Cargo.toml \
		./src-tauri/plugins/tauri-plugin-llamacpp/Cargo.toml
	do
		sed -i "/^\[package\]/,/^\[/{s/^version = .*/version = \"$pkgver\"/;}" "$_cargo_toml"
	done

	[ -f package.json ] && sed -i '/"build:tauri:linux"/ s/\.\/[^ ]*\.sh//g; /"build:tauri:linux"/ s/&& "/--bundles deb"/g' package.json
}

build() {
	cd "$_pkgbase"
	_ensure_local_nvm
	_ensure_corepack_yarn
	export YARN_CACHE_FOLDER="$srcdir"/yarn-cache
	export RUSTUP_TOOLCHAIN=stable

	rm -rf src-tauri/target/release/bundle/deb
	make build
}

package() {
	cd "$_pkgbase"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"

	cd src-tauri/target/release/bundle/deb/Jan_*/data/usr
	install -Dm755 bin/Jan -t "$pkgdir"/usr/bin

	install -dm755 "$pkgdir"/usr/share
	cp -r share/* "$pkgdir"/usr/share

	install -dm755 "$pkgdir"/usr/lib
	cp -r lib/* "$pkgdir"/usr/lib
}
