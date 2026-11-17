# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=26.11.2
_wasmbgver=0.2.130
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(nodejs pnpm rust-wasm binaryen)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('93cf13e23d6ac4b91b83d39e5c9c2e11b41ce226a76e0cade660c2efc0e65a2490acb2a75e7ed7daf05d685064ba343466db3f637adfab206a620f28119c3f60')

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
