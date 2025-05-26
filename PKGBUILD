# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=coreutils-uutils
_gnuver=9.7
_uuver=0.1.0
pkgver=${_uuver}
pkgrel=1
pkgdesc='(warning: use at own risk) Cross-platform Rust rewrite of the GNU coreutils being used as actual system coreutils'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://github.com/uutils/coreutils'
_url='https://www.gnu.org/software/coreutils/'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl' 'gcc-libs' 'libkeccak' 'oniguruma')
conflicts=('coreutils' 'b3sum' 'sha3sum')
provides=('coreutils' 'b3sum' 'sha3sum')
makedepends=('rust' 'cargo' 'python-sphinx')
source=("https://ftp.gnu.org/gnu/coreutils/coreutils-$_gnuver.tar.xz"
        "uutils-coreutils-$_uuver.tar.gz::$url/archive/$_uuver.tar.gz"
         disable_selinux.patch)
sha256sums=('e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf'
            '55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8'
            '302614165d99f04600627222ddad0444a0144fcad6a1ff59ad43fb0b3162060e')

prepare() {
  cd coreutils-$_uuver
  # the following is derived from the latest uutils-coreutils changes from Tobias Powalowski:
    # disable selinux in Makefile, upstream seems broken in parameter parsing
    # SELINUX_ENABLE=0 should not enable SELINUX but fails
  patch -Np1 -i ../../disable_selinux.patch
}

build() {
  # build gnu coreutils that are not implemented in the MULTICALL rust uutils 
  cd coreutils-$_gnuver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="[, arch, b2sum, b3sum, base32, base64, basename, basenc, cat, chgrp, chmod, chown, chroot, cksum, comm, cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt, fold, groups, hashsum, head, hostid, hostname, id, install, join, kill, link, ln, logname, ls, md5sum, mkdir, mkfifo, mknod, mktemp, more, mv, nice, nl, nohup, nproc, numfmt, od, paste, pathchk, pinky, pr, printenv, printf, ptx, pwd, readlink, realpath, rm, rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum, sha3-256sum, sha3-384sum, sha3-512sum, sha384sum, sha3sum, sha512sum, shake128sum, shake256sum, shred, shuf, sleep, sort, split, stat, stdbuf, sum, sync, tac, tail, tee, test, timeout, touch, tr, true, truncate, tsort, tty, uname, unexpand, uniq, unlink, uptime, users, vdir, wc, who, whoami, yes"
}

package() {
  export RUSTONIG_DYNAMIC_LIBONIG=1
  cd coreutils-$_uuver
  make \
      DESTDIR="$pkgdir" \
      PREFIX=/usr \
      MANDIR=/share/man/man1 \
      PROG_PREFIX= \
      PROFILE=release \
      MULTICALL=y \
      install
  # merge specified gnu coreutils with the rust uutils
  cd $srcdir && cd coreutils-$_gnuver
  make DESTDIR="$pkgdir" install
  # add libstdbuf.so
  mkdir -p $pkgdir/usr/lib/coreutils
  cd $srcdir && cd coreutils-$_uuver/target/release/deps
  mv liblibstdbuf.so $pkgdir/usr/lib/coreutils/libstdbuf.so
  # clean conflicts, arch ships these in other apps
  cd $pkgdir/usr/bin
  rm groups hostname install kill more uptime
  # symlink missing binaries
  if [ -f "coreutils" ]; then
    local binaries=(
      "b2sum" "b3sum" "install" "md5sum" "sha1sum" "sha224sum"
      "sha256sum" "sha3-224sum" "sha3-256sum" "sha3-384sum" "sha3-512sum"
      "sha384sum" "sha3sum" "sha512sum" "shake128sum" "shake256sum"
    )
    for bin in "${binaries[@]}"; do
      ln -s coreutils "$bin" || echo "warning: failed to create symlink for $bin"
    done
  else
    echo "coreutils binary not found, skipping symlink creation."
  fi
  # additional cleanup
  rm $pkgdir/usr/share/bash-completion/completions/*
  rm $pkgdir/usr/share/man/man1/{groups.1,hostname.1,install.1,kill.1,more.1,uptime.1}
}

# vim: ts=2 sw=2 et:
