# Maintainer: Tyler Cook <tcc@sandpolis.com>
_module=com.sandpolis.client.lifegem
pkgdesc='Sandpolis desktop client'
pkgname=sandpolis-client-desktop-git
pkgver=7.0.0
pkgrel=1
url='https://github.com/sandpolis/sandpolis'
arch=('any')
license=('Mozilla Public License Version 2.0')
makedepends=('java-environment>=15' 'git')
depends=('java-runtime>=15')
provides=('sandpolis-client-desktop')
conflicts=('sandpolis-client-desktop')
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
	install -d "${pkgdir}/usr/share/java/sandpolis-client-desktop/plugin"
	install -d "${pkgdir}/var/lib/sandpolis-client-desktop/data"
	install -d "${pkgdir}/var/log/sandpolis-client-desktop"

	# Install libraries
	cp -r "${srcdir}/sandpolis/${_module}/build/lib" \
		"${pkgdir}/usr/share/java/sandpolis-client-desktop"

	# Install invocation script
	cat <<-EOF >"${pkgdir}/usr/bin/sandpolis-client-desktop"
		#!/bin/sh
		exec /usr/bin/java \
		    -Dpath.data=/var/lib/sandpolis-client-desktop/data \
		    -Dpath.log=/var/log/sandpolis-client-desktop \
		    -Dpath.lib=/usr/share/java/sandpolis-client-desktop/lib \
		    --module-path /usr/share/java/sandpolis-client-desktop/lib \
		    -m ${_module}/${_module}.Main \
		"$@"
	EOF
	chmod 755 "${pkgdir}/usr/bin/sandpolis-client-desktop"
}
