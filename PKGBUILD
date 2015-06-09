#Maintainer: allencch <allencch at hotmail dot com>
#Contributor: Charles E. Vejnar
pkgname=meme
pkgver=4.10.1_2
pkgrel=2
pkgdesc="The MEME suite provides tools for discovering and using protein and DNA sequence motifs"
arch=("i686" "x86_64")
url="http://meme-suite.org/"
license=("custom")
depends=(perl-html-template tcsh python2 perl-xml-parser openmpi)
source=("http://meme-suite.org/meme-software/4.10.1/${pkgname}_${pkgver}.tar.gz"
        "python27.patch")
sha1sums=("64d37d5cf86b1595f07425b8d2fcc9346e84abbc"
          "737b1ef7cb277412c2fff692a2e9b2a261e1b532")

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
}
