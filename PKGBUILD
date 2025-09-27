# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=jan
pkgname=${_pkgbase}
pkgver=0.6.10
pkgrel=1
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer"
url="https://jan.ai/"
arch=('x86_64')
license=('AGPL-3.0')
source=("$_pkgbase::git+https://github.com/menloresearch/jan.git#tag=v$pkgver")
sha256sums=('c4811e40b4b0a8558eafbb5656a37409697c7f93481ea7e7a0b0a06c6a928587')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=(!lto)
depends=(
	'gtk3'
	'webkit2gtk-4.1'
)
optdepends=(
	'libappindicator-gtk3: for tray icon support'
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

prepare() {
	cd "$_pkgbase"
	_ensure_local_nvm
	nvm install 20
	[ -f package.json ] && sed -i '/"build:tauri:linux"/ s/\.\/[^ ]*\.sh//g; /"build:tauri:linux"/ s/&& "/--bundles deb"/g' package.json
}

build() {
	cd "$_pkgbase"
	_ensure_local_nvm
	export YARN_CACHE_FOLDER="$srcdir"/yarn-cache
	export RUSTUP_TOOLCHAIN=stable

	rm -rf src-tauri/target/release/bundle/deb
	make build
}

package() {
	cd "$_pkgbase"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"

	cd src-tauri/target/release/bundle/deb/Jan_*/data/usr
	install -Dm755 bin/* -t "$pkgdir"/usr/bin
	install -dm755 "$pkgdir"/usr/share
	cp -r share/* "$pkgdir"/usr/share
}
