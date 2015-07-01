# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=neotoma-git
pkgver=20110529
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc="Erlang library and packrat parser-generator for parsing expression grammars"
url="http://github.com/seancribbs/neotoma/"
depends=('erlang')
makedepends=('git')

_gitroot="http://github.com/seancribbs/neotoma.git"
_gitname="neotoma"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  mkdir -p $pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver
  cp -R ebin extra priv src test -t $pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver

  # Install the MIT license
  install -m755 -d "$pkgdir/usr/share/licenses/erlang-neotoma"
  install -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/erlang-neotoma"
}
