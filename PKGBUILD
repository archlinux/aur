# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=nng
pkgver=1.0.1
pkgrel=1
pkgdesc="Rewrite of the SP protocol library known as libnanomsg"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://nanomsg.github.io/nng/"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'ninja' 'asciidoctor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("https://github.com/nanomsg/nng/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('c08ef670d472eb6fd50a2f863c6a4432b2963addd47f35d54cfb9fd7c543895b')

prepare() {
    mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
    cd "$srcdir/${pkgname}-${pkgver}/build"
    cmake -G Ninja -DBUILD_SHARED_LIBS=ON ..
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    ninja
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    ninja test
}

generate_man() {
	declare input=$1
        declare name=nng
        declare version=PREVIEW
        declare MANSOURCE="NNG"
        declare MANMANUAL="NNG Reference Manual"
        declare pagename=${input#*.}
        declare output=${input%.*}
        output=${output##*/}
        declare level=${pagename:0:1}
        declare mandir="$pkgdir/usr/share/man/man$level"
        install -d $mandir

	asciidoctor -aversion-label=${name} -arevnumber=${version} \
		-a mansource="${MANSOURCE}" -a manmanual="${MANMANUAL}" \
		-d manpage -b manpage -o "$mandir/$output" $input
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/lib"
    cp -a build/libnng* "$pkgdir/usr/lib"
    install -Dm755 build/tools/nngcat/nngcat "$pkgdir/usr/bin/nngcat"
    for i in `find src -name "*.h"` ; do
        install -Dm644 $i "$pkgdir/usr/include/${pkgname%-git}/${i#*/}"
    done
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    for i in docs/man/*.adoc ; do
        generate_man $i
    done
}
