# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname="vconsole-colors"
pkgdesc="Simple utilities for setvtrgb from kbd"

pkgver=2.0
pkgrel=2

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

validpgpkeys=('B6F1C3E092DA04BB7371D4F202471E1B7E9034B2') # GaKu999 <gaku999 [at] posteo [dot] net>

source=("https://github.com/GaKu999/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/GaKu999/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.sig")

sha512sums=('0d73e290dc7dfc3453743866d13178d11c5387b41f236fd750d097d7f0a95dcca10a1a03b23b0a78365d2df7f3aaac1df93be4a1cf3128037c19d415dfaa28a8'
            'SKIP')
b2sums=('907d4eceb2ea25cf5fbe49dc642475c68641132814e16325ac8b7df6d65d1595bf190f2ea315531ee608733541c78bfcf35f2da4df677423e203439b46fda734'
        'SKIP')

prepare() {
	cd "./$pkgname-$pkgver"

	sed -i 's|@ENVFILE@|/etc/vconsole.conf|g' ./vconsole-colors
	sed -i 's|@TTY@|/dev/tty0|g' ./vconsole-colors
}

package() {
	cd "./$pkgname-$pkgver"

	install -vD -m 0755 -t "$pkgdir/usr/bin" ./getvtrgb
	install -vD -m 0755 -t "$pkgdir/usr/bin" ./vtrgb2hex
	install -vD -m 0755 -t "$pkgdir/usr/bin" ./vconsole-colors

	install -vD -m 0644 -T ./mkinitcpio/busybox-hook    "$pkgdir/usr/lib/initcpio/hooks/consolecolors"
	install -vD -m 0644 -T ./mkinitcpio/busybox-install "$pkgdir/usr/lib/initcpio/install/consolecolors"

	install -vD -m 0644 -T ./mkinitcpio/systemd-install "$pkgdir/usr/lib/initcpio/install/sd-vconsole-colors"

	install -vD -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/initrd-vconsole-colors.service
	install -vD -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/vconsole-colors.service
}
