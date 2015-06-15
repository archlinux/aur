# Maintainer: Spyhawk

pkgname=pacaur-git
pkgver=4.2.27
pkgrel=1
pkgdesc="A fast workflow AUR helper using cower as backend"
arch=('any')
url="https://github.com/rmarquis/pacaur"
license=('GPL')
depends=('cower' 'expac' 'sudo' 'pacman')
makedepends=('git' 'perl')
provides=('pacaur')
conflicts=('pacaur')
backup=('etc/xdg/pacaur/config')
source=("git://github.com/rmarquis/pacaur.git")
md5sums=('SKIP')
_gitname="pacaur"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i "s/version=\"[0-9].[0-9].[0-9]*\"/version=\"$pkgver\"/g" ./pacaur
}

build() {
  cd "$srcdir/$_gitname"
  pod2man --utf8 --section=8 --center="Pacaur Manual" --name="PACAUR" --release="$pkgname $pkgver" ./README.pod > pacaur.8
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/etc/xdg/pacaur
  install -D -m644 ./config $pkgdir/etc/xdg/pacaur/config
  mkdir -p $pkgdir/usr/bin
  install -D -m755 ./pacaur $pkgdir/usr/bin/pacaur
  mkdir -p $pkgdir/usr/share/bash-completion/completions
  install -D -m644 ./bash.completion $pkgdir/usr/share/bash-completion/completions/pacaur
  mkdir -p $pkgdir/usr/share/zsh/site-functions
  install -D -m644 ./zsh.completion $pkgdir/usr/share/zsh/site-functions/_pacaur
  mkdir -p $pkgdir/usr/share/man/man8
  install -D -m644 ./pacaur.8 $pkgdir/usr/share/man/man8/pacaur.8 
  mkdir -p $pkgdir/usr/share/locale/{ca,de,es,fr,it,ja,pl,pt,ru,tr}/LC_MESSAGES/
  msgfmt ./po/ca.po -o $pkgdir/usr/share/locale/ca/LC_MESSAGES/pacaur.mo
  msgfmt ./po/de.po -o $pkgdir/usr/share/locale/de/LC_MESSAGES/pacaur.mo
  msgfmt ./po/es.po -o $pkgdir/usr/share/locale/es/LC_MESSAGES/pacaur.mo
  msgfmt ./po/fr.po -o $pkgdir/usr/share/locale/fr/LC_MESSAGES/pacaur.mo
  msgfmt ./po/it.po -o $pkgdir/usr/share/locale/it/LC_MESSAGES/pacaur.mo
  msgfmt ./po/ja.po -o $pkgdir/usr/share/locale/ja/LC_MESSAGES/pacaur.mo
  msgfmt ./po/pl.po -o $pkgdir/usr/share/locale/pl/LC_MESSAGES/pacaur.mo
  msgfmt ./po/pl.po -o $pkgdir/usr/share/locale/pt/LC_MESSAGES/pacaur.mo
  msgfmt ./po/ru.po -o $pkgdir/usr/share/locale/ru/LC_MESSAGES/pacaur.mo
  msgfmt ./po/tr.po -o $pkgdir/usr/share/locale/tr/LC_MESSAGES/pacaur.mo
}
