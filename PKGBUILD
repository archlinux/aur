#Maintainer: allencch <allencch at hotmail dot com>
#Contributor: Charles E. Vejnar
pkgname=meme
pkgver=5.1.1
pkgrel=1
_minor=
pkgdesc="The MEME suite provides tools for discovering and using protein and DNA sequence motifs"
arch=("i686" "x86_64")
url="http://meme-suite.org/"
license=("custom")
depends=(perl-html-template tcsh python2 perl-xml-parser openmpi imagemagick perl-xml-simple)
source=("http://meme-suite.org/meme-software/${pkgver}/meme-${pkgver}${_minor}.tar.gz")
sha1sums=('20505e5a992f5b964e455722050ae87a2aea66c7')

build() {
    cd $srcdir/${pkgname}-${pkgver%_*}

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
  cd "${srcdir}/${pkgname}-${pkgver%_*}"

  make prefix="${pkgdir}/usr" install

  # Rename Perl modules
  perl_major=$(perl -e '$^V =~ /^v(\d+)/ and print $1; print "\n"')
  perl_minor=$(perl -e '$^V =~ /\.(\d+)\./ and print $1; print "\n"')

  mkdir -p "${pkgdir}/usr/lib/perl${perl_major}/${perl_major}.${perl_minor}/vendor_perl"
  for fname in $(ls -1 "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/perl"); do
    if [[ $fname = meme-*.pm ]]; then
      mv "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/perl/${fname}" "${pkgdir}/usr/lib/perl${perl_major}/${perl_major}.${perl_minor}/vendor_perl/${fname#meme-}"
    fi
  done
  rmdir "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/perl"

  # Rename Python
  for fname in $(ls -1 "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/python"); do
    if [[ $fname = meme-* ]]; then
      mv "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/python/${fname}" "${pkgdir}/usr/lib/meme-${pkgver}${_minor}/python/${fname#meme-}"
    fi
  done

  sed -i -e "s/\(PROG => \)/\1'meme-'./g" "${pkgdir}/usr/bin/meme-meme-chip"

  # Add symlinks for those files:
  ln -s "meme-meme_xml_to_html" "${pkgdir}/usr/bin/meme_xml_to_html"
  ln -s "meme-glam2html" "${pkgdir}/usr/bin/glam2html"
  ln -s "meme-glam2psfm" "${pkgdir}/usr/bin/glam2psfm"
  ln -s "meme-mast_xml_to_html" "${pkgdir}/usr/bin/mast_xml_to_html"
  ln -s "meme-mast_xml_to_txt" "${pkgdir}/usr/bin/mast_xml_to_txt"

  for fname in $(ls -1 "${pkgdir}/usr/libexec/${pkgname}-${pkgver%_*}/"); do
    ln -s "/usr/libexec/${pkgname}-${pkgver%_*}/${fname}" "${pkgdir}/usr/bin/${fname}"
  done
}
