# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=mark-ty
_pkgname=typora
pkgver=1.4.7
pkgrel=1
pkgdesc="A minimal markdown editor and reader."
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
provides=("typora" "typora-free")
conflicts=("typora" "typora-free")
_filename="${_pkgname}_${pkgver}_amd64.deb"
install=typora.install
source=("https://typora.io/linux/$_filename"
		"https://github.com/zzy-ac/repo/releases/download/source/typora-crack")
sha512sums=('fec39383931f0a9a41d2d8bb2d71895200bdadf7d9dedc5bf321ccd626de61a9afc2a476cfd0db028c5382484350a42e00eb3e166c588b960d43d4ccb3c8f277'
            '5594d11792fcab8ec4b159fd3b51160b76b0c7474f124fe8c86b421341d549c227c88732346b384502aa4cf6887cfb73098429d121ae42e6761f26db9fca68e4')
package() {
	# unpack archive
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	# remove lintian overrides
	rm -rf "$pkgdir/usr/share/lintian/"
	# move license to correct path
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	# delete previous copyright path
	rm "$pkgdir/usr/share/doc/$_pkgname/copyright"
	# delete doc dir if empty
	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/doc"
	# remove change log from application comment
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	# fix dir permissions
	mv ${srcdir}/typora-crack $pkgdir/usr/bin
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
