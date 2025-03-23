# Maintainer: witt <1989161762 at qq dot com>
pkgname=typora-cn
_pkgname=typora
pkgver=1.10.8
pkgrel=1
pkgdesc="A minimal markdown editor and reader."
arch=('x86_64' 'aarch64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typoraio.cn/"
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats'
	'typora-theme-lapis: A clean Typora theme in blue tones for Typora'
	'typora-theme-phycat: 一款精心打磨过的多色多功能Typora主题'
	'typora-theme-drake: Material Google JetBrains Vue Juejin Purple Ayu Dark for Typora'
)
previous=('typora' 'typora-cn')
conflicts=('typora')
source=("$_pkgname.sh")
source_x86_64=("typora-${pkgver}.deb::https://typoraio.cn/linux/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("typora-${pkgver}.deb::https://typoraio.cn/linux/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('dd44018cd3e9eb13c71c12c4c93fc8176698cf5fed73729fe2b8262595a99ead')
sha256sums_x86_64=('edabb14ed75569fbccd9f229415bc47b2d50e9e2d51b798b7637595dca9213f4')
sha256sums_aarch64=('edabb14ed75569fbccd9f229415bc47b2d50e9e2d51b798b7637595dca9213f4')

prepare() {
	# extract deb archive
	[ -f "data.tar.xz" ] && bsdtar -xf data.tar.xz
	[ -f "data.tar.zst" ] && bsdtar -xf data.tar.zst

	# remove change log from application comment
	sed -i '/Change Log/d' "${srcdir}/usr/share/applications/typora.desktop"
}

package() {
	install -Dm755 "${srcdir}/$_pkgname.sh" "$pkgdir/usr/bin/${_pkgname}"

	cd "${srcdir}/";
	# icons
	find "usr/share/icons" -type f -exec install -Dm644 {} "${pkgdir}/{}" \;

	# icons
	find "usr/share/${_pkgname}/" -type f -exec install -Dm644 {} "${pkgdir}/{}" \;

	# typora command
	install -Dm755 "${srcdir}/usr/share/typora/Typora" "$pkgdir/usr/share/typora/"

	# move license to correct path
	install -Dm644 "${srcdir}/usr/share/doc/$_pkgname/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# desktop file
	install -Dm644 "${srcdir}/usr/share/applications/typora.desktop" "$pkgdir/usr/share/applications/typora.desktop"
}
