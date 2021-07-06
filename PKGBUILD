# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pinentry-git
pkgver=1.2.base.r11.g7f7fd8b
pkgrel=1
pkgdesc="A small collection of dialog programs that allow GnuPG to read passphrases and PIN numbers in a secure manner"
arch=('i686' 'x86_64')
url="https://gnupg.org/software/pinentry/index.html"
license=('GPL2')
depends=('glibc' 'glib2' 'libassuan' 'libcap' 'libsecret' 'ncurses')
makedepends=('git' 'efl' 'gcr' 'gtk2' 'qt5-base')
provides=('pinentry')
conflicts=('pinentry')
source=("git+https://dev.gnupg.org/source/pinentry.git"
        "pinentry.bin::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/pinentry/trunk/pinentry"
        "preexec::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/pinentry/trunk/preexec")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "pinentry"

  git describe --long --tags | sed 's/^pinentry-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pinentry"

  ./autogen.sh --force
  ./configure \
    --prefix="/usr" \
    --enable-maintainer-mode \
    --enable-pinentry-tty \
    --enable-pinentry-curses \
    --enable-fallback-curses \
    --enable-pinentry-efl \
    --enable-pinentry-emacs \
    --enable-pinentry-gnome3 \
    --enable-pinentry-gtk2 \
    --enable-pinentry-qt \
    --enable-libsecret
  make
}

package() {
  cd "pinentry"

  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/pinentry.bin" "$pkgdir/usr/bin/pinentry"
  install -Dm755 "$srcdir/preexec" -t "$pkgdir/etc/pinentry"
}
