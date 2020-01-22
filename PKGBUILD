pkgname=asciidoc-py3
pkgver=9.0.0rc1
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
sha512sums=('965d65df18ff90596e5cd72bec8d0f7daf2f6ad585ec77af2a6ae9637569b613e2384cc7015c1823fcde99be8170107789505a543fe8b6d3273f2c75a6a92960')

build() {
  cd ${pkgname}-${pkgver}

  autoconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
}

package() {
  cd ${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
  make docs DESTDIR=${pkgdir}

  install -Dm644 filters/graphviz/asciidoc-graphviz-sample.txt \
    -t "${pkgdir}"/etc/asciidoc/filters/graphviz
  install -Dm644 asciidocapi.py \
    -t "${pkgdir}"/usr/lib/python3.8/site-packages
  ln -sf ../../../../../../etc/asciidoc/filters/graphviz/asciidoc-graphviz-sample.txt \
    "${pkgdir}"/usr/share/doc/asciidoc/examples/website/asciidoc-graphviz-sample.txt
}
