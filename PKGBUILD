# Maintainer: Johannes Jöns <johannes@joens.email>
# Contributor: Alexandre Bouvier <contact@amb.tf>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Claire Charron <claire@undeterminant.net>
_pkgname=noto-fonts-emoji
pkgname=$_pkgname-flag-git
pkgver=2.038.r9.g412b9edf8+1.2.1.r5.g8aa5413
pkgrel=1
pkgdesc="Google Noto emoji fonts + missing subregion flags"
arch=('any')
url="https://github.com/googlefonts/noto-emoji"
license=('Apache')
makedepends=('cairo' 'git' 'imagemagick' 'pngquant' 'python-nototools' 'zopfli')
provides=("$_pkgname" 'emoji-font')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-flag" "$_pkgname-apple" "$_pkgname-blob" "$_pkgname-lollipop")
source=("$_pkgname::git+$url.git"
		"region-flags::git+https://github.com/jopejoe1-aur/region-flags.git"
		"0001-remove-flag-filter.patch")
sha512sums=('SKIP'
		'SKIP'
		'8490219f593a295642137058b1d1c57f6ef01b52f8d9ae8adcd1081afc32646cea3d7ad89f746ae048862f18aed9613a6607edf7686f31edd73b506eac7e1a57')

pkgver() {
	cd $_pkgname
	emojiversion=$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
	cd ..
	cd region-flags
	flagversion=$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
	echo $emojiversion+$flagversion
}

prepare() {
	cd ${srcdir}/$_pkgname
	patch -p1 -i "$srcdir/0001-remove-flag-filter.patch"
	cd third_party
	rm -fr region-flags
	cp -r ${srcdir}/region-flags ${srcdir}/$_pkgname/third_party/
	cd ..
	make clean
}

build() {
	make -C $_pkgname BYPASS_SEQUENCE_CHECK=1 VIRTUAL_ENV=1
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/fonts/noto $_pkgname/NotoColorEmoji.ttf
}
