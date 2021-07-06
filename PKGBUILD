# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>
# Contributor: Steve Leach <sfkleach@gmail.com>

pkgname=poplog-git
pkgver=r152.80628bd
pkgrel=1
pkgdesc="poplog development system"
arch=('i686' 'x86_64')
url="http://www.cs.bham.ac.uk/research/projects/poplog/freepoplog.html"
license=('custom:poplog')

depends=('tcsh' 'libxext' 'libxt' 'openmotif' 'libxp' 'ncurses5-compat-libs')
optdepends=('espeak: for run-speaking-eliza demo')


source=("seed::git+https://github.com/GetPoplog/Seed.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/seed"
  make
}

package() {
  export POPLOG_HOME_DIR="$pkgdir/usr/share/poplog"
  mkdir -p "$POPLOG_HOME_DIR" "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"

  cd "$srcdir/seed"
  make install POPLOG_HOME_DIR="$POPLOG_HOME_DIR" EXEC_DIR="$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin/poplog"
  rm "$pkgdir/usr/bin/poplogV16"
  ln -s "/usr/share/poplog/current_usepop/pop/pop/poplog" "$pkgdir/usr/bin/poplog"
  ln -s "/usr/share/poplog/current_usepop/pop/pop/poplog" "$pkgdir/usr/bin/poplogV16"

  for f in "$pkgdir/usr/share/poplog/current_usepop/pop/doc/man/"*; do
    ln -s -t "$pkgdir/usr/share/man/man1" "${f##$pkgdir}"
  done 
}

pkgver() {
  cd "seed"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
