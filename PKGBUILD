# Maintainer: SelfRef <arch@selfref.dev>

_basename=jan
pkgname=${_basename}
pkgver=0.5.10
pkgrel=1
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer"
url="https://jan.ai/"
arch=('x86_64')
license=('AGPL-3.0')
source=(
	"$_basename::git+https://github.com/janhq/jan.git#tag=v$pkgver"
	'jan.desktop'
)
sha256sums=('b6dd9ce6d8c2b76d22991b0e98f88d1245fec169f3a0504e83f4fd71fc9eb243'
            '689c50321d61f2c40a275c004865e9956501038782867bbe73e9d42128f40048')
provides=("$_basename")
conflicts=("$_basename")
depends=(
	'nss'
	'atk'
	'libcups'
	'gtk3'
	'alsa-lib'
)
makedepends=(
	'git'
	'nvm'
	'libxcrypt-compat'
	'python'
)

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "$_basename"

	_ensure_local_nvm

	workflow_file=.github/workflows/template-build-linux-x64.yml
	[ -f "$workflow_file" ] && node_ver=$(grep -Po 'node-version: \K\d+' "$workflow_file")

	nvm install ${node_ver:-20}
	npm install --global yarn

	[ -f electron/package.json ] && sed -i '/"build:linux"/s/-l deb -l AppImage/-l --dir/' electron/package.json
}

build() {
	cd "$_basename"
	_ensure_local_nvm
	export YARN_CACHE_FOLDER="$srcdir"/yarn-cache
	make build
}

package() {
	# Desktop file
	install -Dm644 ../jan.desktop "$pkgdir"/usr/share/applications/jan.desktop

	# Application files
	cd "$_basename"/electron
	install -dm755 "$pkgdir"/opt/Jan
	cp -r dist/linux-unpacked/* "$pkgdir"/opt/Jan/

	# Icon files
	cd icons
	[ -f icon.png ] && install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/jan.png
	[ -f icon-tray.png ] && install -Dm644 icon-tray.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/jan.png
	[ -f icon-tray@2x.png ] && install -Dm644 icon-tray@2x.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/jan.png
}
