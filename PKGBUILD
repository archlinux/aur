# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=nng-git
pkgver=v1.0.0.rc.1
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
source=('git+https://github.com/nanomsg/nng.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}/build"
    cmake -G Ninja ..
}

build() {
    cd "$srcdir/${pkgname%-git}/build"
    ninja
}

check() {
    cd "$srcdir/${pkgname%-git}/build"
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
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/lib"
    cp build/libnng* "$pkgdir/usr/lib"
    for i in `find src -name "*.h"` ; do
        install -Dm644 $i "$pkgdir/usr/include/${pkgname%-git}/${i#*/}"
    done
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    for i in docs/man/*.adoc ; do
        generate_man $i
    done
}
