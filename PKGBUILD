# Maintainer: Eike Gebauer <eike(at)zettelkiste.de>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=7.3.0.27189
pkgrel=2
arch=(x86_64)
license=(custom)
url="https://www.baslerweb.com/en/downloads/software-downloads/#os=linuxx8664bit;type=pylonsoftware"

depends=(qt5-base)
makedepends=(patchelf)

source=(
	"https://www2.baslerweb.com/media/downloads/software/pylon_software/${pkgname}_${pkgver}_linux-${CARCH}_setup.tar.gz"
	"LICENSE"
)


sha512sums=('162debb0d87d61f3c3cbcc47dab840f2df40841933ab763a7fea3cff23c0bba02c56d0bbb9bf0fdc3f48aa1d14e4c680f49d41c676c82a4017b23a283bbb70d2'
'a88072c34d5b18ebbdcc3003c7bbd899f81557500f963cda988239df7e692637fe29948b866fe80341b28c4820e1593f35fe37473de9ba35f7de8a8b31601ae1')

_dir="$pkgname_$pkgver_$CARCH"

prepare() {
	mkdir -p "$srcdir/$_dir"
	cd "$srcdir/$_dir"
	bsdtar -xf "../${pkgname}_${pkgver}_linux-${CARCH}_setup.tar.gz"
	bsdtar -xf "${pkgname}-${pkgver}_linux-${CARCH}.tar.gz"
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
