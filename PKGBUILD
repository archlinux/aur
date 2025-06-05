
pkgbase=uutils-coreutils-selinux
pkgname=(${pkgbase} coreutils-uutils-selinux)
pkgver=0.1.0
pkgrel=34
arch=('x86_64')
license=('MIT')
url='https://uutils.github.io/'
depends=(gcc-libs glibc oniguruma libselinux)
makedepends=( rust clang ) #libclang.so is only for SElinux
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto')

prepare() {
  cd coreutils-$pkgver
  sed -i 's/yes/yes stty/' GNUmakefile # remove this at next release
#  cargo fetch --locked --target "${CARCH}"-unknown-linux-gnu DL larger crates
}

export SELINUX_ENABLED=1 RUSTONIG_DYNAMIC_LIBONIG=1
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) -C panic=abort $RUSTFLAGS -C --remap-path-prefix=${srcdir}="

build(){ 
  cd coreutils-$pkgver
  # build every uu-cmd for people wants it
  make USE=selinux PROFILE=release MULTICALL=y
}

package_uutils-coreutils-selinux() {
  pkgdesc='Rust rewrite of GNU coreutils (SELinux)'
  conflicts=(uutils-coreutils)
  cd coreutils-$pkgver
  make install USE=selinux PROFILE=release MULTICALL=y \
    DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROG_PREFIX=uu- 
  # for $PATH exporting
  _uu="$pkgdir"/usr/bin/uu-coreutils
  install -d "$pkgdir"/usr/lib/uu-coreutils
  for f in $("$_uu" --list)
    do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/lib/uu-coreutils/"$f"
  done
}

package_coreutils-uutils-selinux(){
  pkgdesc='(Really dangerous) Swap coreutils with uutils (SELinux)'
  conflicts=(coreutils b3sum sha3sum)
  provides=(coreutils{,-selinux} sha3sum)
  cd coreutils-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y # get correct man pages
  rm -r "$pkgdir"/usr/share/bash-completion # part of Extra/bash-completion
  # Don't duplicate, dislike "coreutils" name, add missing *sum symlinks
  depends=(uutils-coreutils-selinux)
  _uu="$pkgdir"/usr/bin/coreutils
  for f in $("$_uu" --list)
    do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
  done
  rm "$pkgdir"/usr/bin/{coreutils,kill,more,uptime,hostname}
  # Is this used? https://github.com/uutils/coreutils/issues/6591
  install -Dm644 target/release/deps/liblibstdbuf.so "$pkgdir/usr/lib/coreutils/libstdbuf.so"
}
