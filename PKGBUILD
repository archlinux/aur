# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Contributor: André Silva <emulatorman@hyperbola.info>
# Contributor: Márcio Silva <coadde@hyperbola.info>
# Maintainer: Luke R. <g4jc@openmailbox.org>
# Maintainer: David P. <megver83@parabola.nu>

_target=xtensa-elf
pkgname=$_target-binutils
pkgver=2.34
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Xtensa target'
arch=('x86_64' 'i686' 'armv7h')
url="https://www.gnu.org/software/binutils/"
license=('GPL')
depends=('zlib')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha512sums=('f47e7304e102c7bbc97958a08093e27796b9051d1567ce4fbb723d39ef3e29efa325ee14a1bdcc462a925a7f9bbbc9aee28294c6dc23850f371030f3835a8067'
            'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
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
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
