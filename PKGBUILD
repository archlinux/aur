
pkgname=uutils-coreutils-selinux
pkgver=0.1.0
pkgrel=37
arch=('x86_64')
license=('MIT')
url='https://uutils.github.io/'
pkgdesc='Rust rewrite of coreutils (SELinux)'
depends=(gcc-libs glibc oniguruma libselinux)
makedepends=( rust clang #libclang.so is only for SElinux
  grep make pkgconf ) # base-devel
conflicts=(uutils-coreutils)
provides=(uutils-coreutils)
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
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) -C panic=abort $RUSTFLAGS"

# Don't exclude any command
# next release supports external libstdbuf.so
package() {
  cd coreutils-$pkgver
  make install USE=selinux PROFILE=release MULTICALL=y \
    DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROG_PREFIX=uu-
}
