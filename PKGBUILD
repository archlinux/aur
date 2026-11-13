# Maintainer: Inc44
pkgname=amplide-bin
pkgver=4.1.0.202412231704
pkgrel=1
pkgdesc="Legacy IDE for A Mathematical Programming Language"
arch=(x86_64)
url=https://ampl.com
license=(
	Apache-2.0
	'Apache-2.0 OR LGPL-2.1-only'
	CC-BY-3.0
	'GPL-2.0-only WITH Classpath-exception-2.0'
	LicenseRef-AMPL
	SAX-PD
)
depends=(
	alsa-lib
	ampl
	glibc
	libx11
	libxext
	libxi
	libxrender
	libxtst
	webkit2gtk-4.1
	zlib
)
provides=("amplide=$pkgver")
conflicts=(amplide)
options=(
	!debug
	!strip
)
source=(
	"amplide-$pkgver-x86_64.tgz::https://portal.ampl.com/dl/amplce/amplide.linux64.tgz"
	amplide.desktop
)
sha256sums=(
	SKIP
	388291ee650c3e9e33ae2ae1866bf93dd085c45301b9ed22bf5286c8a00bb05a
)

prepare() {
	grep -qF "id='com.ampl.ide' version='$pkgver'" "$srcdir/ampl.linux-intel64/amplide/artifacts.xml"
}

package() {
	install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
	cp -a --no-preserve=ownership "$srcdir/ampl.linux-intel64/amplide" "$pkgdir/opt/amplide"
	ln -s /opt/amplide/amplide "$pkgdir/usr/bin/amplide"
	install -Dm644 "$srcdir/amplide.desktop" "$pkgdir/usr/share/applications/amplide.desktop"
	echo -e 'AMPL Terms and End-User License Agreement\nhttps://ampl.com/terms-eula' > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	(
		shopt -s globstar nocaseglob nullglob
		declare -A hashes names=([LICENSE]=1)
		read -r hash _ < <(sha256sum "$pkgdir/usr/share/licenses/$pkgname/LICENSE")
		hashes[$hash]=1
		for file in "$pkgdir/opt/amplide"/**/*license*; do
			[ -f "$file" ] && [ ! -L "$file" ] || continue
			read -r hash _ < <(sha256sum "$file")
			(( hashes[$hash]++ )) && continue
			name=$(basename "$file")
			counter=$(( names[$name]++ ))
			suffix=${counter#0}
			ln -sr "$file" "$pkgdir/usr/share/licenses/$pkgname/$name${suffix:+.$suffix}"
		done
	)
}
