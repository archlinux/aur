pkgname=asciidoc-py3
pkgver=9.0.0
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
b2sums=('7f93161887c17aa2b9d99863a97b8eabc76c58910cd81fb2b3e408a0f7b242dd792c6d26510a61a4a275f482c38a2b2fc277a52bdc22580b7b3694d524ae1f13')

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
