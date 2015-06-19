# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe
_sfproject=ipe7
_dirver=7.1
pkgver=7.1.7
pkgrel=2
pkgdesc="The extensible drawing editor"
url="http://tclab.kaist.ac.kr/ipe/"
depends=('lua' 'qt4' 'freetype2' 'zlib' 'poppler' 'python2')
arch=('i686' 'x86_64')
license=("GPL")
conflicts=('ipe')
ipepresenter_version_=d0b0ea368ce9
source=("http://downloads.sourceforge.net/project/$_sfproject/$pkgname/$_dirver/$pkgname-$pkgver-src.tar.gz"
        "http://hg.mrzv.org/IpePresenter/archive/$ipepresenter_version_.tar.gz"
        "ipe.bash-completion"
        "config.patch"
        )
md5sums=('8c31313ec839fb7958b4a627634c907e'
         '3bc8dc576ee3acced2ff3c6ea6a01319'
         '694f0d5402655901be385647e5d8d6e3'
         'af3db2930ff57decb63cd322a845b025')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  patch config.mak < "$srcdir/config.patch"
}

build() {
  # Ipe
  cd "$srcdir/$pkgname-$pkgver/src"
  make IPEPREFIX=/usr

  # IpePresenter
  cd "$srcdir/IpePresenter-$ipepresenter_version_"
  CPPFLAGS+=" -I ../$pkgname-$pkgver/src/include -I ../$pkgname-$pkgver/src/ipecanvas" \
    LIBS=" -L ../$pkgname-$pkgver/build/lib" \
    make
}

package() {
  # Ipe
  cd "$srcdir/$pkgname-$pkgver/src"
  INSTALL_ROOT="$pkgdir" make install IPEPREFIX=/usr

  # IpePresenter
  cd "$srcdir/IpePresenter-$ipepresenter_version_"
  install -m755 ipepresenter "$pkgdir/usr/bin"

  # Lua binding
  mkdir "$pkgdir/usr/lib/lua"
  ln -s /usr/lib/libipelua.so "$pkgdir/usr/lib/lua/ipe.so"

  # Bash completion
  mkdir -p "$pkgdir/etc/bash_completion.d"
  install "$srcdir/ipe.bash-completion" "$pkgdir/etc/bash_completion.d/ipe"
}

# vim: ft=sh syn=sh et ts=2 sw=2
