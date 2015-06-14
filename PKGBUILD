# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=itcl3
pkgver=3.4.1
pkgrel=1
pkgdesc="Provides the extra language support needed to build large Tcl/Tk applications, version 3.4"
arch=('i686' 'x86_64')
url="http://incrtcl.sourceforge.net/"
license=('custom')
depends=('glibc' 'tcl')
provides=(itcl)
conflicts=(itcl)
source=('http://downloads.sourceforge.net/project/incrtcl/%5BIncr%20Tcl_Tk%5D-source/3.4.1/itcl3.4.1.tar.gz'
	'configure.patch')

build() {
  cd "$srcdir"/itcl$pkgver

  patch -p0 -i ../configure.patch
  if [ `uname -m` = "x86_64" ]; then
    ./configure --prefix=/usr --enable-64bit
  else
    ./configure --prefix=/usr
  fi
  make all
}
package(){
  cd "$srcdir"/itcl$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm644 license.terms "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  chmod 644 "$pkgdir"/usr/lib/itcl3.4/libitclstub3.4.a
  
  # conflict with tcl-8.6.0
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share/man

  #cleaning
  rmdir "$pkgdir"/usr/bin
}
md5sums=('e7c98e0f69df1a675073ddd3344f0b7f'
         'a4ed1f57b041ea8b0a9094d303f5f9ff')
