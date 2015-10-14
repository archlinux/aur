# Maintainer: maz_1 <ohmygod19993 at gmail dotcom>

pkgname=unarchiver-nodep
epoch=1
pkgver=1.9.1
pkgrel=1
pkgdesc="unar and lsar that don't depend on gnustep-base. Resolv conflict with darling-git."
arch=('x86_64')
url="http://unarchiver.c3.cx/"
license=('LGPL2.1')
depends=('openssl' 'bzip2' 'icu' 'gcc-libs' 'zlib')
#makedepends=('gcc-objc' 'gnustep-base-clang-svn')
provides=(unarchiver)
conflicts=(unarchiver)
source=("gnustep-base_x86_64.tar.xz::https://www.archlinux.org/packages/community/x86_64/gnustep-base/download/"
    "unarchiver-x86_64.tar.xz::http://repo.archlinuxcn.org/x86_64/unarchiver-1%3a1.9.1-1-x86_64.pkg.tar.xz")
noextract=('gnustep-base_x86_64.tar.xz' 'unarchiver-x86_64.tar.xz')
sha1sums=('SKIP' 'SKIP')

prepare(){
  cd "$srcdir"
  mkdir gnustep-base
  cd gnustep-base
  tar xpJf ../gnustep-base_x86_64.tar.xz
  mkdir ../unarchiver
  cd  ../unarchiver
  tar xpJf ../unarchiver-x86_64.tar.xz
}



package() {
  cd "$srcdir/gnustep-base/usr/lib/"
  install -dm 755 "$pkgdir/usr/lib/"
  cp -r "$srcdir/gnustep-base/usr/lib/" "$pkgdir/usr/lib/unarchiver/"
  rm -r "$pkgdir/usr/lib/unarchiver/GNUstep"
  
  cd "$srcdir/unarchiver/usr/bin"
  install -d "$pkgdir/usr/bin/"
  install -m755 unar lsar "$pkgdir/usr/lib/unarchiver"
  LIBNAME=``
  
  echo '#!/bin/sh' > "$pkgdir/usr/lib/unarchiver/run.sh"
  echo '[[ -z "$LD_LIBRARY_PATH" ]] && \' >> "$pkgdir/usr/lib/unarchiver/run.sh"
  echo 'export LD_LIBRARY_PATH=/usr/lib/unarchiver || \' >> "$pkgdir/usr/lib/unarchiver/run.sh"
  echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/unarchiver' >> "$pkgdir/usr/lib/unarchiver/run.sh"
  echo 'exec /usr/lib/unarchiver/`basename "$0"` "$@"'  >> "$pkgdir/usr/lib/unarchiver/run.sh"
  chmod +x "$pkgdir/usr/lib/unarchiver/run.sh"
  ln -s /usr/lib/unarchiver/run.sh "$pkgdir/usr/bin/unar"
  ln -s /usr/lib/unarchiver/run.sh "$pkgdir/usr/bin/lsar"
  
  cd "$srcdir/unarchiver/usr/share/man/man1/"
  install -d "$pkgdir/usr/share/man/man1"
  install -m644 lsar.1.gz "$pkgdir/usr/share/man/man1"/lsar.1.gz
  install -m644 unar.1.gz "$pkgdir/usr/share/man/man1"/unar.1.gz
  cd "$srcdir/unarchiver/usr/share/bash-completion/completions/"
  install -d "$pkgdir/usr/share/bash-completion/completions/"
  install -m644 unar "$pkgdir/usr/share/bash-completion/completions/unar"
  install -m644 lsar "$pkgdir/usr/share/bash-completion/completions/lsar"
}

