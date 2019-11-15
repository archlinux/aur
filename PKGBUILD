pkgname=asciidoc-py3
pkgver=8.6.10
pkgrel=2
pkgdesc='Text document format for short documents, articles, books and UNIX man pages. (python3 version)'
arch=('any')
url='https://github.com/asciidoc/asciidoc-py3'
license=('GPL2')
depends=('python' 'libxslt' 'docbook-xsl')
optdepends=('lilypond: music-filter'
            'imagemagick: music-filter (used in conjunction with lilypond)'
            'source-highlight: source-highlight-filter'
            'dblatex: pdf generation'
            'fop: alternative pdf generation'
            'lynx: text generation'
            'w3m: text generation (alternative to lynx)')
conflicts=('asciidoc')
provides=('asciidoc')
_gitcommit="544574e66ca89c898151c1c6d34b88a76e44343f"
source=("${url}/archive/${_gitcommit}.tar.gz")
sha512sums=('b151239b23a63bee52df2dffd35a690f89e8327ba9312382478a2cef2de6fcbc2c74604f6da3a9c879452aa22326a9d9e8ea69c66315a5b344b7fa24f2398ad2')

build() {
  cd ${pkgname}-${_gitcommit}

  autoconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
}

package() {
  cd ${pkgname}-${_gitcommit}

  make install DESTDIR=${pkgdir}
  make docs DESTDIR=${pkgdir}

  install -Dm644 filters/graphviz/asciidoc-graphviz-sample.txt \
    -t "${pkgdir}"/etc/asciidoc/filters/graphviz
  install -Dm644 asciidocapi.py \
    -t "${pkgdir}"/usr/lib/python3.8/site-packages
  ln -sf ../../../../../../etc/asciidoc/filters/graphviz/asciidoc-graphviz-sample.txt \
    "${pkgdir}"/usr/share/doc/asciidoc/examples/website/asciidoc-graphviz-sample.txt
}
