# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: yinflying <yinflying@foxmail.com>

pkgname=caj2pdf-git
epoch=1
pkgver=r151.651cc90
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
            '014de06dac78c439e811745825f7caefc7b776239f875fcd8653e554aa161483'
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
    cc -Wall -fPIC --shared -o libjbigdec.so jbigdec.cc JBigDecode.cc
    cc -Wall $(pkg-config --cflags jbig2dec) -fPIC -shared -o libjbig2codec.so decode_jbig2data_x.cc $(pkg-config --libs jbig2dec)
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
