# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>

pkgname=('dub-git')
pkgver=1.11.0.alpha.1.r11.2cbab87
pkgrel=1
pkgdesc="Package manager for D packages, git version"
arch=('x86_64')
url="https://github.com/D-Programming-Language/dub"
license=('MIT')
groups=('dlang')
makedepends=('git' 'dmd')
depends=('libphobos' 'curl')
provides=('dub')
conflicts=('dub')

source=('git+https://github.com/D-Programming-Language/dub')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/dub"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
	DC=dmd
	cd "$srcdir/dub"

	echo Generating version file...
	echo "module dub.version_;" > source/dub/version_.d
	echo "enum dubVersion = \"$pkgver\";" >> source/dub/version_.d

	$DC -ofbin/dub -w -O -g -version=DubUseCurl -Isource -L-lcurl @build-files.txt
}

package() {
	# binaries
	install -Dm755 "$srcdir/dub/bin/dub" "$pkgdir/usr/bin/dub"

	# license
	install -Dm644 "$srcdir/dub/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# bash completion
	install -Dm644 "$srcdir/dub/scripts/bash-completion/dub.bash" "$pkgdir/usr/share/bash-completion/completions/dub"
}
