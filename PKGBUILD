# Maintainer: Rafael Silva <silvagracarafael gmail.com>

pkgname=armmem-git
pkgver=r2.940c92e
pkgrel=1
pkgdesc="Takes an ELF and a Linker Script as input and prints informations about the program."
arch=('any')
url="https://github.com/vankxr/armmem"
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'npm')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {

  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd "$pkgname"
  mkdir -p $pkgdir/usr
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;

  chmod -R u=rwX,go=rX "$pkgdir"
  chown -R root:root "$pkgdir"

}
