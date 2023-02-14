# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Kenneth Cremeans <iam@kcseb.digital>
# Contributor: Tom Zander <tom@flowee.org>

pkgname=lbry-desktop
pkgver=0.53.9
pkgrel=1
arch=('x86_64')
pkgdesc='Desktop app for the lbry-network (Odysee.com) - a decentralized, user-controlled content marketplace and YouTube alternative'
changelog=changelog
url="https://github.com/lbryio/${pkgname}"
license=('MIT')

makedepends=('git' 'yarn' 'nodejs>=16' 'npm' 'gnome-keyring' 'gconf' 'libnotify' 'libappindicator-gtk2' 'libsecret' 'libxcrypt-compat')

depends=('nss' 'alsa-lib' 'gtk3')
provides=("lbry=$pkgver" "$pkgname=$pkgver" "lbrynet=$pkgver")
conflicts=('lbry' "$pkgname-bin" 'lbrynet' 'lbrynet-bin' "$pkgname-git")

source=("git+${url}#tag=v${pkgver}"
	'lbry.desktop')

b2sums=('SKIP'
        '7afceb849ab2ee1c7ddbe7ee642298cbf9d8fdf48ab9194a324fd97438fec11e60607ae469a692d079ba15bc2c5e099053ff3efcc4a62e7c94904e053ece858a')

build() {
	cd "${srcdir}/$pkgname"

	export NODE_OPTIONS=--openssl-legacy-provider

	# Note : see available yarn targets in file package.json

	# Install dependencies
	yarn

	# Build the binaries
	yarn build:dir

	# Build and launch the dev version
	#yarn dev
}

package() {
	cd "$srcdir/$pkgname"
	# FIXME: Avoid building the AppImage and the .deb in the first place
	rm dist/electron/LBRY_${pkgver}.AppImage || true
	rm dist/electron/LBRY_${pkgver}.deb || true

	mkdir -p "$pkgdir/opt/LBRY"
	cp -r dist/electron/linux-unpacked/* "$pkgdir/opt/LBRY/"

	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/lbry"
	gzip -c CHANGELOG.md > "$pkgdir/usr/share/doc/lbry/changelog.gz"

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/applications"
	cp lbry.desktop "$pkgdir/usr/share/applications/"

	cd "$srcdir/$pkgname/build/icons"
	for s in 32x32 48x48 96x96 128x128 256x256 ; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/$s/apps"
		cp "$s.png" "$pkgdir/usr/share/icons/hicolor/$s/apps/lbry.png"
	done

	mkdir -p "$pkgdir/usr/bin"
	install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
	ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
	ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/lbrynet"

        cd "${srcdir}/$pkgname"
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

