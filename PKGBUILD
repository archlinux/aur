# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe
_dirver=7.2
pkgver=7.2.7
pkgrel=1
pkgdesc="The extensible drawing editor"
url="http://tclab.kaist.ac.kr/ipe/"
depends=('lua' 'qt5-base' 'freetype2' 'zlib' 'poppler' 'python2')
arch=('i686' 'x86_64')
license=("GPL")
conflicts=('ipe')
ipepresenter_version_=b714decd7d5b
source=("http://dl.bintray.com/otfried/generic/$pkgname/$_dirver/$pkgname-$pkgver-src.tar.gz"
        "http://hg.mrzv.org/IpePresenter/archive/$ipepresenter_version_.tar.gz"
        "ipe.bash-completion"
        "config.patch"
        )

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
md5sums=('0898173099e7f623cf6fa130abdb1273'
         '95158c047f0a9b0916b688af1faed779'
         '694f0d5402655901be385647e5d8d6e3'
         'd4e289bce01302a8b76a0df294c7de40')
