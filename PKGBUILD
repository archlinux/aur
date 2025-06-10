
pkgbase=uutils-coreutils-selinux
pkgname=(${pkgbase} coreutils-uutils-selinux)
pkgver=0.1.0
pkgrel=35
arch=('x86_64')
license=('MIT')
url='https://uutils.github.io/'
depends=(gcc-libs glibc oniguruma libselinux)
makedepends=( rust clang #libclang.so is only for SElinux
  make pkgconf ) # base-devel
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto' 'zipman')

prepare() {
  cd coreutils-$pkgver
  sed -i 's/yes/yes stty/' GNUmakefile # remove this at next release
  # cargo fetch DL larger crates
}

export SELINUX_ENABLED=1 RUSTONIG_DYNAMIC_LIBONIG=1
# release-fast profile has panic=abort
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) -C panic=abort $RUSTFLAGS --remap-path-prefix=${srcdir}="

# include every command
package_uutils-coreutils-selinux() {
  pkgdesc='Rust rewrite of GNU coreutils (SELinux)'
  conflicts=(uutils-coreutils)
  cd coreutils-$pkgver
  make install USE=selinux PROFILE=release MULTICALL=y \
    DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROG_PREFIX=uu- 
  # for $PATH exporting
  #_uu=./target/release/coreutils
  #install -d "$pkgdir"/usr/lib/uu-coreutils
  #for f in $("$_uu" --list)
  #  do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/lib/uu-coreutils/"$f"
  #done
}

# Don't build twice
package_coreutils-uutils-selinux(){
  pkgdesc='(Really dangerous) Swap coreutils with uutils (SELinux)'
  conflicts=(coreutils b3sum sha3sum)
  provides=(coreutils{,-selinux} sha3sum)
  depends=(uutils-coreutils-selinux)

  cd coreutils-$pkgver
  _uu=./target/release/coreutils
  install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  for f in $("$_uu" --list); do
    ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    ln -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
    # Don't conflict with Extra/bash-completion: https://github.com/scop/bash-completion/discussions/1386
    echo -e "#compdef ${f}=uu-${f}\n_${f}" > "$pkgdir"/usr/share/zsh/site-functions/_$f
    # Don't want to sed *.fish. Is aliasing possible for size ?
  done
  rm "$pkgdir"/usr/bin/{kill,more,uptime,hostname}
  # Dynamic libstdbuf may supported: https://github.com/uutils/coreutils/issues/6591
  install -Dm644 target/release/deps/liblibstdbuf.so "$pkgdir/usr/lib/coreutils/libstdbuf.so"
}
