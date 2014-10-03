# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jonathan Fine, quantax, xx4h

pkgname=alfont
pkgver=2.0.9
pkgrel=7
pkgdesc="Allegro wrapper for FreeType2 enabling the use of various font formats"
arch=('i686' 'x86_64')
url="http://opensnc.sourceforge.net/alfont/mirror/"
license=("custom: FreeType2")
depends=('allegro4' 'freetype2')
makedepends=('unrar')
source=("http://opensnc.sourceforge.net/alfont/mirror/AlFont${pkgver//.}.rar"
        "alfont-$pkgver-fix-memory-leaks.patch"
        "alfont-$pkgver-remove-alfont_get_string.patch")
sha256sums=('734f7f9758dfb3b80979baf010245d931c9cd2a7557683906c7fc616353f960d'
            '1d94d1609ab082b2289ac7051290fa33d38023de0411c369e2e1b9cafc1c5b36'
            'bf2f309317c741a252e11003e12df0de26d71894149c548cd815e5d3258429ca')
noextract=("AlFont${pkgver//.}.rar")

prepare() {
  msg2 "Extracting source with unrar, as libarchive has no support for 'solid' rar archives..."
  unrar x -idq -o+ AlFont${pkgver//.}.rar alfont/{docs/FTL.txt,include,src/alfont.c}
  cd alfont
  # fix line endings
  sed 's/\r//g' -i include/alfont*.h docs/FTL.txt src/alfont.c
  # fix memory leaks
  patch -Np1 < ../alfont-$pkgver-fix-memory-leaks.patch
  # remove alfont_get_string
  patch -Np1 < ../alfont-$pkgver-remove-alfont_get_string.patch
  # enable building for linux
  sed '/^#define ALFONT_WINDOWS/s,^,//,;/^\/\/#define ALFONT_LINUX/s,^//,,' -i include/alfont.h
}

build() {
  cd alfont
  # build instructions adapted from: http://pkgs.fedoraproject.org/cgit/alfont.git/tree/alfont.spec
  gcc $CFLAGS -fPIC $(freetype-config --cflags) -Iinclude -c src/alfont.c -o src/alfont.o
  gcc -shared $LDFLAGS -Wl,--no-as-needed,-soname,libalfont.so.${pkgver%%.*} \
    $(allegro-config --libs) $(freetype-config --libs) src/alfont.o -o libalfont.so.$pkgver
}

package() {
  cd alfont
  # library
  install -Dm755 libalfont.so.$pkgver "$pkgdir"/usr/lib/libalfont.so.$pkgver
  ln -s libalfont.so.$pkgver "$pkgdir"/usr/lib/libalfont.so.${pkgver%%.*}
  ln -s libalfont.so.$pkgver "$pkgdir"/usr/lib/libalfont.so
  # headers
  install -Dm644 include/alfont.h "$pkgdir"/usr/include/alfont.h
  install -Dm644 include/alfontdll.h "$pkgdir"/usr/include/alfontdll.h
  # license
  install -Dm644 docs/FTL.txt "$pkgdir"/usr/share/licenses/alfont/FTL.txt
}
