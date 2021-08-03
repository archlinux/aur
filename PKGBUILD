# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>
# Contributor: Steve Leach <sfkleach@gmail.com>

pkgname=poplog-git
pkgver=r24.d8028de
pkgrel=1
pkgdesc="poplog development system"
arch=('i686' 'x86_64')
url="http://www.cs.bham.ac.uk/research/projects/poplog/freepoplog.html"
license=('custom:poplog')

depends=('tcsh' 'libxext' 'libxt' 'openmotif' 'libxp' 'ncurses5-compat-libs')
optdepends=('espeak: for run-speaking-eliza demo')


source=(
    "git+https://github.com/GetPoplog/Seed"
    "git+https://github.com/GetPoplog/Base"
    "git+https://github.com/GetPoplog/Corepops"
    "git+https://github.com/GetPoplog/Build"
    "http://www.cs.bham.ac.uk/research/projects/poplog/V16/DL/packages-V16.tar.bz2"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

_prefix=/opt
_bindir=/usr/bin
prepare() {
  cd "$srcdir/Build"
  git submodule init
  git config submodule.Seed.url "$srcdir/Seed"
  git config submodule.Base.url "$srcdir/Base"
  git config submodule.Corepops.url "$srcdir/Corepops"
  git submodule update
  mkdir -p "$srcdir/Seed/_download"
  cp "$srcdir/packages-V16.tar.bz2" "$srcdir/Seed/_download"
  touch "$srcdir/Seed/_download/Packages.Downloaded.proxy"
}

build() {
  cd "$srcdir/Build"
  make bindir="$_bindir" prefix="$_prefix"
}

package() {
  echo "$pkgdir"
  mkdir -p "$pkgdir/usr/share/man/man1"

  cd "$srcdir/Build/Seed"
  make install DESTDIR="$pkgdir" prefix="$_prefix" bindir="$_bindir"

  for f in "$pkgdir/$_prefix/share/poplog/current_usepop/pop/doc/man/"*; do
    ln -s -t "$pkgdir/usr/share/man/man1" "${f##$pkgdir}"
  done 
}

pkgver() {
  cd "$srcdir/Build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
