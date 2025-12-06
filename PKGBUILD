# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=i686-elf-pcc-git
pkgver=20251115
pkgrel=2
pkgdesc="A Portable C Compiler."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/PortableCC/"
license=('custom')
makedepends=('bison' 'flex' 'git')
options=('!lto')
depends=('i686-elf-pcc-libs' 'i686-elf-binutils')
provides=(i686-elf-pcc)
conflicts=(i686-elf-pcc)
source=(
  $pkgname::git+https://github.com/PortableCC/pcc
  license
)
md5sums=('SKIP'
         '51f6cc02b26af53f26cfe87494ca5c87')
pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --date=format:"%Y%m%d" --format="%ad"
}

build() {
  cd "$srcdir/$pkgname"

  export CFLAGS+=" -fcommon -Wno-int-conversion "

  ./configure \
	--with-assembler=i686-elf-as \
	--with-linker=i686-elf-ld \
	--host=i386-unknown-linux \
	--prefix=/usr --libexecdir=/usr/lib/i686-elf-pcc || return 1

  make CC=gcc || return 1
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR=$pkgdir install || return 1

  mv "$pkgdir/usr/bin/pcc" "$pkgdir/usr/bin/i686-elf-pcc"
  mv "$pkgdir/usr/bin/p++" "$pkgdir/usr/bin/i686-elf-p++"
  mv "$pkgdir/usr/bin/pcpp" "$pkgdir/usr/bin/i686-elf-pcpp"

  rm -rf "$pkgdir/usr/share"

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
