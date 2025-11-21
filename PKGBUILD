# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributer: Bruce Zhang

pkgname=lx-music-dev-git
_pkgname=lx-music
pkgver=2.11.0.r43.g2bd5467
pkgrel=1
#_electron=electron37
pkgdesc='An Electron-based music player (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/lyswhut/lx-music-desktop'
license=('Apache')
depends=()
provides=('lx-music')
conflicts=('lx-music')
makedepends=('asar' 'npm' 'git' 'node-gyp'
	'jq' 'moreutils' python-setuptools
)
source=("git+${url}.git#branch=dev"
	"$_pkgname.sh"
	"$_pkgname.desktop"
	'dev-app-update.yml'
)
sha256sums=('SKIP'
            '1171a3688a136b75aa0493d5737cfb1e8c386a48030c8ca313d4cac48c0630e3'
            '732e98dfe569768c3cc90abbe8b1f6d24726dd2cb61317f57f8d5fe77fdefe2f'
            'ffdd88036d10eb9780c0a26987894708720c2f486247bb3854f05fb5dd607423')

pkgver() {
	cd "$srcdir/$_pkgname-desktop"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

prepare() {
	cd "$srcdir/$_pkgname-desktop"

	# find the electron major version from package.json
	_electron=electron$(jq -r '.devDependencies.electron' package.json | cut -d'.' -f1)

	# raise error if the target electron version is not installed
	if ! command -v "${_electron}" &> /dev/null; then
		echo "Error: ${_electron} is not installed"
		exit 1
	fi

	local electronDist="/usr/lib/${_electron}"
	local electronVersion="$(<$electronDist/version)"
	electronVersion="${electronVersion%.*}.0"
	jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
	jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
	jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json

	sed -i "s|__ELECTRON__|${_electron}|g" "${srcdir}/${_pkgname}.sh"
	# disable autoupdater
	sed -i "/common.tryAutoUpdate/s/true/false/" src/common/defaultSetting.ts
}

build() {
	cd "$srcdir/$_pkgname-desktop"
	export HOME=${srcdir}
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	npm install
	npm run pack:dir
}

package() {
	cd "$srcdir/$_pkgname-desktop"

	# find the electron major version from package.json
	_electron=$(jq -r '.devDependencies.electron' package.json | cut -d'.' -f1)
	depends+=("electron$_electron")
	
	cd "$srcdir"
	install -Dm644 'dev-app-update.yml' -t "$pkgdir/usr/lib/lx-music/"
	install -Dm755 lx-music.sh "$pkgdir/usr/bin/lx-music"
	install -Dm644 lx-music.desktop -t "$pkgdir/usr/share/applications/"

	# Install app
	cd "$srcdir/$_pkgname-desktop/"
	asar e build/linux-unpacked/resources/app.asar "$pkgdir/usr/lib/lx-music/"

	# Install icons
	install -Dm644 resources/icons/512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/lx-music.png"

	# Install license
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lx-music/"
	cp -a --no-preserve=ownership licenses "$pkgdir/usr/share/licenses/lx-music/"

	# clean other platform.
	for native in {bufferutil,utf-8-validate}; do
		cd ${pkgdir}/usr/lib/lx-music/node_modules/$native/prebuilds
		rm -rf darwin-* win32-*
	done
}
