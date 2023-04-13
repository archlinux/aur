# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcsh-git
pkgver=6.24.8.r7.g253e085
pkgrel=1
pkgdesc="C shell with file name completion and command line editing"
arch=('i686' 'x86_64')
url="https://www.tcsh.org/"
license=('BSD')
depends=('glibc' 'ncurses')
makedepends=('git')
provides=("tcsh=$pkgver")
conflicts=('tcsh')
backup=('etc/csh.cshrc'
        'etc/csh.login')
install=tcsh.install
source=("git+https://github.com/tcsh-org/tcsh.git"
        "csh.cshrc::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tcsh/trunk/csh.cshrc"
        "csh.login::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tcsh/trunk/csh.login")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "tcsh"

  git describe --long --tags | sed 's/^TCSH//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "tcsh"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "tcsh"

  make check
}

package() {
  cd "tcsh"

  make DESTDIR="$pkgdir" install

  ln -s "tcsh" "$pkgdir/usr/bin/csh"
  ln -s "tcsh.1" "$pkgdir/usr/share/man/man1/csh.1"
  install -Dm644 "$srcdir"/csh.{cshrc,login} -t "$pkgdir/etc"
  install -Dm644 "Copyright" -t "$pkgdir/usr/share/licenses/tcsh"
}
