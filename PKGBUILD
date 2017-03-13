# Maintainer: Gabriel Tremblay gabriel@delvelabs.ca
pkgname=i8kutils-git
_pkgname=i8kutils
pkgrel=1
pkgver=20170306.976c36a
pkgdesc="Fan control for Dell laptops"
makedepends=("git")
conflicts=("$_pkgname")
arch=("i686" "x86_64")
url="https://github.com/vitorafsr/$_pkgname"
license=("GPL")
depends=("bash")
optdepends=("tcl: for i8kmon daemon" "acpi: for i8kmon daemon" "tk: for i8kmon GUI mode")
backup=("etc/$_pkgname/i8kmon.conf")
source=("git+https://github.com/vitorafsr/$_pkgname.git"
	"fix_Makefile.patch"
	"i8kmon.service")

sha1sums=("SKIP"
	"fe5407464f59c023c5b52fdadd3275abdac720a4"
	"5c20f5241de7e60b46117269f4e867b08734cdc8")

prepare() {
  cd $srcdir
  cd $_pkgname
  # conform to Arch Linux guidelines
  sed -i "s|/etc/i8kmon|/etc/$_pkgname/i8kmon.conf|g" i8kmon.1
  sed -i "s|/etc/i8kmon.conf|/etc/$_pkgname/i8kmon.conf|g" i8kmon
  make clean
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  install -D -m644 i8kctl.1 i8kmon.1 "$pkgdir/usr/share/man/man1"
  install -D -m755 i8kctl i8kfan i8kmon "$pkgdir/usr/bin"

  install -D -m644 i8kmon.conf "$pkgdir/etc/i8kutils/i8kmon.conf"
  install -D -m644 ../i8kmon.service "$pkgdir/usr/lib/systemd/system/i8kmon.service"
}
