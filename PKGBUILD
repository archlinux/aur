# Maintainer: Eike Gebauer <eike(at)zettelkiste.de>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver="8.0.1_16188"
_pkgver="${pkgver//_/-}"
pkgrel=1
arch=(x86_64)
license=(custom)
url="https://www.baslerweb.com/en/downloads/software-downloads/#os=linuxx8664bit;type=pylonsoftware"

options=(!strip)

depends=(fontconfig freetype2 mesa-utils libice libsm libusb libx11 libxcb xcb-util xcb-util-image xcb-util-keysyms xcb-util-renderutil libxext libxkbcommon zlib ld-lsb)
makedepends=(patchelf)

source=(
    "https://downloadbsl.blob.core.windows.net/software/${pkgname}-${_pkgver}_linux-${CARCH}_setup.tar.gz"
	"LICENSE"
)


sha512sums=(
    '15887a74d36dd84d974f79dd4a7c00b9f7ffafb02333eb763968ca3e5c203f3a27edcf60945e56d395d98302e72c8a8ca0e83919d7603b1784149634cace98ca'
    'a88072c34d5b18ebbdcc3003c7bbd899f81557500f963cda988239df7e692637fe29948b866fe80341b28c4820e1593f35fe37473de9ba35f7de8a8b31601ae1'
)

_dir="$pkgname_$pkgver_$CARCH"

prepare() {
	mkdir -p "$srcdir/$_dir"
	cd "$srcdir/$_dir"
	bsdtar -xf "../${pkgname}-${_pkgver}_linux-${CARCH}_setup.tar.gz"
	bsdtar -xf "${pkgname}-${_pkgver}_linux-${CARCH}.tar.gz"
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

	_shrink_rpaths "$pkgdir/opt/pylon/lib/"*
	_shrink_rpaths "$pkgdir/opt/pylon/bin/"*
}
