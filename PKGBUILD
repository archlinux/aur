# Maintainer: Vniverse77
pkgname=homelab-remote
pkgver=0.2.1
pkgrel=1
pkgdesc="Wake, shut down and work on your home PC from a laptop and phone over Tailscale (TUI setup wizard)"
arch=('any')
url="https://github.com/Vniverse77/homelab-remote"
license=('MIT')
depends=('bash' 'openssh' 'python' 'util-linux' 'iproute2')
conflicts=('profile-cleaner')  # both ship /usr/bin/pc
optdepends=('tailscale: required for every remote connection'
            'wakeonlan: pc on (wake the server)'
            'mosh: dev sessions that survive bad connections'
            'gum: nicer setup wizard'
            'qrencode: QR code for linking the phone'
            'ffmpeg: camera stream'
            'v4l-utils: camera format detection'
            'mediamtx: camera RTSP server (AUR)'
            'ufw: firewall rules for the camera port')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('213118d00fb74f4e037686afac0b5711aa91f340b9dc15df36d9e37173adcb0b')

package() {
	cd "$pkgname-$pkgver"
	local f
	for f in pc dev camera pc-phone homelab; do
		install -Dm755 "bin/$f" "$pkgdir/usr/bin/$f"
	done
	# Data used by "homelab setup" / "homelab doctor" (found at /usr/share/homelab-remote).
	local share="$pkgdir/usr/share/homelab-remote"
	install -Dm644 config.example "$share/config.example"
	install -Dm755 -t "$share/server" server/pc-remote server/server-setup
	install -Dm755 -t "$share/bin" bin/pc bin/dev bin/camera bin/pc-phone bin/homelab
	install -Dm644 -t "$share/extras/fish" extras/fish/host-badge.fish
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*.md
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
