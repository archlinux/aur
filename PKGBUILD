# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Kenneth Cremeans <iam@kcseb.digital>
# Contributor: Tom Zander <tom@flowee.org>

pkgname=lbry-desktop
pkgver=0.53.4
pkgrel=2
arch=('x86_64')
pkgdesc='Desktop app for the lbry-network (Odysee.com) - a decentralized, user-controlled content marketplace and YouTube alternative'
url="https://github.com/lbryio/${pkgname}.git"
license=('MIT')

makedepends=('git' 'yarn' 'nodejs' 'npm' 'gnome-keyring' 'gconf' 'libnotify' 'libappindicator-gtk2' 'libsecret' 'libxcrypt-compat')

depends=('nss' 'alsa-lib' 'gtk3')
provides=("lbry=$pkgver" "lbry-desktop=$pkgver" "lbry-app=$pkgver" "lbrynet=$pkgver")
conflicts=('lbry' 'lbry-desktop-bin' 'lbry-app-bin' 'lbrynet' 'lbrynet-bin' 'lbry-desktop-git')

source=(
        "git+${url}#tag=v${pkgver}"
	'lbry.desktop'
)

b2sums=('SKIP'
        '7afceb849ab2ee1c7ddbe7ee642298cbf9d8fdf48ab9194a324fd97438fec11e60607ae469a692d079ba15bc2c5e099053ff3efcc4a62e7c94904e053ece858a')

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

