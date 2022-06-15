# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: yinflying <yinflying@foxmail.com>

pkgname=caj2pdf-git
epoch=1
pkgver=r166.db1e1ba
pkgrel=1
provides=('caj2pdf')
conflicts=('caj2pdf')
pkgdesc='Convert CAJ (China Academic Journals) files to PDF.'
arch=('x86_64')
url='https://github.com/caj2pdf/caj2pdf'
license=('custom:GLWTPL')
depends=(
    'python-pypdf2'
    'mupdf-tools'
    'jbig2dec'
)
makedepends=('git')
source=(
    "git+https://github.com/JeziL/caj2pdf.git"
    "tmp.patch"
    "lib.patch"
)
sha256sums=('SKIP'
            '776f121d9218176517f81ed02adb4075b738814009f3734d55d69867d544fb66'
            '77332e30219430f96420826c37742d2bc6f2fe9cbe0627fed24aa073daead37c')

pkgver() {
    cd caj2pdf
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd caj2pdf
    patch --forward --strip=1 --input="${srcdir}/tmp.patch"
    patch --forward --strip=1 --input="${srcdir}/lib.patch"
}

build() {
    cd caj2pdf/lib
    cc -fPIC --shared -o libjbigdec.so jbigdec.cc JBigDecode.cc $LDFLAGS $CPPFLAGS
    cc $(pkg-config --cflags jbig2dec) -fPIC -shared -o libjbig2codec.so decode_jbig2data_x.cc $(pkg-config --libs jbig2dec) $LDFLAGS $CPPFLAGS
}

package() {
    cd caj2pdf
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 caj2pdf -t "$pkgdir/opt/$pkgname"
    install -Dm 644 lib/*.so -t "$pkgdir/opt/$pkgname/lib"
    install -Dm 644 *.py -t "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/caj2pdf" "$pkgdir/usr/bin/caj2pdf"
}
