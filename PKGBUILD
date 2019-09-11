# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server-git
pkgver=r420.3461caa
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

depends=('libadalang-git' 'langkit-git')
makedepends=('git' 'gcc-ada' 'gprbuild-git' 'libadalang-git' 'langkit-git')

provides=('ada_language_server')

source=('git+https://github.com/AdaCore/ada_language_server.git' 'ada_language_server.patch')
sha1sums=('SKIP' '4d63949aebb58dae4921f0917413d6398d769fc6')

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
