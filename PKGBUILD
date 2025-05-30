
pkgbase=uutils-coreutils-selinux
pkgname=(${pkgbase} coreutils-uutils-selinux)
pkgver=0.1.0
pkgrel=3
arch=('x86_64')
license=('MIT')
url='https://uutils.github.io/'
depends=(gcc-libs glibc oniguruma libselinux)
makedepends=( clang rust python-sphinx )
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS?

prepare() {
  cd coreutils-$pkgver
  sed -i 's/yes/yes stty/' GNUmakefile # remove this at next release
}

build(){
  cd coreutils-$pkgver
  export RUSTONIG_DYNAMIC_LIBONIG=1
  export SELINUX_ENABLED=1
  cargo build --release --features feat_selinux # include hostname, etc... for people wants it
}

package_uutils-coreutils-selinux() {
  pkgdesc='Rust rewrite of GNU coreutils (SELinux build)'
  conflicts=(uutils-coreutils)
  cd coreutils-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y PROG_PREFIX=uu-
}

package_coreutils-uutils-selinux(){
  pkgdesc='(Really dangerous) Swap coreutils with uutils (SELinux build)'
  conflicts=(coreutils b3sum sha3sum)
  provides=(coreutils sha3sum)
  cd coreutils-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y # get correct man pages
  rm -r "$pkgdir"/usr/share/bash-completion # part of Extra/bash-completion
  # Don't duplicate, add missing *sum symlinks
  depends=(uutils-coreutils-selinux)
  _uu="$pkgdir"/usr/bin/coreutils
  for f in $("$_uu" --list|grep -v -E '^(kill|more|uptime|hostname)$')
  do
    ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
  done
  rm "${_uu}"
  # Is this used? https://github.com/uutils/coreutils/issues/6591
  install -Dm644 target/release/deps/liblibstdbuf.so "$pkgdir/usr/lib/coreutils/libstdbuf.so"
}
