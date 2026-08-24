# Maintainer: Szymon Wilczek <swilczek.lx@gmail.com>
#
# scripts/build-packages renders it into ready PKGBUILD by substituting
# the version and the release tarball's SHA-256, so the checksum can
# never disagree with the artifact it is published next to.
#
# 0.3.1 and f6996b77e89cc2202224ca5d6e2485b5ee51f92c311f1a1aaf0a86c932ac2605 are the only placeholders.
pkgname=alloyctl-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="SteelSeries device configuration TUI for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/szymonwilczek/alloyctl"
license=('GPL-2.0-only')
depends=('ncurses')
provides=('alloyctl')
conflicts=('alloyctl')
source=("https://github.com/szymonwilczek/alloyctl/releases/download/v${pkgver}/alloyctl-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('f6996b77e89cc2202224ca5d6e2485b5ee51f92c311f1a1aaf0a86c932ac2605')

package() {
	cd "alloyctl-${pkgver}-linux-x86_64"

	install -Dm755 alloyctl "${pkgdir}/usr/bin/alloyctl"
	install -Dm644 70-alloyctl-uinput.rules \
		"${pkgdir}/usr/lib/udev/rules.d/70-alloyctl-uinput.rules"

	# generate the per-device hidraw rule from the binary's own driver registry,
	# matching what 'make install' and install.sh do
	install -d "${pkgdir}/usr/lib/udev/rules.d"
	./alloyctl --dump-udev \
		>"${pkgdir}/usr/lib/udev/rules.d/71-alloyctl-hidraw.rules"

	install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	if [ -f man/alloyctl.1 ]; then
		install -Dm644 man/alloyctl.1 "${pkgdir}/usr/share/man/man1/alloyctl.1"
	elif [ -f alloyctl.1 ]; then
		install -Dm644 alloyctl.1 "${pkgdir}/usr/share/man/man1/alloyctl.1"
	fi
}
