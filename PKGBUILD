# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>

pkgname=('dub')
pkgver=1.4.0
pkgrel=3
pkgdesc="Developer package manager for D programming language"
arch=('i686' 'x86_64')
url="https://github.com/D-Programming-Language/dub"
license=('MIT')
groups=('dlang')
makedepends=('dmd')
depends=('libphobos' 'curl')

source=($pkgname-$pkgver.tar.gz::https://github.com/dlang/dub/archive/v$pkgver.tar.gz)
sha512sums=('0a21149da3bb09b4c384464eab33adc640938baa9e0bbdac6335583aa6ffe4735846244f2897dfdbd12778ec218b256cf2c58c436c5ffa7244b327af49584ffe')

build() {
	DC=dmd
	cd "$pkgname-$pkgver"

	echo Generating version file...
	echo "module dub.version_;" > source/dub/version_.d
	echo "enum dubVersion = \"$pkgver\";" >> source/dub/version_.d

	$DC -ofbin/dub -w -O -g -version=DubUseCurl -Isource -L-lcurl @build-files.txt
}

package() {
	# binaries
	install -Dm755 "$pkgname-$pkgver/bin/dub" "$pkgdir/usr/bin/dub"

	# license
	install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# bash completion
	install -Dm644 "$pkgname-$pkgver/scripts/bash-completion/dub.bash" "$pkgdir/usr/share/bash-completion/completions/dub"
}
