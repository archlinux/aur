pkgname=golded-plus-git
pkgver=r1530.0f6314e
pkgrel=2
pkgdesc="golded-plus Fidonet Mail Reader/Editor"
arch=('i686' 'x86_64')
url="http://bbconf.sourceforge.net/"
license=('GPL2')
source=("${pkgname}::git+https://github.com/golded-plus/golded-plus.git"  "ncurses.diff" "geline.diff" "gedlnx")
makedepends=('git' 'gcc' 'make' 'glibc' 'groff')
depends=('screen' 'xorg-luit' 'ncurses-nonwide')
provides=('golded-plus')

build() {
    cd "${pkgname}"
    make USE_NCURSES=1 KOI8=1 USE_ICONV=1 ICONV=1 WIDE_NCURSES=0
    pushd docs
    make tokentpl.txt
    make tokencfg.txt
    popd
    make docs
}

prepare() {
    cp "${pkgname}/golded3/mygolded.__h" "${pkgname}/golded3/mygolded.h"
    cd "${pkgname}"
    #cp -rfv "${srcdir}/gclang.cpp" golded3/
    patch -p0 -i "${srcdir}/ncurses.diff"
    patch -p0 -i "${srcdir}/geline.diff"
    iconv -c -f cp866 -t utf8 docs/rusfaq.txt |  sed 2s/cp866/utf-8/ >docs/rusfaq.utf8
    iconv -c -f cp866 -t utf8 docs/notework.rus |  sed 2s/cp866/utf-8/ >docs/notework.utf8
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -m 655 -p ${pkgdir}/usr/share/goldedplus/{docs/config/template,docs/etc/templates,charset,colorset}
    install -d ${pkgdir}/usr/bin
    install bin/*lnx bin/golded ${pkgdir}/usr/bin/
    mv ${pkgdir}/usr/bin/gedlnx ${pkgdir}/usr/bin/gedlnx.bin
    cp ${srcdir}/gedlnx ${pkgdir}/usr/bin/
    chmod 755 ${pkgdir}/usr/bin/gedlnx
    install -d ${pkgdir}/usr/man/man1
    install -m 644 docs/*.1 ${pkgdir}/usr/man/man1/
    install -m 644 ${pkgdir}/usr/man/man1/golded.1 ${pkgdir}/usr/man/man1/gedlnx.1
    install -m 644 ${pkgdir}/usr/man/man1/goldnode.1 ${pkgdir}/usr/man/man1/gnlnx.1
    install -m 644 ${pkgdir}/usr/man/man1/rddt.1 ${pkgdir}/usr/man/man1/rddtlnx.1
    cp -r etc ${pkgdir}/usr/share/goldedplus/docs/
    install -m 644 cfgs/config/* ${pkgdir}/usr/share/goldedplus/docs/config
    install -m 644 cfgs/template/* ${pkgdir}/usr/share/goldedplus/docs/config/template
    install -m 644 cfgs/charset/* ${pkgdir}/usr/share/goldedplus/charset
    install -m 644 cfgs/colorset/* ${pkgdir}/usr/share/goldedplus/colorset
    install -m 644 docs/{rusfaq,notework}.utf8 ${pkgdir}/usr/share/goldedplus/docs
    install -m 644 docs/{tips,linux,notework,tokencfg,tokentpl}.txt ${pkgdir}/usr/share/goldedplus/docs
}

md5sums=('SKIP'
         'd2936c6d185c1309b4741bfb9d57fe4b'
         '808200388757918784f7ed1a64f9d89d'
         '970bedc97a73656bf80da18e03af991d')
