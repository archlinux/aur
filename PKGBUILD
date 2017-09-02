# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>

pkgname=('dub')
pkgver=1.5.0
pkgrel=1
pkgdesc="Developer package manager for D programming language"
arch=('i686' 'x86_64')
url="https://github.com/D-Programming-Language/dub"
license=('MIT')
groups=('dlang')
makedepends=('dmd')
depends=('libphobos' 'curl')

source=("$pkgname-$pkgver.tar.gz::https://github.com/dlang/dub/archive/v$pkgver.tar.gz")
sha512sums=('cc23c177a2fff94119e8abc0b9d3812027badd98c4d30903e75c348318ae790b98fb435540860b9beb6923fe0a4d70b80f572cda343b4b5a0f513755b484baf2')

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
