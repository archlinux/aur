pkgname=golded-plus-git
pkgver=r1569.e823d0f
_ncurses_pkgver=6.2
_ncurses="ncurses"
pkgrel=1
pkgdesc="golded-plus Fidonet Mail Reader/Editor"
arch=('i686' 'x86_64')
url="http://bbconf.sourceforge.net/"
license=('GPL2')
source=(
    "${pkgname}::git+https://github.com/golded-plus/golded-plus.git"
     "https://ftp.gnu.org/pub/gnu/ncurses/${_ncurses}-${_ncurses_pkgver}.tar.gz"
     "ncurses.patch" "golded"
)
makedepends=('git' 'gcc' 'make' 'glibc' 'groff' 'patchelf')
depends=('luit')
provides=('golded-plus')

build() {
    rm -rf ncurses
    mkdir ncurses
    pushd "${_ncurses}-${_ncurses_pkgver}"
    ./configure --prefix=/usr/lib/ncurses-golded \
    --mandir=/usr/lib/golded-ncurses/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/ncurses-golded/usr/lib/pkgconfig \
    --with-shared --with-normal --without-debug --without-ada \
    --disable-widec --enable-pc-files --with-cxx-binding --with-cxx-shared \
    --without-manpages --without-tests --without-pkg-config \
    --with-static --with-cxx-static --with-abi-version=5
    make clean
    make -j8
    make DESTDIR="${srcdir}/ncurses" install
    popd
    pushd "${pkgname}"
    make WIDE_NCURSES=0 USE_NCURSES=1 KOI8=1
    pushd docs
    make tokentpl.txt
    make tokencfg.txt
    popd
    make docs
    popd
}

prepare() {
    cd "${pkgname}"
    cp "golded3/mygolded.__h" "golded3/mygolded.h"
    patch -p1 -i "../ncurses.patch"
    iconv -c -f cp866 -t utf8 docs/rusfaq.txt |  sed 2s/cp866/utf-8/ >docs/rusfaq.utf8
    iconv -c -f cp866 -t utf8 docs/notework.rus |  sed 2s/cp866/utf-8/ >docs/notework_rus.utf8
    iconv -c -f cp866 -t koi8-r docs/rusfaq.txt |  sed 2s/cp866/koi8/ >docs/rusfaq.koi8
    iconv -c -f cp866 -t koi8-r docs/notework.rus |  sed 2s/cp866/koi8/ >docs/notework_rus.koi8
    pushd cfgs/config
    for i in *.ru?; do
      iconv -c -f cp866 -t koi8-r ${i} |  sed 2s/cp866/koi8/ > ${i}.koi8
      iconv -c -f cp866 -t utf-8 ${i} |  sed 2s/cp866/utf-8/ > ${i}.utf8 
    done
    iconv -c -f cp866 -t koi8-r aliasru.cfg |  sed 2s/cp866/koi8/ > aliasru.koi8
    iconv -c -f cp866 -t utf-8 aliasru.cfg |  sed 2s/cp866/utf-8/ > aliasru.utf8 
    popd
    pushd cfgs/template
    iconv -c -f cp866 -t koi8-r rusCP866.tpl |  sed 2s/cp866/koi8/ > rusKOI8.tpl
    iconv -c -f cp866 -t utf-8 rusCP866.tpl |  sed 2s/cp866/utf-8/ > rusUTF8.tpl
    popd
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    pushd "${_ncurses}-${_ncurses_pkgver}"
    make DESTDIR="${pkgdir}" install
    popd
    
    pushd "${pkgname}"
    mkdir -m 755 -p "${pkgdir}/usr/share/goldedplus"/{docs,charset,colorset,config,template}
    install -d "${pkgdir}/usr/bin"
    install -m 755 bin/rddtlnx "${pkgdir}/usr/bin/rddt"
    install -m 755 bin/gnlnx "${pkgdir}/usr/bin/goldnode"
    install -m 755 bin/gedlnx "${pkgdir}/usr/bin/gedlnx"
    install -m 755 ../golded "${pkgdir}/usr/bin/golded"
    patchelf --set-rpath /usr/lib/ncurses-golded/lib "${pkgdir}/usr/bin/gedlnx"
    install -d "${pkgdir}/usr/man/man1"
    install -m 644 docs/*.1 "${pkgdir}/usr/man/man1/"
    install -m 644 etc/gecolor.conf "${pkgdir}/usr/share/goldedplus/colorset/gedcolor.cfg"
    install -m 644 cfgs/config/* "${pkgdir}/usr/share/goldedplus/config"
    install -m 644 cfgs/template/* "${pkgdir}/usr/share/goldedplus/template"
    install -m 644 cfgs/charset/* "${pkgdir}/usr/share/goldedplus/charset"
    install -m 644 cfgs/colorset/* "${pkgdir}/usr/share/goldedplus/colorset"
    install -m 644 docs/*.utf8 "${pkgdir}/usr/share/goldedplus/docs"
    install -m 644 docs/*.koi8 "${pkgdir}/usr/share/goldedplus/docs"
    install -m 644 docs/{tips,linux,notework,tokencfg,tokentpl}.txt "${pkgdir}/usr/share/goldedplus/docs"
}

sha256sums=('SKIP'
            '30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d'
            'd1fbfeec65ace3ca7b8fc121e21c7896bcce825d5738b670060cdacde13918d6'
            'f8c52480a056045a4ef8adcce6c820d448a2c6b7096940a4fbfc970dfe9c8738')
