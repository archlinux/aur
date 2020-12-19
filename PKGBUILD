# Maintainer: Fabrizio del Tin <fdt@university.pub>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>

pkgbase=upp
pkgname=(upp theide umk)
yearver=2020.1
pkgver=15609
pkgrel=1
pkgdesc="Radical and innovative multiplatform C++ framework (known as U++)"
arch=('any')
url="http://www.ultimatepp.org"
license=('BSD')
depends=('gcc' 'make' 'zlib' 'bzip2' 'gtk3' 'libnotify' 'openssl' 'clang' 'pkgconfig' 'gdb')
options=(!makeflags emptydirs !strip)
source=("https://www.ultimatepp.org/downloads/upp-posix-$pkgver.tar.xz")

prepare() {
  cd "$srcdir/upp"
  ./configure
  make -f umkMakefile -j 4
  UMK="./umk"
}

build() {
  cd "$srcdir/upp"
  $UMK ./uppsrc ide CLANG -brs ./theide
  $UMK ./uppsrc umk CLANG -brs ./umk
}

package_theide(){
  # theide specific settings
  pkgdesc="Modern IDE designed for developing large U++/C++ applications"
  # man pages
  install -D "$srcdir/upp/uppsrc/ide/theide.1" "$pkgdir/usr/share/man/man1/theide.1"
  # desktop entry
  install -D "$srcdir/upp/uppsrc/ide/theide.desktop" "$pkgdir/usr/share/applications/theide.desktop"
  # icon
  install -D "$srcdir/upp/uppsrc/ide/theide-48.png" "$pkgdir/usr/share/pixmaps/theide.png"
  # fix permissions
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
  # install applications
  install -D "$srcdir/upp/theide" "$pkgdir/usr/bin/theide"
}

package_umk(){
  # umk specific settings
  pkgdesc="Command line builder for U++ applications"
  # man pages
  install -D "$srcdir/upp/uppsrc/umk/umk.1" "$pkgdir/usr/share/man/man1/umk.1"
  # fix permissions
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
  # install applications
  install -D "$srcdir/upp/umk" "$pkgdir/usr/bin/umk"
}

package_upp() {
  # upp specific settings
  pkgdesc="Radical and innovative multiplatform C++ framework (known as U++)"
  depends=('theide')
  #copy source files
  mkdir -p "$pkgdir/usr/share/upp"
  msg2 "Moving the source codes..."
  cp -r "$srcdir/upp/"{bazaar,examples,reference,tutorial,uppsrc} "$pkgdir/usr/share/upp/"
  echo "#define IDE_VERSION \"$pkgver-Arch\"" > "$pkgdir/usr/share/upp/uppsrc/ide/version.h"
  #fix permissions
  msg2 "Setting permissions..."
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
}

md5sums=('a5c8583ba0aa2e7341c0cbb2a589806f')
