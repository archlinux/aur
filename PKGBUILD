# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=hledger-git
pkgver=20151116
pkgrel=1
pkgdesc="The hledger command-line and web-based accounting tool"
arch=('i686' 'x86_64')
makedepends=('git' 'haskell-stack' 'ncurses')
url="http://hledger.org"
license=('GPL3')
options=('strip')
source=(git+https://github.com/simonmichael/hledger)
sha256sums=('SKIP')
provides=('hledger' 'hledger-ui' 'hledger-web')
conflicts=('hledger' 'hledger-ui' 'hledger-web')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/hledger"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/hledger"
  for _doc in README.md \
              data \
              doc/ANNOUNCE \
              doc/CHANGES \
              extra \
              hledger/hledger.1.md \
              hledger-lib/hledger_csv.5.md \
              hledger-lib/hledger_journal.5.md \
              hledger-lib/hledger_timelog.5.md \
              hledger-ui/hledger-ui.1.md \
              hledger-web/hledger-web.1.md \
              site \
              tools; do
    cp -dpr --no-preserve=ownership $_doc "$pkgdir/usr/share/doc/hledger"
  done

  msg2 'Installing manuals...'
  for _man1 in hledger/hledger.1 \
               hledger-ui/hledger-ui.1 \
               hledger-web/hledger-web.1; do
    install -Dm 644 $_man1 -t "$pkgdir/usr/share/man/man1"
  done
  for _man5 in hledger-lib/hledger_csv.5 \
               hledger-lib/hledger_journal.5 \
               hledger-lib/hledger_timelog.5; do
    install -Dm 644 $_man5 -t "$pkgdir/usr/share/man/man5"
  done

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/bin"
  stack --local-bin-path "$pkgdir/usr/bin" install
}
