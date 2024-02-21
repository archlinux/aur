# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Frédéric Bour <fred@tarides.com>

# Upstream check assumes XDG_RUNTIME_DIR is set and leaves a GUI running
BUILDENV+=(!check)

pkgname=texpresso-git
_pkgname=${pkgname%-git}
pkgver=r146.a24ca48
pkgrel=1
pkgdesc='Live rendering and error reporting for LaTeX'
url="https://github.com/let-def/$_pkgname"
arch=(x86_64)
license=(MIT)
depends=(fontconfig
         gcc-libs
         glibc
         gumbo-parser
         harfbuzz
         jbig2dec
         libfreetype.so
         libgraphite2.so
         libicuuc.so
         libjpeg.so
         libpng
         openjpeg2
         openssl
         sdl2
         zlib)
makedepends=(cargo
             git
             libmupdf
             re2c)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git"
        "$_pkgname-tonic::git+${url%/$_pkgname}/tectonic.git")
sha256sums=('SKIP'
            'SKIP')
options=(!lto)

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	sed -i -e 's/fPIC"/fPIC -Wl,-z,now"/' Makefile
	git submodule init
	git config submodule.tectonic.url "$srcdir/$_pkgname-tonic"
	git -C tectonic config submodule.reference_sources.url "$srcdir/tectonic-staging" 
	git -c protocol.file.allow=always submodule update --init
	pushd tectonic
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname%-git}"
	export CARGO_BUILD_FLAGS="--frozen --release --features external-harfbuzz"
	make config
	make all
}

check() {
	cd "${pkgname%-git}"
	"./build/$_pkgname-tonic" test/simple.tex
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$_pkgname"{,-tonic}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/emacs/site-lisp/" "emacs/$_pkgname.el"
}
