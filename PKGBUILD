# Maintainer: ebt <ebt@localhost>
#
# Prebuilt (repackaged) Peregrine Fil-C. Upstream ships a self-contained
# toolchain tarball, so this is a binary repackage: no compilation, ~610 MB
# installed. Everything lives under /opt/perefil with a stable, unversioned
# path, because setup.sh bakes the absolute path into pizfix/bin/sarcasm.
#
# Update with:
#   ./update.sh [--build] [--push] [--stable]
# Publish with:
#   ./publish.sh

pkgname=perefil-bin
pkgver=0.687
pkgrel=1
pkgdesc='Peregrine Fil-C: memory-safe C/C++ compiler and runtime (prebuilt, emits APEs)'
arch=('x86_64')
url='https://fil-c.org/'
license=('Apache-2.0' 'BSD-2-Clause' 'ISC')
depends=('linux-api-headers')
optdepends=(
  'aarch64-linux-gnu-binutils: link the default fat-APE output (else pass --filc-no-ape)'
  'qemu-user: run the ARM64 half of an APE (qemu-aarch64)'
  'aarch64-linux-gnu-gdb: debug the ARM64 half of an APE'
  'wine: run the Windows side of an APE through the binfmt_misc DOSWin handler'
)
# the shipped binaries are static and deliberately not stripped
options=('!strip' '!debug' '!lto' '!staticlibs')
install=$pkgname.install

_ghrepo=pizlonator/fil-c
_dist=perefil-$pkgver-linux-x86_64

source_x86_64=("https://github.com/$_ghrepo/releases/download/v$pkgver/$_dist.tar.xz")
sha256sums_x86_64=('34fde85316fc9fadb2e07091bb04578e80f65f3c617ebb23b1738c0369aa5247')

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname"

  cp -a "$srcdir/$_dist" "$pkgdir/opt/perefil"

  # setup.sh turns the relocatable tree into an installation:
  #   pizfix/bin/sarcasm shebang        -> the interpreter path
  #   pizfix/os-include/{linux,asm,...} -> host kernel headers
  # It has to run inside $pkgdir, but $pkgdir is a build-time path, so the
  # shebang it writes is rewritten to the final /opt/perefil path below.
  ( cd "$pkgdir/opt/perefil" && sh setup.sh >/dev/null )
  sed -i '1s|.*|#!/opt/perefil/pizfix/bin/minilute|' \
    "$pkgdir/opt/perefil/pizfix/bin/sarcasm"

  ln -s /opt/perefil/build/bin/clang   "$pkgdir/usr/bin/filc"
  ln -s /opt/perefil/build/bin/clang++ "$pkgdir/usr/bin/filc++"
  ln -s /opt/perefil/build/bin/filcc   "$pkgdir/usr/bin/filcc"
  ln -s /opt/perefil/build/bin/fil++   "$pkgdir/usr/bin/fil++"
  ln -s /opt/perefil/build/bin/filcpp  "$pkgdir/usr/bin/filcpp"

  install -m644 "$pkgdir"/opt/perefil/*LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"

  cat > "$pkgdir/usr/share/doc/$pkgname/README.arch" <<EOF
Peregrine Fil-C $pkgver (Arch package $pkgname)
====================================================

Install root : /opt/perefil            (unversioned on purpose: setup.sh bakes it)
Entry points : /usr/bin/{filc,filc++,filcc,fil++,filcpp}
                -> /opt/perefil/build/bin/{clang,clang++,filcc,fil++,filcpp}

Quick start
-----------
    filc   --filc-no-ape -o hello hello.c -O2 -g
    ./hello
    filc++ --filc-no-ape -o app app.cpp -std=c++20

Default output is a fat APE (one file for Linux/macOS/Windows, x86_64+ARM64,
plus two side files: hello.com.dbg and hello.aarch64.elf). That needs
aarch64-linux-gnu-binutils. Without it, always pass --filc-no-ape
(plain x86_64 static ELF) or --filc-ape (single-arch APE).

What it buys you
----------------
* use-after-free and out-of-bounds become a panic:
      filc safety error: cannot access pointer to free object.
      filc panic: thwarted a futile attempt to violate memory safety.
  exit status 133 (native ELF) or 5 (APE).
* memory is reclaimed by FUGC, a concurrent garbage collector, so a missing
  free() is not a bug: 200000 x 1 KiB allocations with no free at all keep RSS
  around 16 MB.

Gotchas
-------
* clang 20.1.8 base: C17 / C++20. -std=c++23 and -std=c++26 do not work.
* If /proc/sys/fs/binfmt_misc has a DOSWin (PE) handler (wine-binfmt), running
  an APE executes the Windows/x86_64 side through Wine. Run the side file
  (./hello.com.dbg) or use --filc-no-ape to stay native.
* pizfix/os-include links point at /usr/include/{linux,asm,asm-generic}, i.e.
  at linux-api-headers; they are created at package build time.
* Expect a real slowdown vs native clang (author: 1.5-5x, older docs ~4x) and
  about 2x memory for pointer-bearing structures.
* Licenses: compiler Apache-2.0 (LLVM exception), libpas BSD-2-Clause,
  Cosmopolitan ISC. Texts in /usr/share/licenses/$pkgname/.
EOF
}
