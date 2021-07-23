# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: Bruno Pagani <archange at archlinux dot org>

pkgname=mattermost-desktop
pkgver=4.7.0
pkgrel=1
pkgdesc='Mattermost Desktop application for Linux'
arch=(x86_64 i686)
url="https://github.com/${pkgname/-//}"
license=(Apache)
_electron=electron12
_builderVersion='^20.10.4'
depends=($_electron)
makedepends=(git jq moreutils npm)
#optdepends=('hunspell: spell checking')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "${pkgname/-/.}")
sha256sums=('f327d8560bebeb2075c7369898c3ed6c2d11be952a44853822a663ba42144055'
            '0f18f87764465f1fc5a9fdfb6ef2834af4623c13bc95fce58da6cb0d8d39a75e'
            'e628268d3393aac0d5b7237c6b8818d2e362c373f99874a19171bf96a25e4ffa')

prepare() {
	cd "desktop-$pkgver"

	sed -i -e "s/git rev-parse --short HEAD/echo $pkgver/" webpack.config.base.js

	# Depending on the architecture, in order to accelerate the build process,
	# removes the compilation of ia32 or x64 build.
	if [[ "$CARCH" == x86_64 ]];then
		sed -i 's/--ia32//g' package.json
	else
		sed -i 's/--x64//g' package.json
	fi
	local electronDist="/usr/lib/$_electron"
	local electronVersion="$(<"$electronDist"/version)"

	# Do not build tar.gz, nor .deb or appimages
	# Use electron version that matches system package
	jq '
				.linux .target |= ["dir"] |
				{
					"electronDist": $electronDist,
					"electronVersion": $electronVersion
				} + .
			' \
			--arg electronDist "$electronDist" \
			--arg electronVersion "$electronVersion" \
			electron-builder.json |
		sponge electron-builder.json
	jq '
				del(.devDependencies["electron"]) |
				.devDependencies["electron-builder"] = $builderVersion
			' \
			--arg electronVersion "$electronVersion" \
			--arg builderVersion "$_builderVersion" \
			package.json |
		sponge package.json

	# Mattermost Desktop is using simple-spellchecker which prevents to bind on
	# the system Arch Linux hunspell dictionnaries. This is due to the fact
	# simple-spellchecker comes with its own set of dictionnaries. They differ
	# from the hunspell dictionnaries in the sense of, hunspell's dictionnaries
	# have additional pieces of info attributed to each line.
	# e.g. in /usr/share/hunspell/fr_FR.dic, "ordinateur" (computer in English)
	# ordinateur/S*() po:nom is:mas
	# simple-spellcheck expects a line with:
	# ordinateur
	# instead
	#
	# Asking upstream to switch to electron-spellchecker will fix the issue.
	# https://github.com/electron-userland/electron-spellchecker

	# Install dependencies should be in prepare(), that way we don't need an
	# internet connection during build().
	# We don't need to run "npm run build" because that target is run by "npm
	# run package:linux" any way.
	npm install --cache "$srcdir/npm-cache"
}

build() {
	cd "desktop-$pkgver"
	npm run package:linux --cache "$srcdir/npm-cache"
}

package() {
	cd "desktop-$pkgver"
	install -d "$pkgdir/usr/lib"
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" release/linux*unpacked/resources/app.asar
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
	install -Dm0644 src/assets/linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm0755 "../$pkgname".sh "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "../${pkgname/-/.}"
}
