# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: Bruno Pagani <archange at archlinux dot org>
# Contributor: AUR[Severus]

pkgname=mattermost-desktop
pkgver=4.7.1
pkgrel=1
pkgdesc='Mattermost Desktop application for Linux'
arch=(x86_64 i686)
url="https://github.com/${pkgname/-//}"
license=(Apache)
_electron=electron12
_builderVersion='^20.10.4'
depends=($_electron)
makedepends=(git jq moreutils npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "${pkgname/-/.}")
sha256sums=('65a9980e83e8258f7c6864a344597ffad7c665b7758774e6935482879ee0de4e'
            '1c2bf48b6397d04a5a536c5c9f4960db53249c838c380f03f808c612b00ba4c6'
            'e628268d3393aac0d5b7237c6b8818d2e362c373f99874a19171bf96a25e4ffa')

prepare() {
	cd "desktop-$pkgver"

	sed -i -e "s/git rev-parse --short HEAD/echo $pkgver/" webpack.config.base.js
	sed -e "s/@ELECTRON@/$_electron/" "../$pkgname.sh" > "$pkgname.sh"
	sed -i -e 's#resources/linux#src/assets/linux#' electron-builder.json

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

	npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
}

build() {
	cd "desktop-$pkgver"
	npm run package:linux --cache "$srcdir/npm-cache" --offline
}

package() {
	cd "desktop-$pkgver"
	install -d "$pkgdir/usr/lib"
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" release/linux*unpacked/resources/app.asar
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
	install -Dm0644 src/assets/linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "../${pkgname/-/.}"
}
