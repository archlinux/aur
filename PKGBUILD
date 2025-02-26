# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-tdlib
pkgver=1.0.4
pkgrel=2
pkgdesc="Telegram Database Library bindings for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/tdlib"
license=('boost')
depends=('emilua')
makedepends=('git' 'cmake' 'boost' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/tdlib.git#tag=v${pkgver}"
        "td::git+https://github.com/tdlib/td.git#commit=4041ecb535802ba1c55fcd11adf5d3ada41c2be7"
        "trial.circular::git+https://github.com/breese/trial.circular.git#commit=8b8269c1ba90f1cb3c7a8970a27ccb149069ed24")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule init
	git config submodule.td.url "${srcdir}/td"
	git config submodule.trial.circular.url "${srcdir}/trial.circular"
	git -c protocol.file.allow=always submodule update
	git submodule update
}

build() {
	cmake -B build -S "${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build
}
