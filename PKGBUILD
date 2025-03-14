# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=coreutils-uutils
pkgver=0.0.30
pkgrel=2
gnu_coreutils=coreutils
rust_uutils=uutils-coreutils
gnu_coreutils_version=9.6
rust_uutils_version=0.0.30
pkgdesc='(warning: use at own risk) Cross-platform Rust rewrite of the GNU coreutils being used as actual system coreutils'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://github.com/uutils/coreutils'
_url='https://www.gnu.org/software/coreutils/'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl' 'gcc-libs' 'libkeccak' 'oniguruma')
conflicts=('coreutils' 'b3sum' 'sha3sum')
provides=('coreutils' 'b3sum' 'sha3sum')
makedepends=('rust' 'cargo' 'python-sphinx')
source=("https://ftp.gnu.org/gnu/$gnu_coreutils/$gnu_coreutils-$gnu_coreutils_version.tar.xz"
        "$rust_uutils-$rust_uutils_version.tar.gz::$url/archive/$rust_uutils_version.tar.gz")
sha256sums=('7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283'
            '732c0ac646be7cc59a51cdfdb2d0ff1a4d2501c28f900a2d447c77729fdfca22')

prepare() {
  cd $gnu_coreutils-$gnu_coreutils_version
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  # build gnu coreutils that are not implemented in the MULTICALL rust uutils 
  cd $gnu_coreutils-$gnu_coreutils_version
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="[, arch, b2sum, b3sum, base32, base64, basename, basenc, cat, chgrp, chmod, chown, chroot, cksum, comm, cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt, fold, groups, hashsum, head, hostid, hostname, id, install, join, kill, link, ln, logname, ls, md5sum, mkdir, mkfifo, mknod, mktemp, more, mv, nice, nl, nohup, nproc, numfmt, od, paste, pathchk, pinky, pr, printenv, printf, ptx, pwd, readlink, realpath, rm, rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum, sha3-256sum, sha3-384sum, sha3-512sum, sha384sum, sha3sum, sha512sum, shake128sum, shake256sum, shred, shuf, sleep, sort, split, stat, stdbuf, sum, sync, tac, tail, tee, test, timeout, touch, tr, true, truncate, tsort, tty, uname, unexpand, uniq, unlink, uptime, users, vdir, wc, who, whoami, yes"
}

package() {
  export RUSTONIG_DYNAMIC_LIBONIG=1
  cd $gnu_coreutils-$rust_uutils_version
  make \
      DESTDIR="$pkgdir" \
      PREFIX=/usr \
      MANDIR=/share/man/man1 \
      PROG_PREFIX= \
      PROFILE=release \
      MULTICALL=y \
      install
  # merge specified gnu coreutils with the rust uutils
  cd $srcdir && cd $gnu_coreutils-$gnu_coreutils_version
  make DESTDIR="$pkgdir" install
  # add libstdbuf.so
  mkdir -p $pkgdir/usr/lib/coreutils
  cd $srcdir && cd $gnu_coreutils-$rust_uutils_version/target/release/deps
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
