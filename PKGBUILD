# Maintainer: telans <telans@protonmail.com>
# Co-Maintainer: yochananmarqos <yochanan.marqos@gmail.com>
# Contributor: David Birks <david at tellus dot space>
# Contributor: Linus Färnstrand <https://github.com/faern>
# Contributor: Emīls Piņķis <https://github.com/pinkisemils>
# Contributor: Andrej Mihajlov <https://github.com/pronebird>
pkgname=mullvad-vpn-beta
pkgver=2019.9.stable
_pkgver=2019.9
pkgrel=7
pkgdesc="The Mullvad VPN client app for desktop"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
makedepends=('git' 'cargo' 'npm' 'rpm-tools')
install="${pkgname%-beta}.install"
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=$_pkgver"
        'git+https://github.com/mullvad/mullvadvpn-app-binaries.git'
        "${pkgname%-beta}.desktop"
        'relays.json.tar.xz') # file too large, had to compress
sha256sums=('SKIP'
            'SKIP'
            '121d90e6683e64d9c0d2dbb7b346fa918bdb37cf21fdaf9f66232304ed23abc2'
            '1d2c77dac7fefefc9a120781f7679731b046f82492a9e8dc447122bbf2973f10')

prepare() {
	# Point the submodule to our local copy
	cd "$srcdir/mullvadvpn-app"
	git submodule init dist-assets/binaries
	git config submodule.mullvadvpn-app-binaries.url \
		"$srcdir/mullvadvpn-app-binaries"
	git submodule update
}

build() {
	cd "$srcdir/mullvadvpn-app"

	# Build mullvad-daemon
	cargo build --release --locked

	# Copy binaries for packaging
	cp dist-assets/binaries/x86_64-unknown-linux-gnu/{openvpn,sslocal} \
		dist-assets/
	cp target/release/*talpid_openvpn_plugin* dist-assets/
	cp target/release/{mullvad,mullvad-daemon,mullvad-problem-report} \
		dist-assets/

	# TODO: Generate relays.json instead of copying it from .deb
	cp "$srcdir/relays.json" dist-assets/

	# Build Electron GUI app
	cd gui
	npm install --cache "$srcdir/npm-cache"
	npm run pack:linux
}

check() {
	cd "$srcdir/mullvadvpn-app"
	cargo test --release --locked

	cd gui
	npm test
}

package() {
	cd "$srcdir/mullvadvpn-app"

	# Install main files
	install -dm755 "$pkgdir/opt/Mullvad VPN"
	cp -a dist/linux-unpacked/* "$pkgdir/opt/Mullvad VPN"

	# Install daemon service
	install -Dm644 dist/linux-unpacked/resources/mullvad-daemon.service -t \
		"$pkgdir/usr/lib/systemd/system"

	#install CLI binary
	install -Dm755 target/release/mullvad -t "$pkgdir/usr/bin"

	# Link to the problem report binary
	ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" \
		"$pkgdir/usr/bin/mullvad-problem-report"

	# Link to the GUI binary
	ln -s "/opt/Mullvad VPN/mullvad-gui" "$pkgdir/usr/bin/${pkgname%-beta}"

	# Install desktop file from .deb
	install -Dm644 "$srcdir/${pkgname%-beta}.desktop" -t \
		"$pkgdir/usr/share/applications"

	# Install icons
	for icon_size in 16 48; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/icon_${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/${pkgname%-beta}.png
	done

	for icon_size in 32 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/icon_${icon_size}.png \
			$pkgdir$icons_dir/${pkgname%-beta}.png
	done
}
