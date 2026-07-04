# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=securelink
pkgver=3.8.13
pkgrel=1
pkgdesc="SecureLink client for Wangsu SDP / Zero Trust secure access (Ubuntu GUI version)"
arch=('x86_64')
url="https://www.wangsu.com/app/securelink"
license=('custom')
depends=('libnotify' 'libxtst' 'nss' 'dmidecode' 'mesa' 'libappindicator-gtk3')
options=('!strip')
install=securelink.install
source=("https://download-sdwan.wangsu.com/public/securelink/pkg/formal/COMMON/ubuntuX64/SecureLink-ubuntu-x64-${pkgver}-66.deb")
sha256sums=('5304f18254f6c46fb4e66cf61ed65b73d882d9b5530e4556016051e4df3959b8')

package() {
    cd "$srcdir"

    # Extract the Debian package
    ar x "SecureLink-ubuntu-x64-${pkgver}-66.deb"

    # Install payload into the package root
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # The .deb ships some internal ELF executables without the executable bit,
    # which causes SecureLink to report error 3313 ("SecureLink_Client blocked
    # by security software") because the Electron shell cannot spawn them.
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/bin/SecureLink_Client"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/bin/uninstall"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/plugin/bin/SecureLink_Agent"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/plugin/bin/SecureLink_Core"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/plugin/bin/SecureLink_DP"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/plugin/bin/SecureLink_Report_Tool"
    chmod 755 "$pkgdir/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/plugin/bin/hwinfo"

    # Electron's setuid sandbox helper must be owned by root and have the
    # setuid bit set; otherwise the renderer/GPU sandbox cannot be created.
    chmod 4755 "$pkgdir/opt/SecureLink/chrome-sandbox"

    # Record the original package name so the install script can feed it to
    # SecureLink_Client -install without hard-coding the version.
    install -Dm644 /dev/stdin "$pkgdir/opt/SecureLink/.pkgmeta" <<EOF
DEB_NAME=SecureLink-ubuntu-x64-${pkgver}-66.deb
EOF

    # The upstream service file contains shell-style quoting and redirection
    # that systemd does not parse correctly, so install a corrected version.
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/securelink.service" <<'EOF'
[Unit]
Description=SecureLink Daemon
After=network.target

[Service]
Type=simple
Restart=on-failure
ExecStart=/opt/SecureLink/resources/app.asar.unpacked/assets/app-ext/securelink_linux64/bin/SecureLink_Client -d
ExecStop=/bin/kill -HUP $MAINPID
KillMode=process

[Install]
WantedBy=multi-user.target
EOF

    # Create a convenience symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/SecureLink/securelink "$pkgdir/usr/bin/securelink"
}
