# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=icon-git
pkgver=20181004
pkgrel=1
pkgdesc="The Icon programming language"
arch=('i686' 'x86_64')
url="http://www.cs.arizona.edu/icon/"
license=('custom')
depends=('sh' 'libx11')
makedepends=('git' 'libxt')
provides=('icon=951')
conflicts=('icon')
source=("git://github.com/gtownsend/icon.git" LICENSE)
sha256sums=('SKIP'
            '57b2b71129aa652ca63b07d3c23564bc7a45444a274d12e50856b46e4d088e35')

pkgver() {
  cd ${pkgname%-git}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd ${pkgname%-git}
  make X-Configure name=linux
  make CFLAGS+=" -D_STDIO_USES_IOSTREAM" -j1
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/share 
  make Install dest="$pkgdir"/usr/share/icon 
  for _i in colrbook colrpick fontpick icont iconx palette vib wevents 
  do
    install -D -m755 "$pkgdir"/usr/share/icon/bin/$_i "$pkgdir"/usr/bin/$_i 
    rm "$pkgdir"/usr/share/icon/bin/$_i
  done
  cd "$pkgdir"/usr/share/icon/bin
  rm icon
  install -D -m644 "$pkgdir"/usr/share/icon/bin/libcfunc.so \
    "$pkgdir"/usr/lib/libcfunc.so
  rm "$pkgdir"/usr/share/icon/bin/libcfunc.so
  rm -fr "$pkgdir"/usr/share/icon/bin
  for _i in icont icon
  do
    install -D -m644 "$pkgdir"/usr/share/icon/man/man1/$_i.1 \
	    "$pkgdir"/usr/share/man/man1/$_i.1
    rm "$pkgdir"/usr/share/icon/man/man1/$_i.1
  done
  rmdir "$pkgdir"/usr/share/icon/man/man1/
  rmdir "$pkgdir"/usr/share/icon/man
  cd "$pkgdir"/usr/bin
  ln -s icont icon
  install -D -m644 $srcdir/LICENSE \
    "$pkgdir"/usr/share/licenses/icon-git/LICENSE
}
