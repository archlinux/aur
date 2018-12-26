#Maintainer: allencch <allencch at hotmail dot com>
#Contributor: Charles E. Vejnar
pkgname=meme
pkgver=4.12.0
pkgrel=2
_minor=
pkgdesc="The MEME suite provides tools for discovering and using protein and DNA sequence motifs"
arch=("i686" "x86_64")
url="http://meme-suite.org/"
license=("custom")
depends=(perl-html-template tcsh python2 perl-xml-parser openmpi imagemagick)
source=("http://meme-suite.org/meme-software/${pkgver}/meme_${pkgver}${_minor}.tar.gz")
sha1sums=('4325c6a558412dac277592b8c0493efbaf07a931')

build() {
    cd $srcdir/${pkgname}_${pkgver%_*}

    export MEME_ETC_DIR="/etc/meme"
    LDFLAGS="-Wl,--allow-multiple-definition" \
           ./configure \
           --prefix=/usr \
           --program-prefix="meme-" \
           --docdir='${prefix}'/usr/share/doc/meme \
           --sysconfdir='${prefix}'/../etc/meme
    make
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver%_*}"

    make prefix="${pkgdir}/usr" install

    # Rename Perl modules
    for fname in $(ls -1 ${pkgdir}/usr/lib/perl/); do
        if [[ $fname = meme-*.pm ]]; then
            mv ${pkgdir}/usr/lib/perl/$fname ${pkgdir}/usr/lib/perl/${fname#meme-}
        fi
    done

    perl_major=$(perl -e '$^V =~ /^v(\d+)/ and print $1; print "\n"')
    perl_minor=$(perl -e '$^V =~ /\.(\d+)\./ and print $1; print "\n"')
    mkdir -p "${pkgdir}/usr/lib/perl${perl_major}/${perl_major}.${perl_minor}"
    mv "${pkgdir}/usr/lib/perl" "${pkgdir}/usr/lib/perl${perl_major}/${perl_major}.${perl_minor}/vendor_perl"

    sed -i -e "s/\(PROG => \)/\1'meme-'./g" "${pkgdir}/usr/bin/meme-meme-chip"

    # get_meme_bin_file in src/utils.c does not deal well with meme- prefixes.
    # It is being called three times in the source code:
    # > grep 'get_meme_bin_file' src/meme_4.10.2/src/*.c
    # src/meme_4.10.2/src/glam2_glam2.c:  glam2html = get_meme_bin_file("glam2html");
    # src/meme_4.10.2/src/glam2_glam2.c:  glam2psfm = get_meme_bin_file("glam2psfm");
    # src/meme_4.10.2/src/meme.c:    prog = get_meme_bin_file("meme_xml_to_html");
    # Add symlinks for those files:
    ln -s "meme-meme_xml_to_html" "${pkgdir}/usr/bin/meme_xml_to_html"
    ln -s "meme-glam2html" "${pkgdir}/usr/bin/glam2html"
    ln -s "meme-glam2psfm" "${pkgdir}/usr/bin/glam2psfm"
    ln -s "meme-mast_xml_to_html" "${pkgdir}/usr/bin/mast_xml_to_html"
    ln -s "meme-mast_xml_to_txt" "${pkgdir}/usr/bin/mast_xml_to_txt"
}
