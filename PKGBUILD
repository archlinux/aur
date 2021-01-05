# Maintainer: aspen <aspen@aspenuwu.me>
# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

_pkgbase=zulip-desktop
pkgname=$_pkgbase-electron
pkgver=5.5.0
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model, using system electron'
arch=(i686 x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss electron)
makedepends=(npm python2)
provides=($_pkgbase)
conflicts=($_pkgbase)
source=($_pkgbase-$pkgver.tar.gz::https://github.com/zulip/$_pkgbase/archive/v$pkgver.tar.gz
		$_pkgbase.desktop)
sha512sums=('d3a73896b97b9e0353f168e3b5d98ef6d5f5dc8bdeb6314a832a8664f01b5aa62e802ff883647a7379b1671ce1bb0404256771ed3c84590d2fcf83349d62fa06'
            '51708745a8e8e09a5ac949c6f4814e86118008c07c3b03d84559468dcaef880431f401ab06bd552b32376d93831a14b6b9337c66dfe23531016266a155f22aa3')

build() {
	cd $_pkgbase-$pkgver
	npm i
	npm run pack
}

package() {
	cd $_pkgbase-$pkgver

	install -d "$pkgdir"/usr/{lib,bin}
	cp -a dist/linux-unpacked "$pkgdir"/usr/lib/$_pkgbase
	ln -s /usr/lib/$_pkgbase/zulip "$pkgdir"/usr/bin

	install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgbase

	install -Dm 644 ../$_pkgbase.desktop -t "$pkgdir"/usr/share/applications
	for i in 16 24 32 48 64 96 128 256 512; do
	install -Dm 644 build/icons/${i}x${i}.png \
		"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png
	done
}
