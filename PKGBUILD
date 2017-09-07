# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=5.0.9.10389
pkgrel=1
arch=(x86_64)
license=(custom)
url=http://www.baslerweb.com/en/products/software

depends=(qt5-base)
makedepends=(patchelf)

source=(
	"http://www.baslerweb.com//fp-1496750153/media/downloads/software/pylon_software/$pkgname-$pkgver-$CARCH.tar.gz"
	"69-basler-cameras.rules"
	"LICENSE"
)
sha512sums=('677c2062d57f86131581bfd3163c00a044585e2adc503912eee2ed741945fbc15d3e1b26385391d66e12050c42d297a7d7f01fbbc6b63135fcac30a1fefe94c6'
            'a3348a3fb03228b031be9ff805663fc8ee164ff69869a88f466689645135757a6cb6b823d1a2a01f4da3bb0f06ec2555d90d3d1e1cdcdc275f6604940f24d500'
            'bce692263803b235c25e734049fc72e61f0df841fcee0bb238772c4b18ec209f58f6790457c4f20e75e6daf8de45cb091f04ad34d7c20e11f3d97435be816a6d')

_dir="$pkgname-$pkgver-$CARCH"

prepare() {
	cd "$srcdir/$_dir"
	bsdtar -xf "pylonSDK-$pkgver-$CARCH.tar.gz"
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

	mkdir -p "$pkgdir/opt"
	cp -a --no-preserve=ownership "$srcdir/$_dir/pylon5"  "$pkgdir/opt/pylon5"
	cp -a --no-preserve=ownership "$srcdir/$_dir/Samples" "$pkgdir/opt/pylon5/share/samples"
	cp -a --no-preserve=ownership "$srcdir/$_dir/"{README,INSTALL,ReleaseNotes.txt} "$pkgdir/opt/pylon5/"
	install -m 644  -Dt "$pkgdir/usr/lib/udev/rules.d"         "$srcdir/69-basler-cameras.rules"
	install -m 644  -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"

	#_shrink_rpaths "$pkgdir/opt/pylon5/lib64/"*
	#_shrink_rpaths "$pkgdir/opt/pylon5/bin/"*
}
