# Maintainer: Alexander Koppe <koppe@posteo.de>
pkgname=llvm-mos-bin
pkgver=23.0.0git.8be05461
pkgrel=1
pkgdesc="LLVM/Clang fork targeting MOS 6502-family CPUs (prebuilt upstream release binaries)"
arch=('x86_64')
url="https://llvm-mos.org/wiki/Welcome"
license=('Apache-2.0 WITH LLVM-exception')
depends=('glibc' 'gcc-libs')
provides=('llvm-mos')
conflicts=('llvm-mos' 'llvm-mos-git')
# Prebuilt binaries; do not re-strip or relink them.
options=('!strip' '!debug')
# NOTE: upstream publishes a ROLLING release — the tag
# "llvm-mos-linux-main" stays, but the asset behind it is replaced on
# every CI build. A fixed checksum is therefore impossible (SKIP), and
# pacman cannot detect updates by itself: to update, rebuild the
# package (the download then fetches the new state and pkgver() reads
# the new version from the binary).
source=("llvm-mos-linux-main.tar.xz::https://github.com/llvm-mos/llvm-mos/releases/download/llvm-mos-linux-main/llvm-mos-linux-main.tar.xz"
        "LICENSE.TXT::https://raw.githubusercontent.com/llvm-mos/llvm-mos/main/llvm/LICENSE.TXT")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir"
  # "clang version 23.0.0git (https://github.com/llvm-mos/llvm-mos <sha>)"
  ./llvm-mos/bin/clang --version | awk 'NR==1 {
    ver=$3; sha=substr($NF, 1, 8);
    printf "%s.%s", ver, sha
  }'
}

package() {
  install -d "$pkgdir/opt"
  cp -a "$srcdir/llvm-mos" "$pkgdir/opt/llvm-mos"
  install -Dm644 "$srcdir/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
