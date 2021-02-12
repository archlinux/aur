# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ooniprobe-desktop
pkgver=3.2.3
_cliver=3.5.2
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://ooni.org"
license=('MIT')
depends=('nss' 'libxss' 'libxtst' 'xdg-utils')
makedepends=('yarn')
conflicts=("${pkgname%-desktop}")
replaces=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-desktop/archive/v$pkgver.tar.gz"
        "https://github.com/ooni/probe-cli/releases/download/v$_cliver/ooniprobe_v${_cliver}_linux_amd64.tar.gz"
        "ooniprobe_checksums_${_cliver}.txt::https://github.com/ooni/probe-cli/releases/download/v$_cliver/ooniprobe_checksums.txt"
        "$pkgname.desktop")
noextract=("ooniprobe_v${_cliver}_linux_amd64.tar.gz")
sha256sums=('9951df3a212e11abd2e121ad5b890a546170ab996b0a72dafc2434a691b456f9'
            'ea9652a24c89f9dc6b30277c62232ef871eee0bee7f546d748d5ecd3049d32eb'
            '8ef226e8ade948dc7fc2e4c0eccadf9793f86011b64b8b006a811798436bc800'
            'baaf4f3cca079dddc0b4e048c8778c6cc84786bb88fd9d218424b7b9f04f1135')

prepare() {
	cd "${pkgname#ooni}-$pkgver"

	# Disable building of rpm & tar.gz
	sed -i 's/"deb",/"deb"/g' package.json
	sed -i '45,46d' package.json

	# Disable downloading probe-cli & remove other platforms
	sed -i 's/darwin|linux|windows/linux/g' scripts/download-bin.js
	sed -i '/execSync(`curl/d' scripts/download-bin.js

	# Place files for verification
	mkdir -p build/probe-cli/linux_amd64
	cp "$srcdir/ooniprobe_v${_cliver}_linux_amd64.tar.gz" build/probe-cli
	cp "$srcdir/ooniprobe_checksums_${_cliver}.txt" \
		build/probe-cli/ooniprobe_checksums.txt

	# Remove checksums for other platforms
	sed -i '1,2d' build/probe-cli/ooniprobe_checksums.txt
	sed -i '2,5d' build/probe-cli/ooniprobe_checksums.txt
}

build() {
	cd "${pkgname#ooni}-$pkgver"
	yarn install --cache-folder "$srcdir/yarn-cache"
#	yarn run pack:linux
	yarn run build && node_modules/.bin/electron-builder --linux
}

package() {
	cd "${pkgname#ooni}-$pkgver"
	install -d "$pkgdir/opt/OONI Probe"
	cp -a dist/linux-unpacked/* "$pkgdir/opt/OONI Probe"

	install -d "$pkgdir/usr/bin"
	ln -sf "/opt/OONI Probe/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 48; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/icon_${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	for icon_size in 32 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/app_${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done
}
