# Maintainer: irgendwr <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora
pkgver=1.14.9
_pkgver_x86_64="$pkgver"
_pkgver_aarch64="$pkgver"
pkgrel=1
pkgdesc="A minimal markdown editor and reader."
arch=('x86_64' 'aarch64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
source=("$pkgname.sh")
_urlbase="https://download.typora.io/linux/typora_"
source_x86_64=("${_urlbase}${_pkgver_x86_64}_amd64.deb")
source_aarch64=("${_urlbase}${_pkgver_aarch64}_arm64.deb")
sha512sums=('de9c883c63f3ea35bd551c8761e605f8e1a3468943e000abcbf94bb0c5cbb5f0f6c7fa4d49ab39c177f167e0e3d0b061c861bf828627b4a34f7f1589119c3d04')
sha512sums_x86_64=('075db5be472077b4c8f898b2995a6d47c2b932482a1536badf417db4bdc51edfef50083a18e2f2b9eda741c90fad2b1796e92f2826ec9ab03d543931916237c4')
sha512sums_aarch64=('4471a428eeb839d34bd096d84db6a235a05122da53b1a9ac01147d5efc893f1fd78240f4fcee053ed1d766292069801e33d4043aac3396e2e8837943e97bfa1d')

package() {
	# unpack archive
	if [[ "$CARCH" == "x86_64" ]]; then
		bsdtar -xf data.tar.zst -C "$pkgdir/"
	elif [[ "$CARCH" == "aarch64" ]]; then
		bsdtar -xf data.tar.xz -C "$pkgdir/"
	fi
	# remove lintian overrides
	rm -rf "$pkgdir/usr/share/lintian/"
	# replace bin link with custom launch script
	rm -rf "$pkgdir/usr/bin/$pkgname"
	install -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	# move license to correct path
	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# delete previous copyright path
	rm "$pkgdir/usr/share/doc/$pkgname/copyright"
	# delete doc dir if empty
	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/doc"
	# remove change log from application comment
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	# fix permissions
	chmod 644 "$pkgdir/usr/share/applications/typora.desktop"
	chmod 644 "$pkgdir/usr/share/typora/resources/packages/node-spellchecker/vendor/hunspell_dictionaries/en_US.dic"
	chmod 644 "$pkgdir/usr/share/typora/resources/packages/node-spellchecker/vendor/hunspell_dictionaries/en_US.aff"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
