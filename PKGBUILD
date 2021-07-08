# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>
# Contributor: Steve Leach <sfkleach@gmail.com>

pkgname=poplog-git
pkgver=r7.8532fd8
pkgrel=2
pkgdesc="poplog development system"
arch=('i686' 'x86_64')
url="http://www.cs.bham.ac.uk/research/projects/poplog/freepoplog.html"
license=('custom:poplog')

depends=('tcsh' 'libxext' 'libxt' 'openmotif' 'libxp' 'ncurses5-compat-libs')
optdepends=('espeak: for run-speaking-eliza demo')


source=(
    "git+https://github.com/GetPoplog/Seed"
    "git+https://github.com/GetPoplog/Docs"
    "git+https://github.com/GetPoplog/Base"
    "git+https://github.com/GetPoplog/Corepops"
    "git+https://github.com/GetPoplog/Build"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
prepare() {
  cd "$srcdir/Build"
  git submodule init
  git config submodule.Seed.url "$srcdir/Seed"
  git config submodule.Docs.url "$srcdir/Docs"
  git config submodule.Base.url "$srcdir/Base"
  git config submodule.Corepops.url "$srcdir/Corepops"
  git submodule update
}

build() {
  cd "$srcdir/Build"
  make
}

package() {
  export DESTDIR="$pkgdir"
  export PREFIX="/usr"
  export POPLOG_HOME_DIR="$DESTDIR/$PREFIX/share/poplog"
  mkdir -p "$POPLOG_HOME_DIR" "$DESTDIR/$PREFIX/bin" "$DESTDIR/$PREFIX/share/man/man1"

  cd "$srcdir/Build/Seed"
  make install POPLOG_HOME_DIR="$POPLOG_HOME_DIR" EXEC_DIR="$DESTDIR/$PREFIX/bin"
  rm "$pkgdir/$PREFIX/bin/poplog"
  rm "$pkgdir/$PREFIX/bin/poplogV16"
  ln -s "/$PREFIX/share/poplog/current_usepop/pop/pop/poplog" "$pkgdir/$PREFIX/bin/poplog"
  ln -s "/$PREFIX/share/poplog/current_usepop/pop/pop/poplog" "$pkgdir/$PREFIX/bin/poplogV16"

  for f in "$pkgdir/$PREFIX/share/poplog/current_usepop/pop/doc/man/"*; do
    ln -s -t "$pkgdir/$PREFIX/share/man/man1" "${f##$pkgdir}"
  done 
}

pkgver() {
  cd "$srcdir/Build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
