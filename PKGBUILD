# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>

pkgname=gnatmem
pkgver=2018
pkgrel=1
pkgdesc="Monitors dynamic allocation and deallocation activity in a Ada program."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a72'
        'PKGBUILD-binutils'
        '0001-PR23428-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch'
        '0002-PR23460-Close-resource-leaks-in-the-BFD-library-s-plugin-han.patch'
        '0003-PR23460-Add-a-testcase-for-PR-binutils-23460.patch'
        '0004-PR23486-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED-x86_64.patch'
        '0005-PR23486-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch'
        '0006-PR23428-x86-Properly-add-X86_ISA_1_NEEDED-property.patch')

sha1sums=('b615327eeea902e1286b8ea7b6af1365ed55e490'
          '9e3c1e02f190b9fe93d4db34fec8faa1cdb97d18'
          '53e8ac05df10f027a580b60dc2ac7797caf0cf05'
          '0ee308cf1fb36c03c92bba384ffb652c67d02d92'
          '6bfb2280511da2916e76f1387807a30bcc05add5'
          '910cf5ff624e2dfff60949609b9fe9fd58d6309a'
          'f4141d3e02c34ae00eddc517d69522a45672eec1'
          '76151e99d2669cb1ee795d992f587c628a43bff8')

_pkg_src_dir="$pkgname-gpl-$pkgver-src"


prepare()
{
  # We need a built binutils for the gnatmem build, so build it.
  mkdir "$srcdir/binutils"
  mv "$srcdir/0001-PR23428-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch" "$srcdir/binutils"
  mv "$srcdir/0002-PR23460-Close-resource-leaks-in-the-BFD-library-s-plugin-han.patch" "$srcdir/binutils"
  mv "$srcdir/0003-PR23460-Add-a-testcase-for-PR-binutils-23460.patch"                 "$srcdir/binutils"
  mv "$srcdir/0004-PR23486-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED-x86_64.patch"    "$srcdir/binutils"
  mv "$srcdir/0005-PR23486-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch"       "$srcdir/binutils"
  mv "$srcdir/0006-PR23428-x86-Properly-add-X86_ISA_1_NEEDED-property.patch"           "$srcdir/binutils"
  mv "$srcdir/PKGBUILD-binutils"                                                       "$srcdir/binutils"

  cd "$srcdir/binutils"
  makepkg -p "PKGBUILD-binutils" -C --skippgpcheck --noarchive 
}


build()
{
  cd "$srcdir/$_pkg_src_dir"
  ./configure --with-binutils-buildtree=$srcdir/binutils/src/binutils-build \
              --with-binutils-sources=$srcdir/binutils/src/binutils-2.31.1
  make 
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  mkdir -p "$pkgdir/usr/bin"
  cp obj/gnatmem "$pkgdir/usr/bin"

  # Clean up.
  rm -fr "$srcdir/binutils/src"
  rm -fr "$srcdir/binutils/pkg"
  rm "$srcdir/binutils/binutils-2.31.1.tar.xz"
  rm "$srcdir/binutils/binutils-2.31.1.tar.xz.sig"
}
