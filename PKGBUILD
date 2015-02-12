# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
# Contributor: eworm

pkgname=opera
pkgver=27.0.1689.69
pkgrel=1
pkgdesc="A fast and secure web browser and Internet suite."
url="http://www.opera.com/"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('x86_64')
source=(
	"http://deb.opera.com/opera/pool/non-free/o/${pkgname}-stable/${pkgname}-stable_${pkgver}_amd64.deb"
	"opera"
	"default"
)
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'libxtst' 'gconf' 'libxss' 'gcc-libs' 'alsa-lib' 'nss' 'freetype2' 'ttf-font')
optdepends=(
	'curl: opera crash reporter and autoupdate checker'
	'ffmpeg: playback of proprietary formats'
)

prepare() {
	sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
	sed -e "s/%operabin%/x86_64-linux-gnu\/$pkgname\/$pkgname/g" \
		-i "$srcdir/opera"
}

package() {
	tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/usr/lib/x86_64-linux-gnu/$pkgname/$pkgname"

	# suid opera_sandbox
	chmod 4755 "$pkgdir/usr/lib/x86_64-linux-gnu/$pkgname/opera_sandbox"

	# install default options
	install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

	# install opera wrapper
	rm "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

	# license
	install -Dm644 \
		"$pkgdir/usr/lib/x86_64-linux-gnu/$pkgname/opera_autoupdate.licenses" \
		"$pkgdir/usr/share/licenses/$pkgname/opera_autoupdate.licenses"

	install -Dm644 \
		"$pkgdir/usr/share/doc/${pkgname}-stable/copyright" \
		"$pkgdir/usr/share/licenses/$pkgname/copyright"
}

sha256sums=('5d3a2e48c7fafec97cb5b158477c40d0461c1cd16e7fb3ac7cf6117f8281b67a'
            '508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5'
            '4913d97dec0ddc99d1e089b029b9123c2c86b7c88d631c4d1111b119b09da027')
