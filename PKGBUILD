# Maintainer: Alonso Rodriguez <alonsorodi20 (at) gmail.com>

pkgname=bcc86
pkgver=0.16.21
pkgrel=1
pkgdesc="Bruce's C Compiler. Extension for bin86 AUR package."
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/lkundrak/dev86"
license=('GPL')
depends=('glibc')
optdepends=('bin86: for assembling, linking, and other remaining features')
source=("git+${url}.git#branch=master"
        "http://deb.debian.org/debian/pool/main/l/linux86/linux86_${pkgver}-2.debian.tar.xz")
md5sums=('SKIP'
         'fef49f3d300265670f836bd31366af0a')

prepare(){
  cd "${srcdir}/dev86"

  # Apply Debian patches
  for patch in ${srcdir}/debian/patches/*.patch; do
    patch -p1 < "$patch" || echo "Failed to apply ${patch}. This is probably normal and won't affect bcc. Please report any errors."
  done

  # Generate version.h without running the global Makefile
  cd bcc
  IFS='.' read -r VER_MAJ VER_MIN VER_PAT <<< "$pkgver"
  echo "#define VERSION \"$pkgver\"" > version.h
  echo "#define VER_MAJ $VER_MAJ" >> version.h
  echo "#define VER_MIN $VER_MIN" >> version.h
  echo "#define VER_PAT $VER_PAT" >> version.h
  
  # And export man page
  gzip -c "${srcdir}/dev86/man/bcc.1" > "${srcdir}/dev86/man/bcc.1.gz"
}

build() {
  cd "${srcdir}/dev86/bcc"
  make CFLAGS=-std=gnu99
}

package() {
  cd "${srcdir}/dev86/bcc"
  
  # Install binaries
  make PREFIX="${pkgdir}"/usr install

  # Copy man
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}/dev86/man/bcc.1" "${pkgdir}/usr/share/man/man1/bcc.1"
}
