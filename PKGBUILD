# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua
pkgver=0.3.2
pkgrel=2
pkgdesc="Lua execution engine"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/emilua"
license=('boost')
depends=('luajit' 'fmt' 'openssl' 'ncurses')
makedepends=('meson' 'boost' 're2c' 'xxd' 'asciidoctor')
#checkdepends=('gawk')
source=("${pkgname}::git+https://gitlab.com/emilua/emilua.git#tag=v${pkgver}"
	"boost.http::git+https://github.com/BoostGSoC14/boost.http.git#commit=07ba4ef67fc1488bf789008b43550526931ab412"
	"trial.protocol::git+https://github.com/breese/trial.protocol.git#commit=cd0055431ec42f30c53b295411ee00cade8b9b5e")
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')
#validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule init
	git config submodule.boost.http.url "${srcdir}/boost.http"
	git config submodule.trial.protocol.url "${srcdir}/trial.protocol"
	git submodule update
}

build() {
	arch-meson emilua build \
		   -D enable_tests=false \
		   -D enable_http=true \
		   -D version_suffix=-arch1
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
