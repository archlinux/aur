# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=5.0.5.9000.rc8
pkgrel=2
arch=(x86_64)
license=(custom)
url=http://www.baslerweb.com/en/products/software

depends=(qt4)
makedepends=(patchelf)

source=(
	"http://s.baslerweb.com/media/documents/pylon-5.0.5.9000--RC8-$CARCH.tar.gz"
	"69-basler-cameras.rules"
)
sha512sums=(
	'9554890441a371142d034392df22b6e1daea835fc677b39a0119247dc8245fc0fddd3398a851700bc2179659963d49ecb9955013fa92968f1a22f4144e0edfad'
	'a3348a3fb03228b031be9ff805663fc8ee164ff69869a88f466689645135757a6cb6b823d1a2a01f4da3bb0f06ec2555d90d3d1e1cdcdc275f6604940f24d500'
)

_dir="pylon-5.0.5.9000-$CARCH"

prepare() {
	cd "$srcdir/$_dir"
	bsdtar -xf "pylonSDK-5.0.5.9000-$CARCH.tar.gz"
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
	cp -a --no-preserve=ownership "$srcdir/$_dir/doc"     "$pkgdir/opt/pylon5/doc"
	cp -a --no-preserve=ownership "$srcdir/$_dir/Samples" "$pkgdir/opt/pylon5/samples"
	cp -a --no-preserve=ownership "$srcdir/$_dir/"{README,INSTALL,ReleaseNotes.txt} "$pkgdir/opt/pylon5/"
	install -m 644  -Dt "$pkgdir/usr/lib/udev/rules.d" "$srcdir/69-basler-cameras.rules"

	_shrink_rpaths "$pkgdir/opt/pylon5/lib64/"*
	_shrink_rpaths "$pkgdir/opt/pylon5/bin/"*
}
