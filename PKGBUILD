# Maintainer: Tyler Cook <tcc@sandpolis.com>
_module=com.sandpolis.agent.vanilla
pkgdesc='Sandpolis agent'
pkgname=sandpolis-agent
pkgver=7.0.0
pkgrel=1
url='https://github.com/sandpolis/sandpolis'
install=sandpolis-agent.install
arch=('any')
license=('Mozilla Public License Version 2.0')
makedepends=('java-environment>=15' 'git')
depends=('java-runtime>=15')
provides=('sandpolis-agent')
conflicts=('sandpolis-agent')
source=("git+https://github.com/sandpolis/sandpolis.git#commit=a5de3be94f3d9a4b12344a7cebe9c06601900060" \
	"git+https://github.com/sandpolis/${_module}.git#commit=8fe5cd3734f82176644ea0ff1ae221be2fdbefe3")
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
	install -d "${pkgdir}/usr/share/java/sandpolis-agent/plugin"
	install -d "${pkgdir}/var/lib/sandpolis-agent/data"
	install -d "${pkgdir}/var/log/sandpolis-agent"

	# Install libraries
	cp -r "${srcdir}/sandpolis/${_module}/build/lib" \
		"${pkgdir}/usr/share/java/sandpolis-agent"

	# Install invocation script
	cat <<-EOF >"${pkgdir}/usr/bin/sandpolis-agent"
		#!/bin/sh
		exec /usr/bin/java \
		    -Dpath.data=/var/lib/sandpolis-agent/data \
		    -Dpath.log=/var/log/sandpolis-agent \
		    -Dpath.lib=/usr/share/java/sandpolis-agent/lib \
		    --module-path /usr/share/java/sandpolis-agent/lib \
		    -m ${_module}/${_module}.Main \
		"$@"
	EOF
	chmod 755 "${pkgdir}/usr/bin/sandpolis-agent"

	# Install configuration script
	cat <<-EOF >"${pkgdir}/usr/bin/sandpolis-agent-config"
		#!/bin/sh
		exec /usr/bin/java \
		    -Dpath.data=/var/lib/sandpolis-agent/data \
		    -Dpath.log=/var/log/sandpolis-agent \
		    -Dpath.lib=/usr/share/java/sandpolis-agent/lib \
		    -Dconfig_mode=true \
		    --module-path /usr/share/java/sandpolis-agent/lib \
		    -m ${_module}/${_module}.Main \
		"$@"
	EOF
	chmod 755 "${pkgdir}/usr/bin/sandpolis-agent-config"

	# Install systemd unit
	cat <<-EOF >"${pkgdir}/usr/lib/systemd/system/sandpolis-agent.service"
		[Unit]
		Description=Sandpolis Agent
		After=network.target
		StartLimitIntervalSec=0

		[Service]
		Type=simple
		Restart=always
		RestartSec=1
		User=sandpolis
		ExecStart=/usr/bin/sandpolis-agent

		[Install]
		WantedBy=multi-user.target
	EOF
}
