pkgname=tangram-web
pkgver=1.3.1
pkgrel=1
pkgdesc="Run web apps on your desktop."
arch=('any')
url="https://github.com/sonnyp/Tangram"
license=('GPL3')
depends=('gjs' 'libsoup' 'webkit2gtk')
conflicts=('gigagram')
makedepends=('git' 'npm' 'meson')
#checkdepends=('appstream-glib')
source=("${pkgname%-web}::git+https://github.com/sonnyp/Tangram.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-web}"
	git submodule init
	git config submodule.src/troll.url $srcdir/troll
	git submodule update
}

build() {
	pushd "$srcdir/${pkgname%-web}"
	npm install --cache "$srcdir/npm-cache"
	./node_modules/.bin/rollup -c
	popd

	arch-meson "${pkgname%-web}" build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package(){
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/re.sonny.Tangram "$pkgdir/usr/bin/${pkgname%-web}"
}
