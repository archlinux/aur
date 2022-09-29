pkgname=hashcat-utils-git
pkgver=v1.9.r27.gc208300
pkgrel=1
pkgdesc="Hashcat-utils are a set of small utilities that are useful in advanced password cracking."
arch=('i686' 'x86_64')
url="https://github.com/hashcat/hashcat-utils"
license=('MIT')
groups=()
depends=('perl')
makedepends=('git' 'make')
provides=('hashcat-utils')
conflicts=('hashcat-utils')
replaces=()
backup=()
options=()
install=
source=(git+https://github.com/hashcat/hashcat-utils.git)
noextract=()
md5sums=('SKIP')

_gitroot='https://github.com/hashcat/hashcat-utils.git'
_gitname='hashcat-utils'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname/src"

  make
  strip *.bin
}

package() {
  cd "$srcdir/$_gitname/src"

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "$pkgdir/usr/bin/"

  cp ./*.bin "$pkgdir/usr/bin/"

  cd  "$pkgdir/usr/bin/"
  for i in $(ls ".")
  do
    chmod +x $i
    mv $i ${i%.*}
  done

  cd "$srcdir/$_gitname/src"

  cp ./*.pl "$pkgdir/usr/bin"

  for i in $(ls "." | grep -E "\.pl$")
  do
    chmod +x $i
  done

}

# vim:set ts=2 sw=2 et:
