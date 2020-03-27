# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wp2latex-hg
pkgver=r369.690681b7d114
pkgrel=1
pkgdesc="Converts WordPerfect document formats to LaTeX"
url="http://www.penguin.cz/~fojtik/${pkgname%-hg}/${pkgname%-hg}.htm"
arch=('i686' 'x86_64')
license=('GPL')
source=("${pkgname%-hg}::hg+https://bitbucket.org/JaFojtik/wp2latex")
sha256sums=('SKIP')
depends=('libjpeg' 'gcc-libs' 'libpng')
makedepends=('mercurial')
options=('!strip')

pkgver() {
  cd ${pkgname%-hg}
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
#prepare() {
#}

build() {
  # normal build
  cd ${pkgname%-hg}/trunk
  CXXFLAGS+=" -fpermissive" ./configure --prefix=/usr
  make x2latex
}

package() {
  cd ${pkgname%-hg}/trunk
  install -Dm755 "$srcdir"/${pkgname%-hg}/trunk/bin/linux/${pkgname%-hg} \
    "$pkgdir/"usr/bin/${pkgname%-hg} 
  for _i in cs de
  do
    install -Dm644 \
    "$srcdir"/${pkgname%-hg}/trunk/doc/locale/${_i}/lc_messages/${pkgname%-hg}.mo \
      "$pkgdir"/usr/share/locale/${_i}/LC_MESSAGES/${pkgname%-hg}.mo
  done 
  install -Dm644 "$srcdir"/${pkgname%-hg}/trunk/doc/${pkgname%-hg}.1 \
    "$pkgdir"/usr/share/man/man1/${pkgname%-hg}.1 
  install -d "$pkgdir"/usr/share/${pkgname%-hg}/doc
  cp -R "$srcdir"/${pkgname%-hg}/trunk/doc/program.man/* \
    "$pkgdir"/usr/share/${pkgname%-hg}/doc
  install -d "$pkgdir"/usr/share/texmf/tex/latex/${pkgname%-hg}
  cp -r "$srcdir"/${pkgname%-hg}/trunk/styles.tex \
    "$pkgdir"/usr/share/texmf/tex/latex/${pkgname%-hg}
}
