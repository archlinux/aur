# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=26.11.4
_wasmbgver=0.2.130
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(nodejs pnpm rust-wasm binaryen)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('109c2043fb148a50becc6c945af045d44677a50a9ef8cd6485d75ea6b55270650fed485e68fdab3dd58ec50a230d9e8d62bf206a42e33e3f937f2179197198c6')

source_x86_64=("https://github.com/wasm-bindgen/wasm-bindgen/releases/download/${_wasmbgver}/wasm-bindgen-${_wasmbgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('5fcdbd31c08cd402e6fa83780a59ec707618846e45439affd8b70a99c4a624a55167c67a56f9a920064cdd8cc98e7e8d584a03b56d2f0d5a16280f1641257f33')

prepare() {
        cd "${srcdir}"/"sable-next"

        git init

        pnpm install
}

build() {
        export PATH="$(realpath "wasm-bindgen-${_wasmbgver}-$(uname -m)-unknown-linux-musl"):$PATH"
        export CFLAGS=""
        export CXXFLAGS=""

	cd "sable-next"
        pnpm build
}

package() {
	backup=('etc/webapps/sable/config.json')
	cd "sable-next"
	install -d "$pkgdir/usr/share/webapps/sable"
	cp -r dist/* "$pkgdir/usr/share/webapps/sable"
	install -d "$pkgdir/etc/webapps/sable"
	mv "${pkgdir}/usr/share/webapps/sable/config.json" \
		"${pkgdir}/etc/webapps/sable/config.json"
	ln -sfr "${pkgdir}/etc/webapps/sable/config.json" \
		"${pkgdir}/usr/share/webapps/sable/config.json"
}
