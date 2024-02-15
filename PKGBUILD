# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname="vconsole-colors"
pkgdesc="Simple utility for setvtrgb from kbd"

pkgver=1.1
pkgrel=1

url="https://github.com/GaKu999/$pkgname"
arch=("any")
license=("Unlicense")
#backup=()
#install="$pkgname.install"
#options=()

#conflicts=()
#replaces=()
#provides=()

#makedepends=()
depends=("sh" "coreutils" "kbd" "mkinitcpio" "systemd")
#optdepends=()

validpgpkeys=("B6F1C3E092DA04BB7371D4F202471E1B7E9034B2") # GaKu999 <gaku999 [at] posteo [dot] net>

source=("https://github.com/GaKu999/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/GaKu999/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.sig")

sha512sums=("15d9eb74dd1d3d09d28cdf405c9187b99297269fd97f4cec2ac5d91b340690adfe77efc5063e05e0e69c9e48c13fbfe46c99e1a4bf82f69f1db0faef24eb5f89"
            "SKIP")
b2sums=("4ee0c950b55db91285a3bc5e085d6cecb747e6c0f99e3243518401fbd4f09684da39b8d630f59df7699beb40fc3a18c2c057a8e2490704b582af9cbacc5d87b2"
        "SKIP")

prepare() {
	cd "./$pkgname-$pkgver"

	sed -i 's|@ENV_FILE@|/etc/vconsole.conf|g' ./vconsole-colors
}

package() {
	cd "./$pkgname-$pkgver"

	install -vD -m 0755 -t "$pkgdir/usr/bin" ./vconsole-colors

	install -vD -m 0644 -T ./mkinitcpio/busybox-hook    "$pkgdir/usr/lib/initcpio/hooks/consolecolors"
	install -vD -m 0644 -T ./mkinitcpio/busybox-install "$pkgdir/usr/lib/initcpio/install/consolecolors"

	install -vD -m 0644 -T ./mkinitcpio/systemd-install "$pkgdir/usr/lib/initcpio/install/sd-vconsole-colors"

	install -vD -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/initrd-vconsole-colors.service
	install -vD -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/vconsole-colors.service
}
