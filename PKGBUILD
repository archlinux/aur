# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Frédéric Bour <fred@tarides.com>

# Upstream check assumes XDG_RUNTIME_DIR is set
BUILDENV+=(!check)

pkgname=texpresso-git
_pkgname=${pkgname%-git}
pkgver=r29.7bcf830
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
        "$_pkgname-tonic::git+${url%/$_pkgname}/tectonic.git#commit=03e79075be9ee35587c529c3bae6b5868997fa7c"
        'harfbuzz::git+https://github.com/harfbuzz/harfbuzz.git#commit=4a1d891c6317d2c83e5f3c2607ec5f5ccedffcde'
        'tectonic-staging::git+https://github.com/tectonic-typesetting/tectonic-staging.git#commit=70dbe0603c4b27f17b3b4dcb25a85e9da3050fe9')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	sed -i -e 's/fPIC"/fPIC -Wl,-z,now"/' Makefile
	git submodule init
	git config submodule.tectonic.url "$srcdir/$_pkgname-tonic"
	git -C tectonic config submodule.crates/bridge_harfbuzz/harfbuzz.url "$srcdir/harfbuzz"
	git -C tectonic config submodule.reference_sources.url "$srcdir/tectonic-staging" 
	git -c protocol.file.allow=always submodule update --init --recursive
	pushd tectonic
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname%-git}"
	CFLAGS+=" -ffat-lto-objects"
	export CARGO_BUILD_FLAGS="--frozen --release"
	make config
	make all
}

check() {
	cd "${pkgname%-git}"
	"./build/$_pkgname" test/simple.tex
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$_pkgname"{,-tonic}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/emacs/site-lisp/" "emacs/$_pkgname.el"
}
