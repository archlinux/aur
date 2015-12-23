# Maintainer: James An <james@jamesan.ca>

pkgname=pbzx-stream-parser
pkgver=20140623
pkgrel=1
pkgdesc="Parse and unpack OS X Installer .pkg packages."
arch=('i686' 'x86_64')
url="http://www.tonymacx86.com/general-help/135458-$pkgname.html"
license=('GPL3')
depends=('xar')
makedepends=('recode')
source=("$pkgname.html"::"http://www.tonymacx86.com/general-help/135458-pbzx-stream-parser.html"
        typecast-pointer.patch)
md5sums=('SKIP' # The HTML file has a current timestamp in it, so its checksum changes every second.
         '332c6a07c8d494e17c9dc293b877bb6c')

prepare() {
  sed -n '/bbcode_code/,/}<\/pre>/{s/\s*<[^>]*>\s*//;p}' "$pkgname.html" | recode html..ascii >| main.c
  echo '' >> main.c
  patch -i typecast-pointer.patch
}

build() {
  g++ -o pbzx main.c -I/usr/include/xar -lxar $(pkg-config liblzma --cflags --libs)
}

package() {
  install -Dm755 pbzx "$pkgdir/usr/bin/pbzx"
}
