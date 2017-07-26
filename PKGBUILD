# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=snap-telemetry-git
pkgver=1.3.0.r12.gf9aa843d
pkgrel=1
pkgdesc="An open telemetry framework designed to simplify the collection, processing and publishing of system data through a single API."
arch=('x86_64' 'i386')
url="https://github.com/intelsdi-x/snap"
license=('Apache')
conflicts=('snap-telemetry')
provides=('snaptel' 'snapteld')
makedepends=(go git make)

prepare() {
	if [ -z "$GOPATH" ] ; then
		GOPATH=$srcdir
	else
		GOPATH=$GOPATH
	fi
	/usr/bin/go get -d github.com/intelsdi-x/snap
}

pkgver() {
	cd "$srcdir/src/github.com/intelsdi-x/snap"
        git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	GOPATH=$srcdir
	PATH="$PATH:$GOPATH/bin"
	/usr/bin/go get -d github.com/intelsdi-x/snap
	cd "$GOPATH"/src/github.com/intelsdi-x/snap
	make
	cp "$GOPATH"/src/github.com/intelsdi-x/snap/build/linux/"$CARCH"/snaptel* "$srcdir"
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
	install -m 755 "$srcdir"/snapteld "$pkgdir/usr/bin"
	install -m 755 "$srcdir"/snaptel "$pkgdir/usr/bin"
}
