# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: jswenson
# Packager: Chris Knepper <chris82thekid at gmail dot com>
pkgname=android-messages-desktop
pkgver=3.1.0
pkgrel=3
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/chrisknepper/android-messages-desktop"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk3')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname")
sha256sums=('e744e805a96a833b8b6fb59c8407dbc2b91d72eae7de9586d0bb42db87839ba8'
            'ef967c944762e6032c78db578be46a89e5eac2bc8bee856e21d67a6029e1dc69')

prepare() {
	cd "$pkgname-$pkgver"

	# Disable building of deb, AppImage and snap
	sed -i '65,67d' package.json

	# Use system electron
	electronVer=$(tail /usr/lib/electron/version)
	sed -i 's/"electron": "7.0.1"/"electron": "'$electronVer'"/g' package.json
}

build() {
	cd "$pkgname-$pkgver"
	HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache"
	npm run build
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname"

	install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

	for icon_size in 16 24 32 48 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir$icons_dir
		install -m644 resources/icons/${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	# Install desktop file from .pacman
	cd dist
	tar -xf "$pkgname-$pkgver.pacman"
	sed -i 's|"/opt/Android Messages/'$pkgname'" %U|'$pkgname'|g' \
		"usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/applications/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}
