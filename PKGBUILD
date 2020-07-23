pkgname=asciidoc-py3
pkgver=9.0.2
pkgrel=1
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
source=("$url/archive/$pkgver.tar.gz")
b2sums=('5f5deca6b8c15d4b86e2bd6fdb131908eecd862a5fdbbd8418937050d335a25ad012a3b1bc716379f5623db676176fc6da1a09691c2b42a213a6230281626b69')

build() {
  cd ${pkgname}-${pkgver}

  autoconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
  make docs DESTDIR=${pkgdir}

  install -Dm644 filters/graphviz/asciidoc-graphviz-sample.txt \
    -t "${pkgdir}"/etc/asciidoc/filters/graphviz
  install -Dm644 asciidocapi.py \
    -t "${pkgdir}"/usr/lib/python3.8/site-packages
  ln -sf ../../../../../etc/asciidoc/filters/graphviz/asciidoc-graphviz-sample.txt \
    "${pkgdir}"/usr/share/doc/asciidoc/website/asciidoc-graphviz-sample.txt
}
