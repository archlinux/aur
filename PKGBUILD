# Maintainer: ushineko <https://github.com/ushineko>
pkgname=fpsd-git
pkgver=1.3.7
pkgrel=1
pkgdesc="Content-aware HTTPS interception proxy for ad blocking"
arch=('x86_64')
url="https://github.com/ushineko/face-puncher-supreme"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'npm' 'nodejs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("face-puncher-supreme::git+https://github.com/ushineko/face-puncher-supreme.git")
sha256sums=('SKIP')
install=fpsd.install

pkgver() {
	cd face-puncher-supreme
	# Read VERSION from Makefile (single source of truth)
	_ver=$(grep -oP '(?<=^VERSION := ).*' Makefile | tr -d '[:space:]')
	printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd face-puncher-supreme
	make build
}

package() {
	cd face-puncher-supreme

	# Binary
	install -Dm755 fpsd "${pkgdir}/usr/bin/fpsd"

	# Tproxy management script
	install -Dm755 scripts/fps-ctl "${pkgdir}/usr/bin/fps-ctl"

	# Reference config (user copies to ~/.config/fpsd/)
	install -Dm644 fpsd.yml "${pkgdir}/usr/share/doc/${pkgname}/fpsd.yml.example"

	# License and documentation
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Systemd user service unit
	install -dm755 "${pkgdir}/usr/lib/systemd/user"
	cat > "${pkgdir}/usr/lib/systemd/user/fpsd.service" <<'UNIT'
[Unit]
Description=Face Puncher Supreme proxy
After=network-online.target
Wants=network-online.target

[Service]
Type=exec
ExecStart=/usr/bin/fpsd -c %h/.config/fpsd/fpsd.yml
WorkingDirectory=%h/.local/share/fpsd
Restart=on-failure
RestartSec=5
StandardOutput=journal
StandardError=journal
SyslogIdentifier=fpsd
NoNewPrivileges=yes
ProtectSystem=strict
PrivateTmp=yes

[Install]
WantedBy=default.target
UNIT
}
