# Maintainer: jun7 <jun7@hush.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=rox-filer-hugeicons
pkgver=2.11.h
pkgrel=2
branch=stable
pkgdesc="A fork of rox-filer having 64 - 512px icons"
arch=('i686' 'x86_64')
conflicts=('rox')
provides=('rox')
license=('GPL')
url="https://github.com/jun7/rox-filer"
depends=('sh' 'libsm' 'gtk2')
makedepends=('libxslt' 'git')
source=("git+https://github.com/jun7/rox-filer.git#branch=$branch")
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/rox-filer"
  printf "2.11.h.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/rox-filer"
  git pull --rebase origin $branch
}

build() {
  cd "$srcdir/rox-filer"
  ./ROX-Filer/AppRun --compile LIBS="-ldl -lm"
  xsltproc -o rox.1 "$srcdir/rox-filer/ROX-Filer/src/Docs/to_man.xsl" "$srcdir/rox-filer/ROX-Filer/src/Docs/Manual.xml"
}

package() {
  cd "$srcdir/rox-filer"
  install -d "$pkgdir/usr/share/Choices/MIME-types"
  install -m755 Choices/MIME-types/* "$pkgdir/usr/share/Choices/MIME-types/"
  cp -rp ROX-Filer "$pkgdir/usr/share/"
  rm -fr "$pkgdir"/usr/share/ROX-Filer/{src,build}

  install -Dm755 "$srcdir/rox-filer/rox.sh" "$pkgdir/usr/bin/rox"
  install -Dm644 rox.1 "$pkgdir/usr/share/man/man1/rox.1"
  ln -sf rox.1 "$pkgdir/usr/share/man/man1/ROX-Filer.1"

  install -Dm644 "$srcdir/rox-filer/rox.desktop" "$pkgdir/usr/share/applications/rox.desktop"
  install -Dm644 "$srcdir/rox-filer/rox.svg" "$pkgdir/usr/share/pixmaps/rox.svg"
  install -Dm644 "$srcdir/rox-filer/ROX-Filer/.DirIcon" "$pkgdir/usr/share/pixmaps/rox.png"
}
