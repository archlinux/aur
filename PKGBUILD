## Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/pkgbuilds
pkgname=omnara-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Claude Code & Codex AI coding agent — control AI agents from desktop or phone"
arch=('x86_64')
url="https://www.omnara.com/"
license=('custom') # closed-source proprietary binary
provides=('omnara')
conflicts=('omnara')
options=('!strip' '!emptydirs') # prebuilt binary — do not strip

source_x86_64=("https://releases.omnara.com/${pkgver}/omnara-linux-x64")
sha256sums_x86_64=('ec4f1622bf8cc81719af3721881508debebc77621cef891821ddeafb241e505f')

package() {
  cd "$srcdir"

  # Install the binary to system PATH
  install -Dm755 "omnara-linux-x64" "$pkgdir/usr/bin/omnara"

  # Systemd user service upstream daemon behavior.
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/com.omnara.daemon.service" <<'SERVICE'
[Unit]
Description=Omnara CLI Background Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/omnara daemon run-service
Restart=on-failure
RestartSec=5
StandardOutput=append:%h/.omnara/logs/daemon/daemon.log
StandardError=append:%h/.omnara/logs/daemon/daemon.log
WorkingDirectory=%h

[Install]
WantedBy=default.target
SERVICE

  # Post-install instructions
  install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README.postinst" <<'MSG'
Omnara has been installed system-wide.

# Enable and start the background daemon (required for mobile control):
systemctl --user enable --now com.omnara.daemon.service

# Recommended: keep the daemon alive even when you log out
sudo loginctl enable-linger $USER

# Run Omnara in any project directory
omnara

Logs: ~/.omnara/logs/daemon/daemon.log
MSG
}

post_install() {
  cat /usr/share/doc/omnara-bin/README.postinst
}

post_upgrade() {
  post_install
}
