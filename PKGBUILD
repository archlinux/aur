# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=asciidoc
pkgname=asciidoc-git
pkgver=10.2.0.8.g6d9f76c
pkgrel=1
pkgdesc='Text document format for short documents, articles, books and UNIX man pages'
arch=('any')
url='https://asciidoc-py.github.io'
license=('GPL')
depends=('python' 'libxslt' 'docbook-xsl')
checkdepends=('dblatex' 'graphviz' 'lilypond' 'python-pytest'{,-mock} 'source-highlight')
makedepends=(git python-{build,installer,wheel} python-setuptools)
provides=('asciidoc')
conflicts=('asciidoc')
optdepends=('graphviz: graphviz-filter'
            'lilypond: music-filter'
            'imagemagick: music-filter'
            'source-highlight: source-highlight-filter'
            'dblatex: pdf generation'
            'fop: alternative pdf generation'
            'w3m: text generation'
            'lynx: alternative text generation')
source=("git+https://github.com/asciidoc/asciidoc.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/./g;s/^v//'
}

prepare() {
  cd $_pkgname
  sed -i \
    -e '/^build: /a \\tpython3 -m build -wn' \
    -e '/pip install/{s#pip install --root#installer -d#;s#\.$#dist/*.whl#}' \
    Makefile.in
  # https://github.com/asciidoc-py/asciidoc-py/issues/234
  autoconf
}

build() {
  cd $_pkgname
  # https://github.com/asciidoc-py/asciidoc-py/issues/234#issuecomment-1045970138
  ./configure \
      --docdir /usr/share/doc/$pkgname \
      --prefix /usr
  make build
}

check() {
  cd $_pkgname
  make test
}

package() {
    cd $_pkgname
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" docs
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" doc/*.1
  # ascidocapi is deprecated, but still included in 10.x on a "provisional" basis
  local _platlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["platlib"])')"
  install -Dm0644 -t "${pkgdir}/${_platlib}/${pkgname}/" asciidoc/api.py
}
