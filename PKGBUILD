# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=ddns
pkgname=newfuture-ddns-bin
pkgver=2.10.3
pkgrel=1
pkgdesc="Automatically update domain name resolution to local IP."
url="https://github.com/NewFuture/DDNS"
license=('MIT')
arch=('x86_64')
conflicts=("${_pkgbase}" "${pkgname}")
depends=('glibc')
options=('!strip')
noextract=("${_pkgbase}")
source=("https://github.com/NewFuture/DDNS/releases/download/v${pkgver}/${_pkgbase}")
md5sums=('a59227a7704a0c06201dd1486e235c9a')
install="${pkgname}.install"

build() {
	# Create systemd service and timer
	echo "[Unit]
Description=NewFuture DDNS Service
Wants=network-online.target
After=network-online.target
	
[Service]
DynamicUser=true
Type=oneshot
ExecStart=/usr/bin/ddns -c /etc/ddns/config.json
TimeoutSec=180
	
[Install]
WantedBy=multi-user.target" > newfuture_ddns.service

	echo "[Unit]
Description=NewFuture DDNS Timer
Wants=network-online.target
After=network-online.target

[Timer]
OnStartupSec=60
OnUnitActiveSec=300

[Install]
WantedBy=timers.target" > newfuture_ddns.timer
}

package() {
	chmod 755 ${_pkgbase}
	install -Dm755 -d "${pkgdir}/etc/ddns"
	install -Dm755 "${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
	install -Dm644 newfuture_ddns.service  "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.service"
	install -Dm644 newfuture_ddns.timer "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.timer";
}
