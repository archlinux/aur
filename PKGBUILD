# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua
pkgver=0.5.0
pkgrel=1
pkgdesc="Lua execution engine"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/emilua"
license=('boost')
depends=('luajit' 'boost-libs' 'fmt' 'openssl' 'ncurses' 'serd' 'sord' 'liburing' 'libcap')
makedepends=('git' 'meson' 'boost' 'cereal' 're2c' 'gawk' 'gperf' 'xxd' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/emilua.git#tag=v${pkgver}"
	"emilua-http::git+https://github.com/BoostGSoC14/boost.http.git#commit=93ae527c89ffc517862e1f5f54c8a257278f1195"
	"trial-protocol::git+https://github.com/breese/trial.protocol.git#commit=79149f604a49b8dfec57857ca28aaf508069b669")
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')
#validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}/subprojects"
	ln -s "${srcdir}/emilua-http" .
	cp "packagefiles/emilua-http/meson.build" "emilua-http/"
	ln -s "${srcdir}/trial-protocol" .
	cp "packagefiles/trial.protocol/meson.build" "trial-protocol/"
}

build() {
	arch-meson emilua build \
		   -D version_suffix=-arch${pkgrel} \
		   -D enable_http=true \
		   -D enable_file_io=true \
		   -D enable_io_uring=true
	meson compile -C build
}

check() {
	cd build
	meson test --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
