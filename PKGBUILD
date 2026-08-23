# Maintainer: Margot Prego <mopigames@proton.me>
#
# Template.  0.2.4 and 3f7d4a389ac80e45c214ba613fca478ebc83745f8be3fc7a484c476f820e9d41 are filled in per release by
# packaging/aur/render.sh, from the tarball GitHub actually serves.
pkgname=mlos-host-utils
pkgver=0.2.4
pkgrel=1
pkgdesc="USB passthrough agent for the PC you stream from with Moonlight OS"
arch=('x86_64' 'aarch64')
url="https://github.com/MopigamesYT/moonlight-os"
license=('MPL-2.0')
# usbip lives in Arch's own usbip package, so unlike every other platform
# this one does not have to go and find a client at install time.
depends=('usbip')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f7d4a389ac80e45c214ba613fca478ebc83745f8be3fc7a484c476f820e9d41')

build() {
	cd "moonlight-os-$pkgver/host-utils"

	# Arch's Go packaging guidelines: the distribution picks the hardening
	# flags, and -trimpath keeps build paths out of the binary.
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.Version=$pkgver" -o "$pkgname" .
}

check() {
	cd "moonlight-os-$pkgver/host-utils"
	go test ./...
}

package() {
	cd "moonlight-os-$pkgver/host-utils"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# vhci-hcd is what makes a remote device appear as a local one.  The
	# binary can load it itself, but a package that ships the modules-load
	# fragment means it is already there on first boot after installing.
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf" <<-'EOF'
		# Virtual USB host controller, for USB/IP passthrough from Moonlight OS.
		vhci-hcd
	EOF
}
