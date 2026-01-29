# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>
pkgname=m68k-amigaos-gcc
pkgver=15.2.0
pkgrel=1
pkgdesc="GCC ${pkgver} cross-compiler toolchain for Amiga m68k-amigaos with full C/C++ runtime"
arch=('x86_64')
url="https://github.com/BlitterStudio/m68k-amigaos-gcc"
license=('GPL-2.0-or-later')
depends=('gmp' 'mpfr' 'libmpc' 'zlib' 'readline')
makedepends=(
  'autoconf'
  'automake'
  'bison'
  'flex'
  'gettext'
  'git'
  'gperf'
  'lha'
  'ncurses'
  'python'
  'rsync'
  'texinfo'
  'wget'
)
provides=('m68k-amigaos-gcc' 'm68k-amigaos-binutils')
conflicts=('m68k-amigaos-gcc')
options=('!strip' '!buildflags' 'staticlibs')
source=("amiga-gcc::git+https://github.com/BlitterStudio/m68k-amigaos-gcc.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/amiga-gcc"

  # Switch GCC to the amiga15.2 branch before cloning sub-repos
  cp default-repos .repos
  sed -i 's/^\(gcc\s\+\S\+\s\+\).*/\1amiga15.2/' .repos

  # Clone all sub-repos and download archives (NDK, etc.)
  make update
}

build() {
  cd "$srcdir/amiga-gcc"
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  # GCC 14+ promotes several warnings to hard errors that break old Amiga C
  # library code. Relax these for the target libraries.
  local _permissive="-Wno-error=incompatible-pointer-types \
    -Wno-error=implicit-function-declaration \
    -Wno-error=int-conversion"

  # Build everything except gdb (fails against Python 3.13+)
  make gcc binutils gprof fd2sfd fd2pragma ira sfdc vasm \
       libnix ixemul libgcc clib2 libdebug libpthread ndk ndk13 \
       PREFIX="$srcdir/prefix" \
       CFLAGS_FOR_TARGET="-O2 -fomit-frame-pointer $_permissive" \
       -j$(nproc)
}

package() {
  # Copy the built toolchain to the package directory
  mkdir -p "$pkgdir/opt/amiga"
  cp -a "$srcdir/prefix/." "$pkgdir/opt/amiga/"

  # Fix build-time prefix in linker scripts and text files
  find "$pkgdir/opt/amiga" -type f \( -name '*.x' -o -name '*.xbn' -o -name '*.xe' \
       -o -name '*.xn' -o -name '*.sfd' -o -name '*.sh' -o -name '*.conf' \
       -o -name '*.la' -o -name 'COPIED' -o -name 'configargs.h' \
       -o -name 'gtype.state' -o -name '*.py' -o -name 'mkheaders' \
       -o -name 'gg-fix-includes' -o -name 'tm-preds.h' \) \
       -exec sed -i "s|$srcdir/prefix|/opt/amiga|g" {} +

  # Install profile.d script to add toolchain to PATH
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/m68k-amigaos-toolchain.sh" <<'EOF'
# Added by m68k-amigaos-toolchain
export PATH="/opt/amiga/bin:$PATH"
EOF
}
