# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Frédéric Bour <fred@tarides.com>

# Upstream check assumes XDG_RUNTIME_DIR is set and leaves a GUI running
BUILDENV+=(!check)

pkgname=texpresso-git
_pkgname=${pkgname%-git}
pkgver=r176.96d0599
pkgrel=2
pkgdesc='Live rendering and error reporting for LaTeX'
url="https://github.com/let-def/$_pkgname"
arch=(x86_64)
license=(MIT)
depends=(fontconfig libfontconfig.so
         freetype2 libfreetype.so
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so libstdc++.so "ld-linux-$CARCH.so"
         graphite libgraphite2.so
         gumbo-parser # libgumbo.so
         harfbuzz libharfbuzz.so
         icu libicuuc.so
         jbig2dec # libjbig2dec.so
         libjpeg-turbo libjpeg.so
         libmupdf # libmupdf.so
         libpng libpng16.so
         openjpeg2 # libopenjp2.so
         openssl libcrypto.so libssl.so
         sdl2 # libSDL2-2.0.so
         zlib libz.so)
makedepends=(cargo
             git
             libmupdf
             re2c)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!lto)
source=("git+$url.git"
        "$_pkgname-tonic::git+${url%/$_pkgname}/tectonic.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd "${pkgname%-git}"
	sed -i -e 's/fPIC"/fPIC -Wl,-z,now"/' Makefile
	git submodule init
	git config submodule.tectonic.url "$srcdir/$_pkgname-tonic"
	git -C tectonic config submodule.reference_sources.url "$srcdir/tectonic-staging" 
	git -c protocol.file.allow=always submodule update --init
	pushd tectonic
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${pkgname%-git}"
	export CARGO_BUILD_FLAGS='--frozen --release --features external-harfbuzz'
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
