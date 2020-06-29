pkgname=asciidoc-py3
pkgver=9.0.1
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
b2sums=('b318f44c1d392c1c77212da0a5feafa0b1c20d70ac94535181d6c9d22f4025c74bffee16c4bd1e4866348fb4e49da951816b7efd8e359b38430c1c8f7d75a019')

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
