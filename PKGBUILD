# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=icon-git
pkgver=9.5.22e
pkgrel=1
epoch=1
pkgdesc="The Icon programming language"
arch=('i686' 'x86_64')
url="https://github.com/gtownsend/icon"
license=('custom')
depends=('sh' 'libx11')
makedepends=('git' 'libxt')
provides=('icon')
conflicts=('icon')
source=("git+$url.git" LICENSE)
sha256sums=('SKIP'
            '57b2b71129aa652ca63b07d3c23564bc7a45444a274d12e50856b46e4d088e35')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | cut -c2- | tr - .
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
