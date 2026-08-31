# Maintainer: Pablo Romano <promano7@hotmail.com>

pkgname=mingw-w64-fpc
pkgver=3.2.2
pkgrel=2
pkgdesc='Free Pascal cross-compilers and RTL for the win32 (i386) and win64 (x86_64) targets'
arch=('x86_64')
url='https://www.freepascal.org/'
license=('GPL-2.0-only' 'LicenseRef-modifiedLGPL')
depends=('mingw-w64-binutils')
optdepends=('fpc: fpc(1) driver, enables "fpc -Twin32" / "fpc -Twin64"'
            'mingw-w64-crt: linking against the mingw-w64 C runtime'
            'mingw-w64-headers: Win32 API headers for C interfacing')
# FPC cannot be bootstrapped from C:; a previous Pascal compiler is required.
# Instead of depending on 'fpc', the official bootstrap binary is downloaded,
# which is used to build a TEMPORARY bootstrap compiler inside $srcdir (it is
# never installed). That bootstrap compiler is then used to build the cross
# compilers.
# The cross compiler emits PE objects, so native strip/LTO/native flags cannot
# be used, and FPC's makefile system is not parallel-safe.
options=('!strip' '!debug' '!buildflags' '!lto' '!makeflags' 'staticlibs' '!emptydirs')
install="$pkgname.install"

_srcname="fpcbuild-$pkgver"
_startver=3.2.2   # Version of the downloaded bootstrap compiler

source=("https://downloads.sourceforge.net/project/freepascal/Source/$pkgver/$_srcname.tar.gz"
        "https://downloads.sourceforge.net/project/freepascal/Linux/$_startver/fpc-$_startver.x86_64-linux.tar"
        'fpc-mingw-w64.cfg')
noextract=("fpc-$_startver.x86_64-linux.tar")

sha256sums=('85ef993043bb83f999e2212f1bca766eb71f6f973d362e2290475dbaaf50161f'
            '5adac308a5534b6a76446d8311fc340747cbb7edeaacfe6b651493ff3fe31e83'
            '74d39279b6daef217f4bad9598090ce57ef92078cf612826161b6661f67421f0')

prepare() {
  # Extraction of the bootstrap compiler: the official .tar archive contains
  # binary.x86_64-linux.tar, which in turn contains base.x86_64-linux.tar.gz,
  # where lib/fpc/<ver>/ppcx64 resides. `find` is used to avoid depending on
  # the exact release layout.
  rm -rf "$srcdir/startcomp"
  install -d "$srcdir/startcomp"

  bsdtar -xf "$srcdir/fpc-$_startver.x86_64-linux.tar" -C "$srcdir/startcomp"
  bsdtar -xf "$(find "$srcdir/startcomp" -type f -name 'binary.x86_64-linux.tar' -print -quit)" \
         -C "$srcdir/startcomp"
  bsdtar -xf "$(find "$srcdir/startcomp" -type f -name 'base.x86_64-linux.tar.gz' -print -quit)" \
         -C "$srcdir/startcomp"

  chmod +x "$(find "$srcdir/startcomp" -type f -name ppcx64 -print -quit)"
}

# $1 CPU  $2 OS  $3 binutils prefix  $4 output binary name
# $5 native compiler path (temporary bootstrap compiler)
_build_cross() {
  local _cpu=$1 _os=$2 _binprefix=$3 _ppcross=$4 _pp=$5
  local _fpcsrc="$srcdir/$_srcname/fpcsrc"

  make -C "$_fpcsrc" compiler_clean CPU_TARGET="$_cpu" OS_TARGET="$_os"

  # crossall: cross compiler + RTL + remaining units for the target.
  # Only the compiler and the RTL will be installed (see package()).
  make -C "$_fpcsrc" crossall \
       PP="$_pp" FPC="$_pp" \
       CPU_TARGET="$_cpu" OS_TARGET="$_os" \
       BINUTILSPREFIX="$_binprefix" \
       CROSSOPT='-O2' \
       NOGDB=1

  # Move the binary aside: the next iteration cleans the compiler/ directory.
  install -Dm755 "$_fpcsrc/compiler/$_ppcross" "$srcdir/stage/$_ppcross"
}

build() {
  local _fpcsrc="$srcdir/$_srcname/fpcsrc"
  local _startpp _native

  _startpp="$(find "$srcdir/startcomp" -type f -name ppcx64 -print -quit)"

  # -------------------------------------------------------------------
  # 1) Temporary bootstrap: native 3.2.2 compiler built from these same
  #    sources. It exists only in $srcdir and is not packaged.
  # -------------------------------------------------------------------
  make -C "$_fpcsrc" compiler_cycle PP="$_startpp"
  install -Dm755 "$_fpcsrc/compiler/ppcx64" "$srcdir/stage/ppcx64-bootstrap"
  _native="$srcdir/stage/ppcx64-bootstrap"

  # Native RTL rebuilt with the newly created bootstrap compiler: this is the
  # RTL that the compiler will use to build the cross binaries.
  make -C "$_fpcsrc" rtl_clean rtl_all PP="$_native"

  # --------------------------------------------------------------------
  # 2) Cross compilers + target RTLs, built using the bootstrap compiler
  # --------------------------------------------------------------------
  _build_cross i386   win32 i686-w64-mingw32-   ppcross386 "$_native"
  _build_cross x86_64 win64 x86_64-w64-mingw32- ppcrossx64 "$_native"
}

check() {
  local _fpcsrc="$srcdir/$_srcname/fpcsrc"

  cd "$srcdir"
  install -d check32 check64
  cat > hello.pas <<'EOF'
program hello;
begin
  writeln('hello from a cross compiled binary');
end.
EOF

  "$srcdir/stage/ppcross386" -Twin32 -Pi386 \
      -Fu"$_fpcsrc/rtl/units/i386-win32" -FEcheck32 hello.pas
  "$srcdir/stage/ppcrossx64" -Twin64 -Px86_64 \
      -Fu"$_fpcsrc/rtl/units/x86_64-win64" -FEcheck64 hello.pas

  file check32/hello.exe | grep -q 'PE32 '
  file check64/hello.exe | grep -q 'PE32+'
}

package() {
  local _fpcsrc="$srcdir/$_srcname/fpcsrc"
  local _fpclib="usr/lib/fpc/$pkgver"
  local _lic

  # --- cross compilers-------- -----------------------------------------
  install -Dm755 "$srcdir/stage/ppcross386" "$pkgdir/$_fpclib/ppcross386"
  install -Dm755 "$srcdir/stage/ppcrossx64" "$pkgdir/$_fpclib/ppcrossx64"

  install -d "$pkgdir/usr/bin"
  ln -s "/$_fpclib/ppcross386" "$pkgdir/usr/bin/ppcross386"
  ln -s "/$_fpclib/ppcrossx64" "$pkgdir/usr/bin/ppcrossx64"

  # --- RTL (and only RTL) ----------------------------------------------
  install -d "$pkgdir/$_fpclib/units/i386-win32" \
             "$pkgdir/$_fpclib/units/x86_64-win64"
  cp -a "$_fpcsrc/rtl/units/i386-win32"   "$pkgdir/$_fpclib/units/i386-win32/rtl"
  cp -a "$_fpcsrc/rtl/units/x86_64-win64" "$pkgdir/$_fpclib/units/x86_64-win64/rtl"

  # --- configuration ---------------------------------------------------
  install -Dm644 "$srcdir/fpc-mingw-w64.cfg" "$pkgdir/etc/fpc-mingw-w64.cfg"

  # --- licenses --------------------------------------------------------
  for _lic in "$_fpcsrc/COPYING.v2" "$_fpcsrc/rtl/COPYING.FPC"; do
    if [[ -f $_lic ]]; then
      install -Dm644 "$_lic" "$pkgdir/usr/share/licenses/$pkgname/${_lic##*/}"
    fi
  done
  
  printf '\n==> %s\n\n' 'To use the cross compilers standalone, add "#INCLUDE /etc/fpc-mingw-w64.cfg" to /etc/fpc.cfg or ~/.fpc.cfg'
}
