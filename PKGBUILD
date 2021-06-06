# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=bower-mail-git
_pkgname=bower
pkgver=r888.ea5f582
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=('any')
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file' 'mercury>=14.04')
makedepends=('gpgme' 'pandoc')
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower' 'bower-mail')
license=('GPL3')
source=("git+https://github.com/wangp/bower.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    patch "$srcdir/bower/src/Mercury.options" < ../arch.patch
    cd "$srcdir/bower"
    make PARALLEL=$MAKEFLAGS
    make man
    gzip -f bower.1
}

package() {
    install -Dm 755 "$srcdir/bower/bower" "$pkgdir/usr/bin/bower"
    install -Dm 644 "$srcdir/bower/bower.1.gz" \
      "$pkgdir/usr/share/man/man1/bower.1.gz"
}

# vim: et ts=2 sw=2
