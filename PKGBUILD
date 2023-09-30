# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributer: Bruce Zhang

pkgname=lx-music
pkgver=2.5.0
pkgrel=1
_electron=electron
pkgdesc='An Electron-based music player'
arch=('x86_64' 'aarch64')
url='https://github.com/lyswhut/lx-music-desktop'
license=('Apache')
depends=("${_electron}")
makedepends=('asar' 'npm' 'git' 'node-gyp'
# 'jq' 'moreutils'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        'dev-app-update.yml'
        )
sha256sums=('a4bbe38b9a99e3422294c0737b0da12a21d6a90a141fe9d92d3aacf2028d5d3e'
            '1171a3688a136b75aa0493d5737cfb1e8c386a48030c8ca313d4cac48c0630e3'
            '732e98dfe569768c3cc90abbe8b1f6d24726dd2cb61317f57f8d5fe77fdefe2f'
            'ffdd88036d10eb9780c0a26987894708720c2f486247bb3854f05fb5dd607423')

prepare() {
	cd "$srcdir/$pkgname-desktop-$pkgver"
	# electron from archlinux official repo does not work, skip patching.

	# local electronDist="/usr/lib/${_electron}"
	# local electronVersion="$(< $electronDist/version)"
	# # electronVersion="${electronVersion%.*}.0"
	# jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
	# jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
	# jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json

	sed -i "s|__ELECTRON__|${_electron}|g" "${srcdir}/${pkgname}.sh"



	# jq ".compilerOptions.module = 'nodenext'" tsconfig.json | sponge tsconfig.json
	# sed -i 's|esnext|nodenext|g;s|ESNext|esnext|g' tsconfig.json
	# sed -i 's|NodeJS.Timer|NodeJS.Timeout|g' src/main/modules/sync/server/server/server.ts
}

build() {
	cd "$srcdir/$pkgname-desktop-$pkgver"
	export HOME=${srcdir}
	npm ci
	npm run pack:dir
}

package() {
    install -Dm644 'dev-app-update.yml' -t  "$pkgdir/usr/lib/lx-music/"
	install -Dm755 lx-music.sh "$pkgdir/usr/bin/lx-music"
	install -Dm644 lx-music.desktop -t "$pkgdir/usr/share/applications/"

	# Install app
	cd "$srcdir/$pkgname-desktop-$pkgver/"
	asar e build/linux-unpacked/resources/app.asar "$pkgdir/usr/lib/lx-music/"

	# Install icons
	install -Dm644 resources/icons/512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/lx-music.png"

	# Install license
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lx-music/"
	cp -a --no-preserve=ownership licenses "$pkgdir/usr/share/licenses/lx-music/"

	# clean other platform.
	for native in {bufferutil,utf-8-validate};
	do
		cd ${pkgdir}/usr/lib/lx-music/node_modules/$native/prebuilds
		rm -rf darwin-* win32-*
	done;
}
