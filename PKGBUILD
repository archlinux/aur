# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: AUR[Severus]

pkgname=mattermost-desktop-gitlab
_realname=mattermost-desktop
pkgver=5.4.0
pkgrel=3
pkgdesc='Mattermost Desktop application with Gitlab login fixes'
arch=(x86_64)
url="https://github.com/${_realname/-//}"
license=(Apache)
_electron=electron24
depends=($_electron
         libxcrypt-compat)
makedepends=(gendesk
             git
             jq
             moreutils
             node-gyp
             npm)
provides=('mattermost-desktop')
conflicts=('mattermost-desktop')
_archive="${_realname#*-}-$pkgver"
source=("$_realname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$_realname.sh"
        "gitlab.patch")
sha256sums=('7d2db86669775aa063299cbbc21fb0a348c68e338006ae2acad683cb87d8c410'
            '1c2bf48b6397d04a5a536c5c9f4960db53249c838c380f03f808c612b00ba4c6'
            '55bc15becdc0882c895b02d447fa2592783958a732cb0313895d3e16f0491d8d')

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"

prepare() {
	gendesk -q -f -n \
		--pkgname "$_realname" \
		--pkgdesc "$pkgdesc" \
		--name Mattermost \
		--categories 'Network;InstantMessaging;' \
		--mimetypes 'x-scheme-handler/mattermost;' \
		--custom StartupWMClass="$_realname"
	cd "$_archive"
	patch -p1 < "${srcdir}/gitlab.patch"
	sed -i -e "s/git rev-parse --short HEAD/echo $pkgver/" webpack.config.base.js
	sed -e "s/@ELECTRON@/$_electron/" "../$_realname.sh" > "$_realname.sh"
	local _electronVersion="$(< "/usr/lib/$_electron/version")"
	jq '	.linux["target"] = [ "dir" ]' electron-builder.json |
		sponge electron-builder.json
	jq '	.devDependencies["electron"] = $electronVersion |
		del(.devDependencies["electron-rebuild"]) |
		.config.target = $electronVersion |
		.config.runtime = $electronRuntime' \
			--arg electronRuntime "$_electron" \
			--arg electronVersion "$_electronVersion" \
			package.json |
		sponge package.json
	sed -i -e '/package:/s/tar.gz deb rpm/dir/' package.json
	npm $_npmargs install
}

build() {
	cd "$_archive"
	export NODE_ENV=production
	npm $_npmargs --offline run build
	npm $_npmargs --offline run package:linux-all-x64
}

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/lib/$_realname/" release/linux-unpacked/resources/app.asar
	cp -a release/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$_realname/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_realname/" LICENSE.txt
	install -Dm0644 src/assets/linux/app_icon.png "$pkgdir/usr/share/icons/$_realname.png"
	install -Dm0755 "$_realname.sh" "$pkgdir/usr/bin/$_realname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "../$_realname.desktop"
}
