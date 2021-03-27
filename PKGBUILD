# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
pkgname=i8086emu-git
pkgver=0.9.2.r35.1143f09
pkgrel=2
epoch=1
pkgdesc="cross-platform emulator for the Intel 8086 microprocessor"
arch=($CARCH)
url=http://"${pkgname%-*}".sourceforge.net/
license=(GPL2)
depends=(gtk2 beep) # shared-mime-info # namcap: W: unneeded dependency on a package run when needed by hooks.
makedepends=(cmake desktop-file-utils git nasm)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")

# (A)
# source=(file:///dev/null)
# md5sums=(SKIP)

# (B)
source=("${pkgname%-*}"::git+https://git.code.sf.net/p/i8086emu/git
        http://"${pkgname%-*}".sourceforge.net/dl/i8086.pdf
        extern.patch
        "${pkgname%-*}".xml
        net.sourceforge."${pkgname%-*}"."${pkgname%emu*}"{gui,text}.desktop)
sha1sums=(SKIP
          11d730bde4fc248fb2ae37785af564e884c62b66
          a5c1091422a1f9454a6fa161107781854f387896
          d3667ed6dc769ba4d7054a5eb4736f118c02bcc2
          cb75fe18ded8ed3f86ef159d08309b62e8739a11
          48d414d51f66852c70e37d3c69d9613bb88eacac)

prepare() {

  # (A)
  # cp -a ~/i8086emu.git/ ./

  # (B)
  patch --directory="${pkgname%-*}" --input=- --strip=1 --verbose <extern.patch # --dry-run

  cd "${pkgname%-*}"/"${pkgname%-*}"/src

  # https://unix.stackexchange.com/a/450857
  # Insert text blob w/ sed in case any whitespace get messed up
  # diff -u {x,y}.c | sed -i -e '/^INSERT_TEXT_BLOB/{r /dev/stdin' -e 'd;}' ~/.cache/yay/i8086emu-git/PKGBUILD

  # echo
  # { for h in i8086gui.h i8086gui_paint.h i8086gui_emufuncs.h i8086gui_util.h; do
  #   echo "patch --verbose $h <<\"EOP\""
  #   diff -u "$h" ~/.cache/yay/i8086emu-git/src/i8086emu/i8086emu/src
  #   echo "EOP"
  #   echo
  # done } | sed -i -e '/^SED_BLOB/{r /dev/stdin' -e 'd;}' ~/.cache/yay/i8086emu-git/PKGBUILD

}

pkgver() {
  cd "${pkgname%-*}"
  # cutting off 'v' prefix that presents in the git tag
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {

  cd "${pkgname%-*}/${pkgname%-*}"
  export CFLAGS="-fPIC $CFLAGS"

  # i8086text
  # ./configure --help | less; echo; pwd; echo; return 1
  # i8086emu-git W: ELF file ('usr/bin/i8086text') lacks FULL RELRO, check LDFLAGS.
  # i8086emu-git W: ELF file ('usr/lib/i8086emu/i8086beep.so') lacks FULL RELRO, check LDFLAGS.
  # i8086emu-git W: ELF file ('usr/lib/i8086emu/i8086pic.so') lacks FULL RELRO, check LDFLAGS.
  # i8086emu-git W: ELF file ('usr/lib/i8086emu/i8086pit.so') lacks FULL RELRO, check LDFLAGS.
 ./configure \
    \
    --prefix=/usr \
    --exec-prefix=/usr \
    \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/"${pkgname%-*}" \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --infodir=/usr/share/doc \
    --mandir=/usr/share/man \
    usegtk=1
  # gcc -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -shared -fPIC devices/i8086pic.c i8086error.o i8086messages.o i8086util.o -o devices/i8086pic.so
  # /usr/bin/ld: i8086messages.o: warning: relocation against `msgFuncs' in read-only section `.text'
  # /usr/bin/ld: i8086messages.o: relocation R_X86_64_PC32 against symbol `criticalSection' can not be used when making a shared object; recompile with -fPIC
  # make CFLAGS="-fPIC $CFLAGS"
  make

  # i8086gui
  cmake -B cmake_build_gui -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_VERBOSE_MAKEFILE=ON
  # ccmake -B cmake_build_gui -S .; echo; pwd; echo; return 1
  make -C cmake_build_gui\

}

# makepkg --noextract --holdver --repackage
package() {

  cd "${pkgname%-*}/${pkgname%-*}"

  # i8086text
  make DESTDIR="$pkgdir" install
  rm -v \
    "$pkgdir/usr/bin/i8086text" \
    "$pkgdir/usr/lib/i8086emu/i8086beep.so" \
    "$pkgdir/usr/lib/i8086emu/i8086pic.so" \
    "$pkgdir/usr/lib/i8086emu/i8086pit.so"
  rmdir -v "$pkgdir/usr/lib/i8086emu"

  # only stub dirs remain
  [ -z "$(ls -A "$pkgdir/usr/bin")" ]
  [ -z "$(ls -A "$pkgdir/usr/lib")" ]

  # i8086gui
  install -vDm755 cmake_build_gui/bin/* "$pkgdir/usr/bin/"
  install -vDm755 cmake_build_gui/lib/*.so "$pkgdir/usr/lib/"
  install -vDm644 cmake_build_gui/lib/*.a "$pkgdir/usr/lib/"

  cd "$srcdir"
  [ -z "$(desktop-file-validate *.desktop 2>&1)" ]
  install -vdm755 "$pkgdir/usr/share/applications/"; install -vDm644 *.desktop "$_/"
  install -vDm644 {,"$pkgdir/usr/share/mime/packages/"}"${pkgname%-*}".xml

}
