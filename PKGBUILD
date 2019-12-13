# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
projectname=pterodactyl
pkgname=pterodactyl-daemon
pkgname1=daemon
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel."
pkgver=0.6.12
pkgpath="github.com/${githuborg}/${pkgname1}"
pkgrel=1
arch=('any')
url="https://${pkgpath}"
license=()
makedepends=()
#https://pterodactyl.io/community/installation-guides/panel/debian10.html#server-configuration
depends=(docker nodejs npm)
source=("${url}/releases/download/v${pkgver}/${pkgname1}.tar.gz")
sha256sums=('aef507f4b9f1272b678cf8b23c0cf0db58d1bba4e8a02d6744018f63db4ff66a')

build() {
	mkdir -p ${srcdir}/npm-cache
	echo -e "[Unit]
	Description=Pterodactyl Wings Daemon
	After=docker.service

	[Service]
	User=root
	#Group=some_group
	WorkingDirectory=/srv/daemon
	LimitNOFILE=4096
	PIDFile=/var/run/wings/daemon.pid
	ExecStart=/usr/bin/node /srv/daemon/src/index.js
	Restart=on-failure
	StartLimitInterval=600

	[Install]
	WantedBy=multi-user.target
	" > ${srcdir}/wings.service

	echo -e '#!/bin/bash
	#launch pterodactyl daemon
	cd /srv/daemon
	sudo npm start
	' > ${srcdir}/${pkgname}.sh
	chmod +x ${srcdir}/${pkgname}.sh
}

package() {
	#https://pterodactyl.io/panel/getting_started.html#download-files
	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	mkdir -p ${pkgdir}/srv/daemon
	mkdir -p ${pkgdir}/srv/daemon-data
	npm install --cache "${srcdir}/npm-cache"  --only=production -g --user root --prefix ${pkgdir}/srv/daemon ${srcdir}/${pkgname1}.tar.gz #"$pkgdir"/usr
	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/srv/daemon -type d -exec chmod 755 {} +
	# npm gives ownership of ALL FILES to build user
	chown -R root:root "$pkgdir"
	# https://bugs.archlinux.org/task/63396
	#cd ${pkgdir}/srv/daemon
	#tar --strip-components=1 -xzvf ${srcdir}/panel.tar.gz
	#chmod -R 755 ${pkgdir}/srv/daemon/storage/* ${pkgdir}/srv/daemon/bootstrap/cache/
	  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/srv/daemon
		ln -rTsf ${pkgdir}/srv/daemon/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/wings.service ${pkgdir}/usr/lib/systemd/system/
}
