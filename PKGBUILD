# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=blink1-git
pkgver=1.83.r63.g1ec7826
pkgrel=1
pkgdesc="software for blink(1) USB RGB LED - git checkout"
arch=('i686' 'x86_64')
url="http://rzl.so/wiki/RZLblink"
license=('GPL')
makedepends=('git')
provides=('blink1')
conflicts=('blink1')
source=('git+https://github.com/todbot/blink1.git')
sha256sums=('SKIP')

pkgver() {
	cd blink1/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd ${srcdir}/blink1/commandline/

	sed -i 's/-static//g' Makefile
}

build() {
	cd ${srcdir}/blink1/commandline/

	make
}

package() {
	cd ${srcdir}/blink1/commandline/

	# binary
	install -D -m0755 blink1-tool ${pkgdir}/usr/bin/blink1-tool

	cd ${srcdir}/blink1/linux/

	# udev rule
	install -D -m0644 51-blink1.rules ${pkgdir}/usr/lib/udev/rules.d/51-blink1.rules
}
