# Maintainer: Jonas Bewig <jomosoto at proton dot me>
pkgname=sc144xx-utils
pkgver=0.1.0_20260321
pkgrel=1
pkgdesc="Tool for running software on sc144xx chips"
arch=('any')
url="https://codeberg.org/CompactCall/sc144xx-utils"
license=('GPL-3.0-or-later')
depends=(python3 python-pyserial python-argcomplete)
makedepends=(meson git cr16-elf-gcc)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/CompactCall/sc144xx-utils/archive/82fb53b866788d7e918764a599012796f8ca81a3.tar.gz" cr16-elf-crossfile.txt)
sha256sums=('0c378bb652077afc738da29ad1a01d55921cfd0b7d1dfb181f202d3096f0b064' SKIP)

prepare() {
	cd "$srcdir/sc144xx-utils/device/sc144xx-serprog/"
	meson setup --cross-file $srcdir/cr16-elf-crossfile.txt --buildtype release --wipe build
}

build() {
	cd "$srcdir/sc144xx-utils/device/sc144xx-serprog/build"
	meson compile

	register-python-argcomplete sc144xx-utils > "$srcdir/sc144xx-utils.bash"
	register-python-argcomplete --shell fish sc144xx-utils > "$srcdir/sc144xx-utils.fish"
}

package() {
	install -Dm755 "$srcdir/sc144xx-utils/sc144xx-utils.py" "$pkgdir/usr/bin/sc144xx-utils"

	install -Dm755 "$srcdir/sc144xx-utils/device/sc144xx-serprog/build/sc144xx-serprog.bin" "$pkgdir/usr/share/sc144xx-serprog.bin"

	install -Dm755 "$srcdir/sc144xx-utils.bash" "$pkgdir/usr/share/bash-completion/completions/sc144xx-utils.bash"
	install -Dm755 "$srcdir/sc144xx-utils.fish" "$pkgdir/usr/share/fish/vendor_completions.d/sc144xx-utils.fish"
}
