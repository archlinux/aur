# Maintainer: Clemmitt Sigler <cmsigler.online@gmail.com>
# Contributor: Piscium <groknok@gmail.com>

pkgname=qemacs-git
pkgdesc="QEmacs (Quick Emacs) is a very small editor with Emacs look and feel, syntax highlighting, UTF-8, dired mode with preview window, and many other features."

pkgver=r1120.f7c1621
pkgrel=1
_gitname="qemacs"
arch=('x86_64')
url="https://github.com/qemacs/qemacs"
license=('LGPL2.1')
depends=('libpng' 'libxv')
optdepends=('jp2a: for converting JPG images to ASCII')
makedepends=('git' 'libxrender' 'texi2html')
provides=('qemacs')
conflicts=('qemacs' 'qemacs-cvs')

source=("git+https://github.com/qemacs/qemacs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr --enable-x11 --enable-xv --enable-xshm --enable-xrender
  make -j1
}

package() {
  cd "$srcdir/$_gitname"
  make -j1 DESTDIR=$pkgdir prefix="/usr/" datadir="/usr/share" mandir="/usr/share/man" install
  install -Dm644 config.eg $pkgdir/usr/share/qe/config.eg
  install -Dm644 qe-doc.html $pkgdir/usr/share/qe/qe-doc.html
  install -Dm644 README.md $pkgdir/usr/share/qe/README.md
}
