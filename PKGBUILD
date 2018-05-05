# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Contributor: André Silva <emulatorman@hyperbola.info>
# Contributor: Márcio Silva <coadde@hyperbola.info>
# Maintainer: Luke R. <g4jc@openmailbox.org>
# Maintainer: David P. <megver83@parabola.nu>

_target=xtensa-elf
pkgname=$_target-binutils
pkgver=2.30
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the Xtensa target"
arch=('x86_64' 'i686' 'armv7h')
url="https://www.gnu.org/software/binutils/"
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2"{,.sig}
	'https://github.com/qca/open-ath9k-htc-firmware/raw/master/local/patches/binutils.patch')
sha512sums=('c3ce91aa20f058ec589bf18c722bf651331b394db6378900cc813cc0eea3a331a96584d5ae090630b627369510397dccc9edfcd43d4aeefc99579f277a05c72c'
            'SKIP'
            'e10ed358794d7aa32ac25087afd804dc4c3028c4664d7608eb86147f041561d16209afa6501bc8a19e02386674011d567640175f6b8bf89275c243dc3b3a9980')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
  patch -p1 -i ../binutils.patch
}

build() {
  cd binutils-$pkgver

  if [ "${CARCH}" != "i686" ]; then
    # enabling gold linker at i686 makes the install fail
    enable_gold='--enable-gold'
  fi

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              $enable_gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
