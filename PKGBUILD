# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Kenneth Cremeans <iam@kcseb.digital>
# Contributor: Tom Zander <tom@flowee.org>

pkgname=lbry-desktop-git
pkgver=0.53.4.r10893.g68718f32b
pkgrel=1
arch=('x86_64')
pkgdesc='A browser and wallet for LBRY, the decentralized, user-controlled content marketplace'
url='https://lbry.com/'
license=('MIT')

makedepends=('git' 'yarn')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret' 'libxcrypt-compat')
provides=("lbry=$pkgver" "lbry-desktop=$pkgver" "lbry-app=$pkgver" "lbrynet=$pkgver")
conflicts=('lbry' 'lbry-desktop-bin' 'lbry-app-bin' 'lbrynet' 'lbrynet-bin')

source=(
	'git+https://github.com/lbryio/lbry-desktop.git'
	'lbry.desktop'
)
b2sums=('SKIP'
        '42a3eacb0d64e21c9c775e21f75585779f3ecb2f916137a63f70e46f68c07158b91c5785c73b2283dd9a10d0de74cf87f07a699cbc072ca233d2db1488d0b63c')

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
	ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/lbrynet"

}

