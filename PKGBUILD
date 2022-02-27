# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server-git
pkgver=r1393.2dada1b8
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

# Specifying gnatcoll-core-git, langkit-git, and libadalang-git explicitly
# because libadalang-tools-git doesn't specify the git packages
depends=('gnatcoll-core-git' 'langkit-git' 'libadalang-git' 'libadalang-tools-git' 'libvss-git' 'ada_spawn' 'ada-libfswatch')
makedepends=('git' 'gcc-ada' 'gprbuild' 'python-e3-testsuite')

conflicts=('ada_language_server')

source=('git+https://github.com/AdaCore/ada_language_server.git' 'ada_language_server.patch')
sha1sums=('SKIP'
          '9a6abc89eea20f38236471926d068b21b3a333dd')

pkgver() {
    #cd "${srcdir}/${pkgname%-git}"
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply --reject $srcdir/ada_language_server.patch
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
