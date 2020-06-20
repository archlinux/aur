# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD file is slightly inspired from the package lbry-app-bin
# Notes 2020-06 :
#   - Uncompressed package size is 240 MB
#   - Need to have 2 GB available disk space in local build area
#   - Need to have 1 GB available in ~/.cache/yarn/v6
#   - It *might* be useful to first install package lbry-app-bin to have LBRY the headers

pkgname=lbry-desktop-git
pkgver=0.46.2.r7813.g95a984829
pkgrel=1
arch=('x86_64')
pkgdesc='A browser and wallet for LBRY, the decentralized, user-controlled content marketplace'
url='https://lbry.com/'
license=('MIT')

makedepends=('git' 'yarn')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
provides=("lbry=$pkgver" "lbry-desktop=$pkgver" "lbry-app=$pkgver")
conflicts=('lbry' 'lbry-desktop-bin' 'lbry-app-bin')

source=(
	'git+https://github.com/lbryio/lbry-desktop.git'
	'lbry.desktop'
)
sha256sums=(
	'SKIP'
	'e23dcf2e64c43e1884cec70fb2c57ae22f2e7d9f42a2043c320410102504b4b4'
)

pkgver() {
	cd "${srcdir}/lbry-desktop"

	# LBRY version (extracted from package.json)
	local _distver=`cat package.json | sed -nr 's/^[[:space:]]*"version" *: *"(.*)".*/\1/p' | head -n 1 | tr -d '-'`

	# Date of the last git commit
	#local _gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`
	# Revision number
	local _gitrev=`git rev-list --count HEAD`
	# Short hash of latest commit
	local _githash=`git rev-parse --short HEAD`

	#echo $_distver.git$_gitver;
	echo $_distver.r$_gitrev.g$_githash;
}

build() {
	cd "${srcdir}/lbry-desktop"

	# Note : see available yarn targets in file package.json

	# Install dependencies
	yarn

	# Build the binaries
	yarn build:dir

	# Build and launch the dev version
	#yarn dev
}

package() {
	# Note : Intentionally not decompressing the generated .deb package ; this should not have been generated anyway

	cd "$srcdir/lbry-desktop/dist/electron/linux-unpacked"
	mkdir -p "$pkgdir/opt/LBRY"
	cp -r ./* "$pkgdir/opt/LBRY/"

	cd "$srcdir/lbry-desktop"
	mkdir -p "$pkgdir/usr/share/doc/lbry"
	gzip -c CHANGELOG.md > "$pkgdir/usr/share/doc/lbry/changelog.gz"

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/applications"
	cp lbry.desktop "$pkgdir/usr/share/applications/"

	cd "$srcdir/lbry-desktop/build/icons"
	for s in 32x32 48x48 96x96 128x128 256x256 ; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/$s/apps"
		cp "$s.png" "$pkgdir/usr/share/icons/hicolor/$s/apps/lbry.png"
	done

	mkdir -p "$pkgdir/usr/bin"
	install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
	ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"

}

