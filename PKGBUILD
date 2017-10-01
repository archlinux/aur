# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=snap-telemetry
pkgver=2.0.0
pkgrel=1
pkgdesc="An open telemetry framework designed to simplify the collection, processing and publishing of system data through a single API."
arch=('x86_64')
url="https://github.com/intelsdi-x/snap"
license=('Apache')
provides=('snaptel' 'snapteld')
source=("https://github.com/intelsdi-x/snap/releases/download/$pkgver/snap-$pkgver-linux-amd64.tar.gz")
md5sums=('25ff8d53d6a39e7ff216a22e2bc775fa')

build() {
	tar xf snap-$pkgver-linux-amd64.tar.gz
	cat <<EOF > "$srcdir/snap-telemetry.service"
[Unit]
Description=Snap telemetry daemon
Documentation=man:snapteld(8) man:snaptel(1)
Wants=network-online.target
After=network-online.target

[Service]
# NOTE: When available use override files or unit.d such as:
# /etc/systemd/system/snap-telemetry.service
# /etc/systemd/system/snap-telemetry.d/
Type=simple
EnvironmentFile=-/etc/default/snap-telemetry
EnvironmentFile=-/etc/sysconfig/snap-telemetry
ExecStart=mkdir -p /var/log/snap
ExecStart=/usr/bin/snapteld --plugin-trust 0 --log-level 1 --log-path /var/log/snap
ExecStop=/bin/kill -INT \$MAINPID
User=root
Group=root
Restart=on-failure
LimitNOFILE=102400
TimeoutStopSec=60

[Install]
WantedBy=multi-user.target
EOF
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m 644 snap-telemetry.service "$pkgdir/usr/lib/systemd/system/snap-telemetry.service"
	install -m 755 snapteld "$pkgdir/usr/bin"
	install -m 755 snaptel "$pkgdir/usr/bin"
}
