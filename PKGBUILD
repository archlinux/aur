# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server-git
pkgver=r1391.d219a846
pkgrel=2

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

# Specifying libadalang-git and langkit-git explicitly because libadalang-git
# doesn't specify the git packages
depends=('libadalang-git' 'libadalang-tools-git' 'langkit-git' 'libvss-git' 'ada_spawn' 'ada-libfswatch')
makedepends=('git' 'gcc-ada' 'gprbuild' 'python-e3-testsuite')

conflicts=('ada_language_server')

source=('git+https://github.com/AdaCore/ada_language_server.git' 'ada_language_server.patch')
sha1sums=('SKIP'
          '097a2d9e6703ef10009c0ab36391de3b44246d23')

pkgver() {
    #cd "${srcdir}/${pkgname%-git}"
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply $srcdir/ada_language_server.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make BUILD_MODE=prod
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/usr" install
}
