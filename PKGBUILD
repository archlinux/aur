pkgname=pacaur-git
pkgver=4.6.2
pkgrel=1
pkgdesc="An AUR helper that minimizes user interaction"
arch=('any')
url="https://github.com/rmarquis/pacaur"
license=('ISC')
depends=('cower' 'expac' 'sudo' 'git')
makedepends=('perl')
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
  mkdir -p $pkgdir/usr/share/licenses/pacaur
  install -D -m644 ./LICENSE $pkgdir/usr/share/licenses/pacaur/LICENSE
  for i in {ca,de,es,fr,hu,it,ja,nl,pl,pt,ru,sk,sr,sr@latin,tr}; do
    mkdir -p $pkgdir/usr/share/locale/$i/LC_MESSAGES/
    msgfmt ./po/$i.po -o $pkgdir/usr/share/locale/$i/LC_MESSAGES/pacaur.mo
  done
}
