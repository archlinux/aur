# Maintainer: TobiWan54 <tobiwan54 at proton dot me>

pkgname=makima-bin
_name=${pkgname%-bin}
pkgver=0.10.2
pkgrel=1
pkgdesc='Linux daemon to remap and create macros for keyboards, mice and controllers.'
arch=('x86_64')
url='https://github.com/cyber-sushi/makima'
license=('GPL-3.0-or-later')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/cyber-sushi/makima/releases/download/v${pkgver}/makima")
sha256sums=('ad8255f44a8a619f7d300bbf81463b61e3e6e7af37697fac8d53f6c7f937edaf')

package() {
    install -Dm755 makima "$pkgdir/usr/bin/makima"

    mkdir -p "$pkgdir/etc/udev/rules.d"
    echo 'SUBSYSTEM=="misc", KERNEL=="uinput", MODE="0660", GROUP="input", TAG+="uaccess"' > "$pkgdir/etc/udev/rules.d/50-makima.rules"
    
    mkdir -p "$pkgdir/etc/modules-load.d"
    echo 'uinput' > "$pkgdir/etc/modules-load.d/uinput.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    tee "$pkgdir/usr/lib/systemd/system/makima.service" > /dev/null <<EOF
[Unit]
Description=Makima remapping daemon

[Service]
Type=simple
Environment="MAKIMA_CONFIG=/home/$USER/.config/makima"
ExecStart=/usr/bin/makima
Restart=always
RestartSec=3
User=$USER
Group=input

[Install]
WantedBy=default.target
EOF
}
