# Maintainer: Eike Gebauer <eike(at)zettelkiste.de>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=6.3.0.23157
pkgrel=1
arch=(x86_64)
license=(custom)
url=http://www.baslerweb.com/en/products/software

depends=(qt5-base)
makedepends=(patchelf)

# Strip fails on some embedded libraries for 5.1.0
# options=( "!strip" )

source=(
	"https://www.baslerweb.com/fp-1636374975/media/downloads/software/pylon_software/${pkgname}_${pkgver}_${CARCH}_setup.tar.gz"
	"LICENSE"
)


sha512sums=('e320a71d6f8bbdcfaefaf51aa61627c90c639e9ad09b8f7deb7811d1782a33ec5704d9b237594208cd3b9845ba9d4b934619c331ac2a237084f93dd3b9e8163a'
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

	mkdir -p "$pkgdir/opt/pylon6"
	cp -a --no-preserve=ownership "$srcdir/$_dir/"{bin,include,lib,share,INSTALL}  "$pkgdir/opt/pylon6"
	install -m 644  -Dt "$pkgdir/usr/lib/udev/rules.d"         "$srcdir/$_dir/share/pylon/69-basler-cameras.rules"
	install -m 644  -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"

	_shrink_rpaths "$pkgdir/opt/pylon6/lib64/"*
	_shrink_rpaths "$pkgdir/opt/pylon6/bin/"*
}
