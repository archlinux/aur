# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=coreutils-uutils
pkgver=0.1.0
pkgrel=3
pkgdesc='(warning: use at own risk) Cross-platform Rust rewrite of the GNU
coreutils installed as system core utilities. This PKGBUID does NOT build
chcon and runcon'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://github.com/uutils/coreutils'
conflicts=(
  coreutils
  b3sum
  sha3sum
)
provides=(
  coreutils
  b3sum
  sha3sum
)
depends=(
  gcc-libs
  glibc
  oniguruma
)
makedepends=(
  cargo
  clang
  python-sphinx
  rust
)
source=("uutils-coreutils-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
         disable_selinux.patch
         build-stty.patch)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8'
            '302614165d99f04600627222ddad0444a0144fcad6a1ff59ad43fb0b3162060e'
            '0bd635cc349cfe133ddad0b1d05256c023b46f4a30f81aee123100119762df8e')

prepare() {
  cd ${pkgname%-uutils}-${pkgver}
  patch -Np1 -i $srcdir/disable_selinux.patch
  patch -Np1 -i $srcdir/build-stty.patch

}

package() {
  cd ${pkgname%-uutils}-${pkgver}
  export RUSTONIG_DYNAMIC_LIBONIG=1
  make install \
      DESTDIR="$pkgdir" \
      PREFIX=/usr \
      MANDIR=/share/man/man1 \
      PROG_PREFIX= \
      PROFILE=release \
      MULTICALL=y
  # add libstdbuf.so
  mkdir -p $pkgdir/usr/lib/coreutils
  cd $srcdir && cd ${pkgname%-uutils}-${pkgver}/target/release/deps
  mv liblibstdbuf.so $pkgdir/usr/lib/coreutils/libstdbuf.so
  # clean conflicts (archlinux ships these in other apps)
  cd $pkgdir/usr/bin
  rm hostname kill more uptime
  rm $pkgdir/usr/share/bash-completion/completions/*
  rm $pkgdir/usr/share/man/man1/{hostname.1,kill.1,more.1,uptime.1}
  # symlink missing binaries
  if [ -f "coreutils" ]; then
    local binaries=(
      "b2sum" "b3sum" "md5sum" "sha1sum" "sha224sum" "sha256sum" "sha3-224sum"
      "sha3-256sum" "sha3-384sum" "sha3-512sum" "sha384sum" "sha3sum"
      "sha512sum" "shake128sum" "shake256sum"
    )
    for bin in "${binaries[@]}"; do
      ln -s coreutils "$bin" || echo "warning: failed to create symlink for $bin"
    done
  else
    echo "coreutils binary not found, skipping symlink creation."
  fi

  # create dummy shell scripts for chcon and runcon
  install -m 755 <(echo "#!/bin/sh
echo \"warning: chcon is no longer built with the coreutils-uutils package\"
exit 1") $pkgdir/usr/bin/chcon
  install -m 755 <(echo "#!/bin/sh
echo \"warning: runcon is no longer built with the coreutils-uutils package\"
exit 1") $pkgdir/usr/bin/runcon
}

# vim: ts=2 sw=2 et:
