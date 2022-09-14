# Maintainer: Eike Gebauer <eike(at)zettelkiste.de>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=7.1.0.25066
pkgrel=1
arch=(x86_64)
license=(custom)
url="https://www.baslerweb.com/en/downloads/software-downloads/#os=linuxx8664bit;type=pylonsoftware"

depends=(qt5-base)
makedepends=(patchelf)

source=(
	"https://www.baslerweb.com/fp-1658220865/media/downloads/software/pylon_software/${pkgname}_${pkgver}_${CARCH}_setup.tar.gz"
	"LICENSE"
)


sha512sums=('b3db33a266c84d2bb61fef59d7269175451bdd35f04aa86ced5ffe851ebc8f0ce0321494ad16623496cd3eeb98bf1d1625581269a33891a8817d952d99a8ca1a'
'a88072c34d5b18ebbdcc3003c7bbd899f81557500f963cda988239df7e692637fe29948b866fe80341b28c4820e1593f35fe37473de9ba35f7de8a8b31601ae1')

_dir="$pkgname_$pkgver_$CARCH"

prepare() {
	mkdir -p "$srcdir/$_dir"
	cd "$srcdir/$_dir"
	bsdtar -xf "../${pkgname}_${pkgver}_${CARCH}_setup.tar.gz"
	bsdtar -xf "${pkgname}_${pkgver}_${CARCH}.tar.gz"
	sed -i 's/, TAG+="udev-acl"\|, MODE:="0666"//g' "share/pylon/69-basler-cameras.rules"
}

_shrink_rpaths() {
	for file in "$@"; do
		local type="$(file -hb "$file")"
		[[ "${type:0:4}" = "ELF " ]] || continue
		patchelf --shrink-rpath "$file"
	done
}

package() {
	cd "$srcdir/$_dir"

	mkdir -p "$pkgdir/opt/pylon"
	cp -a --no-preserve=ownership "$srcdir/$_dir/"{bin,include,lib,share,INSTALL}  "$pkgdir/opt/pylon"
	install -m 644  -Dt "$pkgdir/usr/lib/udev/rules.d"         "$srcdir/$_dir/share/pylon/69-basler-cameras.rules"
	install -m 644  -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"

	_shrink_rpaths "$pkgdir/opt/pylon/lib64/"*
	_shrink_rpaths "$pkgdir/opt/pylon/bin/"*
}
