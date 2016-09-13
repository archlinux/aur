pkgname=stardict-tools
pkgver=3.0.2
pkgrel=2
pkgdesc='Stardict tools'
arch=('i686' 'x86_64')
url='http://code.google.com/p/stardict-3'
license=('GPLv3')
depends=('gtk2' 'glib2')
makedepends=('intltool' 'libtool' 'libmysqlclient')

source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
    'fix-compilation.patch'
    'fix-lz-linking.patch'
    'fix-typo.patch'
    'fix-zlib.patch')

build()
{
    cd "$srcdir/${pkgname}-$pkgver"

    patch -p1 < ../fix-compilation.patch
    patch -p1 < ../fix-lz-linking.patch
    patch -p1 < ../fix-typo.patch
    patch -p1 < ../fix-zlib.patch

    CXXFLAGS=-Wno-narrowing ./autogen.sh --prefix=/usr
    sed -i 's/noinst_PROGRAMS =/bin_PROGRAMS +=/' src/Makefile
    make
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" install
    find "$pkgdir"/usr/bin/ -not -name 'stardict-*' -type f | sed 'p;s#usr/bin/#usr/bin/stardict-#' | xargs -n2 mv
}
md5sums=('56762aa24df6c985c44e893c56bdd5d6'
    'dd55902a93e7c8cd4dcddc2efb407c57'
    '9d2312c00edb6abbc38a5a7e8fa866db'
    'cfc5af4ed3cee7df637da641f19fa5f5'
    'f936a9d742b19a4fd29b94e55f0baf97')
