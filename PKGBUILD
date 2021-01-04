# Maintainer: Tyler Cook <tcc@sandpolis.com>
_module=com.sandpolis.server.vanilla
pkgdesc='Sandpolis server'
pkgname=sandpolis-server-git
pkgver=7.0.0
pkgrel=1
url='https://github.com/sandpolis/sandpolis'
install=sandpolis-server.install
arch=('any')
license=('Mozilla Public License Version 2.0')
makedepends=('java-environment>=15' 'git')
depends=('java-runtime>=15')
provides=('sandpolis-server')
conflicts=('sandpolis-server')
source=("git+https://github.com/sandpolis/sandpolis.git" \
	"git+https://github.com/sandpolis/${_module}.git")
sha512sums=('SKIP' 'SKIP')

prepare() {

	# Transplant submodule instead of initializing it
	cp -r "${srcdir}/${_module}" "${srcdir}/sandpolis"
}

pkgver() {
	cd "${srcdir}/sandpolis/${_module}"
	git describe --tags | tr -d 'v'
}

build() {
	cd "${srcdir}/sandpolis"
	./gradlew --no-daemon -g "${startdir}/.gradle" ":${_module}:assembleLib"
}

package() {

	# Setup directories
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/systemd/system"
	install -d "${pkgdir}/usr/share/java/sandpolis-server/plugin"
	install -d "${pkgdir}/var/lib/sandpolis-server/data"
	install -d "${pkgdir}/var/log/sandpolis-server"

	# Install libraries
	cp -r "${srcdir}/sandpolis/${_module}/build/lib" \
		"${pkgdir}/usr/share/java/sandpolis-server"

	# Install invocation script
	cat <<-EOF >"${pkgdir}/usr/bin/sandpolis-server"
		#!/bin/sh
		exec /usr/bin/java \
		    -Dpath.data=/var/lib/sandpolis-server/data \
		    -Dpath.log=/var/log/sandpolis-server \
		    -Dpath.lib=/usr/share/java/sandpolis-server/lib \
		    --module-path /usr/share/java/sandpolis-server/lib \
		    -m ${_module}/${_module}.Main \
		"$@"
	EOF
	chmod 755 "${pkgdir}/usr/bin/sandpolis-server"

	# Install systemd unit
	cat <<-EOF >"${pkgdir}/usr/lib/systemd/system/sandpolis-server.service"
		[Unit]
		Description=Sandpolis Server
		After=network.target
		StartLimitIntervalSec=0

		[Service]
		Type=simple
		Restart=always
		RestartSec=1
		User=sandpolis
		ExecStart=/usr/bin/sandpolis-server

		[Install]
		WantedBy=multi-user.target
	EOF
}
