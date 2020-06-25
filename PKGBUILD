# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: David Birks <david at tellus dot space>
# Contributor: Jeff Henson <jeff at henson dot io>
# Contributor: Linus Färnstrand <linus at mullvad dot net>
# Contributor: Emīls Piņķis <emil at mullvad dot net>
# Contributor: Andrej Mihajlov <and at mullvad dot net>
pkgname=mullvad-vpn-beta
_pkgver=2020.5
_channel=stable
pkgver=${_pkgver}.${_channel}
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
makedepends=('git' 'go' 'rust' 'npm' 'python')
provides=("${pkgname%-beta}")
conflicts=("${pkgname%-beta}")
install="${pkgname%-beta}.install"
_commit='f9c55513f372de96223fad3ab6bd2aa78d517387'
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=$_pkgver?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=$_commit?signed"
        "${pkgname%-beta}.sh")
sha256sums=('SKIP'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('EA0A77BF9E115615FC3BD8BC7653B940E494FE87')
              # Linus Färnstrand (code signing key) <linus at mullvad dot net>

prepare() {
	# Point the submodule to our local copy
	cd "$srcdir/mullvadvpn-app"
	git submodule init dist-assets/binaries
	git config submodule.mullvadvpn-app-binaries.url "$srcdir/mullvadvpn-app-binaries"
	git submodule update

	# Disable building of rpm
	sed -i "s/'deb', 'rpm'/'deb'/g" gui/tasks/distribution.js

	mkdir -p dist-assets/shell-completions
}

build() {
	cd "$srcdir/mullvadvpn-app"
	local RUSTC_VERSION=$(rustc --version)
	local PRODUCT_VERSION=$(node -p "require('./gui/package.json').version" | \
		sed -Ee 's/\.0//g')

	echo "Building Mullvad VPN $PRODUCT_VERSION..."

	# Compile wireguard-go
	cd "$srcdir/mullvadvpn-app/wireguard/libwg"
	mkdir -p "../../build/lib/$arch-unknown-linux-gnu"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"${LDFLAGS}\"" \
		-v -o "../../build/lib/$arch-unknown-linux-gnu"/libwg.a \
		-buildmode c-archive

	cd "$srcdir/mullvadvpn-app"
	echo "Updating version in metadata files..."
	./version-metadata.sh inject $PRODUCT_VERSION

	echo "Removing old Rust build artifacts"
	cargo clean --locked

	echo "Building Rust code in release mode using $RUSTC_VERSION..."

	cd mullvad-cli
	for sh in bash zsh; do
		echo "Generating shell completion script for $sh..."
		cargo run --release --locked --features shell-completions -- \
			shell-completions "$sh" ../dist-assets/shell-completions/
	done

	cd "$srcdir/mullvadvpn-app"
	MULLVAD_ADD_MANIFEST="1" cargo build --release --locked --all-features

	echo "Copying binaries"
	binaries=(
		mullvad-daemon
		mullvad
		mullvad-problem-report
		libtalpid_openvpn_plugin.so
		mullvad-setup
		mullvad-exclude
	)
	for binary in ${binaries[*]}; do
		cp "target/release/$binary" "dist-assets/$binary"
	done

	# Update relay list & generate relays.json
	./update-relays.sh

	# Build Electron GUI app
	cd gui
	echo "Installing JavaScript dependencies..."
	npm ci --no-optional --cache "$srcdir/npm-cache"
	echo "Packing final release artifact..."
	npm run pack:linux
}

#check() {
#	cd "$srcdir/mullvadvpn-app"
#	cargo test --release --locked
#
#	cd gui
#	npm test
#}

package() {
	cd "$srcdir/mullvadvpn-app"

	# Install main files
	install -dm755 "$pkgdir/opt/Mullvad VPN"
	cp -a dist/linux-unpacked/* "$pkgdir/opt/Mullvad VPN"

	# Install daemon service
	install -Dm644 dist/linux-unpacked/resources/mullvad-daemon.service -t \
		"$pkgdir/usr/lib/systemd/system"

	# Install binaries
	install -Dm755 dist-assets/{mullvad,mullvad-exclude} -t "$pkgdir/usr/bin"

	# Link to the problem report binary
	ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" \
		"$pkgdir/usr/bin/mullvad-problem-report"

	# Link to the GUI binary
	install -m755 "$srcdir/${pkgname%-beta}.sh" "$pkgdir/usr/bin/${pkgname%-beta}"

	# Install completions
	install -Dm755 dist-assets/shell-completions/mullvad.bash \
		"$pkgdir/usr/share/bash-completion/completions/mullvad"
	install -Dm755 dist-assets/shell-completions/_mullvad -t \
		"$pkgdir/usr/share/zsh/site-functions"

	# Install desktop file & icons from deb
	cd dist
	ar x "MullvadVPN-$_pkgver.0_amd64.deb"
	tar -xf data.tar.xz
	install -Dm644 "usr/share/applications/${pkgname%-beta}.desktop" -t \
		"$pkgdir/usr/share/applications"

	for icon_size in 16 32 48 64 128 256 512 1024; do
		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 $icons_dir/${pkgname%-beta}.png -t $pkgdir/$icons_dir
	done
}
