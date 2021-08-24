# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>
# Contributor: Steve Leach <sfkleach@gmail.com>

pkgname=poplog-git
pkgver=v0.3.0.r136.gb4d3163
pkgrel=2
pkgdesc="poplog development system"
arch=('x86_64')
url="https://getpoplog.github.io/"
license=('custom:poplog')
depends=('tcsh' 'libxext' 'libxt' 'openmotif' 'libxp' 'ncurses5-compat-libs')
optdepends=('espeak: for run-speaking-eliza demo')
conflicts=(poplog)
source=(
    "git+https://github.com/GetPoplog/Seed"
    "http://www.cs.bham.ac.uk/research/projects/poplog/V16/DL/packages-V16.tar.bz2"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

_prefix=/opt
_bindir=/usr/bin
prepare() {
  cd "$srcdir/Seed"

  mkdir -p "$srcdir/Seed/_download"
  cp "$srcdir/packages-V16.tar.bz2" "$srcdir/Seed/_download"
  touch "$srcdir/Seed/_download/Packages.Downloaded.proxy"
}

build() {
  cd "$srcdir/Seed"
  make bindir="$_bindir" prefix="$_prefix"
}

package() {
  echo "$pkgdir"
  mkdir -p "$pkgdir/usr/share/man/man1"

  cd "$srcdir/Seed"
  make install DESTDIR="$pkgdir" prefix="$_prefix" bindir="$_bindir"

  for f in "$pkgdir/$_prefix/share/poplog/current_usepop/pop/doc/man/"*; do
    ln -s -t "$pkgdir/usr/share/man/man1" "${f##$pkgdir}"
  done 
}

pkgver() {
  cd "$srcdir/Seed"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
