
pkgbase=uutils-coreutils-selinux
pkgname=(${pkgbase} coreutils-uutils-selinux)
pkgver=0.1.0
pkgrel=2
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
  export SELINUX_ENABLED=1 # maybe incorrect
  cargo build --release # include uu-hostname,... for people wants it
}

package_uutils-coreutils-selinux() {
  pkgdesc='Rust rewrite of GNU coreutils (SELinux build)'
  conflicts=(uutils-coreutils)
  cd coreutils-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y \
    PROG_PREFIX=uu- # should this conflicts with uutils-coreutils?
}

package_coreutils-uutils-selinux(){
  pkgdesc='(Really dangerous) Swap coreutils with uutils (SELinux build)'
  depends=(uutils-coreutils-selinux)
  conflicts=(coreutils)
  provides=(coreutils)
  # make install generates correct shell completions. But *sum symlinks are lacking.
  install -d "$pkgdir"/usr/bin
  # We also tests out binary at here
  _uu="coreutils-$pkgver"/target/release/coreutils
  for f in $("$_uu" --list|grep -v -E '^(kill|more|uptime|hostname)$')
  do
    "$_uu" ln -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    # Avoid broken symlinks
    "$_uu" cp -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz 2>/dev/null || :
  done
  # Is this used? https://github.com/uutils/coreutils/issues/6591
  "$_uu" install -Dm644 coreutils-$pkgver/target/release/deps/liblibstdbuf.so "$pkgdir/usr/lib/coreutils/libstdbuf.so"
}
