pkgname=asciidoc-py3
pkgver=9.0.0rc2
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
sha512sums=('61ea1eb74a2e2da76f92e32ef279f8940fa4ea77a82078e15b54c7c6f134e9d177b0425c6eb8a239cfd2dc6a6f85ad5e93883a447a3e0e92850c0898747b5ea3')

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
