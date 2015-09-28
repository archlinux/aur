#Maintainer: allencch <allencch at hotmail dot com>
#Contributor: Charles E. Vejnar
pkgname=meme
pkgver=4.10.2
pkgrel=1
pkgdesc="The MEME suite provides tools for discovering and using protein and DNA sequence motifs"
arch=("i686" "x86_64")
url="http://meme-suite.org/"
license=("custom")
depends=(perl-html-template tcsh python2 perl-xml-parser openmpi)
source=("http://meme-suite.org/meme-software/${pkgver}/meme_${pkgver}.tar.gz"
        "python27.patch")
sha1sums=('230a52664c4739354f2ac79ace9b55f3dd2fde8d'
          '737b1ef7cb277412c2fff692a2e9b2a261e1b532')

prepare() {
    cd $srcdir/${pkgname}_${pkgver%_*}

    patch -p1 -i "${srcdir}/python27.patch"
}

build() {
    cd $srcdir/${pkgname}_${pkgver%_*}

    LDFLAGS="-Wl,--allow-multiple-definition" ./configure --prefix=/usr --program-prefix="meme-" --docdir='${prefix}'/usr/share/doc/meme --sysconfdir='${prefix}'/../etc/meme --with-python=/usr/bin/python2.7

    make
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver%_*}"

    make prefix="${pkgdir}/usr" install

    # Move Python modules to a more standard location
    install -dm755 ${pkgdir}/usr/lib/python2.7/site-packages
    for fname in $(ls -1 ${pkgdir}/usr/lib/python2.7/); do
        if [[ $fname = *.py ]]; then
            mv ${pkgdir}/usr/lib/python2.7/$fname ${pkgdir}/usr/lib/python2.7/site-packages/${fname#meme-}
        fi
    done

    # Rename Perl modules
    for fname in $(ls -1 ${pkgdir}/usr/lib/perl/); do
        if [[ $fname = meme-*.pm ]]; then
            mv ${pkgdir}/usr/lib/perl/$fname ${pkgdir}/usr/lib/perl/${fname#meme-}
        fi
    done

    sed -i -e "s/\(PROG => \)/\1'meme-'./g" "${pkgdir}/usr/bin/meme-meme-chip"

    # get_meme_bin_file in src/utils.c does not deal well with meme- prefixes.
    # It is being called three times in the source code:
    # > grep 'get_meme_bin_file' src/meme_4.10.2/src/*.c
    # src/meme_4.10.2/src/glam2_glam2.c:  glam2html = get_meme_bin_file("glam2html");
    # src/meme_4.10.2/src/glam2_glam2.c:  glam2psfm = get_meme_bin_file("glam2psfm");
    # src/meme_4.10.2/src/meme.c:    prog = get_meme_bin_file("meme_xml_to_html");
    # Add symlinks for those files:
    ln -s "${pkgdir}/usr/bin/meme-meme_xml_to_html" "${pkgdir}/usr/bin/meme_xml_to_html"
    ln -s "${pkgdir}/usr/bin/meme-glam2html" "${pkgdir}/usr/bin/glam2html"
    ln -s "${pkgdir}/usr/bin/meme-glam2psfm" "${pkgdir}/usr/bin/glam2psfm" 
}
