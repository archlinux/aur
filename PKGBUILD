pkgname=golded-plus-git
pkgver=r1548.9b28fa8
pkgrel=1
pkgdesc="golded-plus Fidonet Mail Reader/Editor"
arch=('i686' 'x86_64')
url="http://bbconf.sourceforge.net/"
license=('GPL2')
source=("${pkgname}::git+https://github.com/golded-plus/golded-plus.git" 
 "ncurses.patch" "addline.patch" "widescreen.patch")
makedepends=('git' 'gcc' 'make' 'glibc' 'groff' 'patchelf')
depends=('screen' 'luit' 'ncurses-nonwide')
provides=('golded-plus')

build() {
    cd "${pkgname}"
    make USE_NCURSES=1 KOI8=1 WIDE_NCURSES=0
    pushd docs
    make tokentpl.txt
    make tokencfg.txt
    popd
    make docs
}

prepare() {
    cp "${pkgname}/golded3/mygolded.__h" "${pkgname}/golded3/mygolded.h"
    cd "${pkgname}"
    patch -p1 -i "${srcdir}/ncurses.patch"
    patch -p1 -i "${srcdir}/addline.patch"
    patch -p1 -i "${srcdir}/widescreen.patch"

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
    cd "$pkgname"
    mkdir -m 755 -p ${pkgdir}/usr/share/goldedplus/{docs,charset,colorset,config,template}
    install -d ${pkgdir}/usr/bin
    install bin/*lnx bin/golded ${pkgdir}/usr/bin/
    patchelf --set-rpath /opt/ncurses-nonwide/lib ${pkgdir}/usr/bin/gedlnx
    chmod 755 ${pkgdir}/usr/bin/gedlnx
    install -d ${pkgdir}/usr/man/man1
    install -m 644 docs/*.1 ${pkgdir}/usr/man/man1/
    install -m 644 ${pkgdir}/usr/man/man1/golded.1 ${pkgdir}/usr/man/man1/gedlnx.1
    install -m 644 ${pkgdir}/usr/man/man1/goldnode.1 ${pkgdir}/usr/man/man1/gnlnx.1
    install -m 644 ${pkgdir}/usr/man/man1/rddt.1 ${pkgdir}/usr/man/man1/rddtlnx.1
    install -m 644 etc/gecolor.conf ${pkgdir}/usr/share/goldedplus/colorset/gedcolor.cfg
    install -m 644 cfgs/config/* ${pkgdir}/usr/share/goldedplus/config
    install -m 644 cfgs/template/* ${pkgdir}/usr/share/goldedplus/template
    install -m 644 cfgs/charset/* ${pkgdir}/usr/share/goldedplus/charset
    install -m 644 cfgs/colorset/* ${pkgdir}/usr/share/goldedplus/colorset
    install -m 644 docs/*.utf8 ${pkgdir}/usr/share/goldedplus/docs
    install -m 644 docs/*.koi8 ${pkgdir}/usr/share/goldedplus/docs
    install -m 644 docs/{tips,linux,notework,tokencfg,tokentpl}.txt ${pkgdir}/usr/share/goldedplus/docs
}

md5sums=('SKIP'
         '101d41109a4d32a562142971de846219'
         '5af9e7339bcfa4eb12736599b6ee266a'
         '5c05574fdfa982acfefc1ca45f830d05')
