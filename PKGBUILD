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
pkgver=30.0.1835.125
pkgrel=1
pkgdesc="A fast and secure web browser and Internet suite."
url="http://www.opera.com/"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'libxtst' 'gconf' 'libxss' 'gcc-libs' 'alsa-lib' 'nss' 'freetype2' 'ttf-font')
optdepends=(
	'curl: opera crash reporter and autoupdate checker'
	'ffmpeg: playback of proprietary formats'
)
arch=('x86_64')
source_x86_64=(
	#"http://deb.opera.com/opera/pool/non-free/o/${pkgname}-stable/${pkgname}-stable_${pkgver}_amd64.deb"
	"http://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.deb"
)
source=(
	"opera"
	"default"
)
sha256sums=('508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5'
            '4913d97dec0ddc99d1e089b029b9123c2c86b7c88d631c4d1111b119b09da027')
sha256sums_x86_64=('762d1bfb8575c66d9528ebe77dd83c264c59598b9f972143f8c8d18aa9195a45')

prepare() {
	sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
	sed -e "s/%operabin%/x86_64-linux-gnu\/$pkgname\/$pkgname/g" \
		-i "$srcdir/opera"
}

package() {
	tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

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

