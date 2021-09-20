# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=zelvici-git
pkgver=r1.fba84ee
pkgrel=2
pkgdesc="2D arcade game featuring lovely turtle (git)"
arch=(x86_64)
url="https://github.com/knihovnice/zelvici"
license=('GPL-2')
depends=('gcc-libs' 'sdl_mixer')
makedepends=('git')
replaces=('zelvici-svn')
source=("zelvici::git+https://github.com/knihovnice/zelvici.git#branch=master" "zelvici.desktop")
md5sums=('SKIP'
         '23cde56b0478965c568e1b9713f1d6c7')

pkgver() {
  cd "${srcdir}/zelvici"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/zelvici
  sed -i 's/march=i686/march=x86-64/' Makefile
  [ -f Butterfly.h ] && mv Butterfly.h ButterFly.h
}

build() {
  cd "${srcdir}/zelvici"
  /usr/bin/make
}

package() {
	mkdir -p $pkgdir/usr/share/zelvici $pkgdir/usr/bin
	cd $srcdir/zelvici
	/bin/tar cf - */ | ( cd ../../pkg/$pkgname/usr/share/zelvici; tar xfp - )
	find $pkgdir/usr/share/zelvici -type f -exec chmod 644 '{}' \;
	install -Dm 755 $srcdir/zelvici/zelvici $pkgdir/usr/share/zelvici/zelvici
	install -Dm 644 $srcdir/zelvici.desktop $pkgdir/usr/share/applications/zelvici.desktop

        echo "#!/bin/sh
cd /usr/share/zelvici
./zelvici \"\$@\"" > $pkgdir/usr/bin/zelvici
        chmod 755 $pkgdir/usr/bin/zelvici
}
