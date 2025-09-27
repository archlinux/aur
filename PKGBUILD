# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=jan
pkgname=${_pkgbase}-git
pkgver=0.7.0.r10.gabb0da4
pkgrel=2
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer"
url="https://jan.ai/"
arch=('x86_64')
license=('AGPL-3.0')
source=("$_pkgbase::git+https://github.com/menloresearch/jan.git")
sha256sums=('SKIP')
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

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

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
