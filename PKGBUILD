# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-hybrid
_pkgname=coreutils
__pkgname=uutils-coreutils
pkgver=9.1_0.0.20
_pkgver=9.1
__pkgver=0.0.20
pkgrel=2
pkgdesc='GNU coreutils / uutils-coreutils hybrid package. Uses stable uutils programs mixed with GNU counterparts if uutils counterpart is unfinished / buggy'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://www.gnu.org/software/coreutils/'
_url='https://github.com/uutils/coreutils'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
conflicts=('coreutils')
provides=('coreutils')
makedepends=('rust' 'cargo')
source=("https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$_pkgver.tar.xz"
        "$__pkgname-$__pkgver.tar.gz::$_url/archive/$__pkgver.tar.gz")
sha512sums=('a6ee2c549140b189e8c1b35e119d4289ec27244ec0ed9da0ac55202f365a7e33778b1dc7c4e64d1669599ff81a8297fe4f5adbcc8a3a2f75c919a43cd4b9bdfa'
            'd71822416904e2a2a26a192b39601a8573a71a3cb2c6260d4253c664daf78d78edb2af847a711354e8bdb279a0ee8f43bf2061592544905edc68821e72deff17')

prepare() {
  cd $_pkgname-$_pkgver
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
  # Build GNU coreutils without the stable uutils programs counterparts leaving out: stat, touch, realpath (genfstab broken), ln (no -s option)
  cd $_pkgname-$_pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="groups,hostname,kill,uptime,arch,base32,base64,basename,cat,chgrp,chmod,chown,chroot,cksum,comm,csplit,cut,dircolors,dirname,du,env,echo,expand,factor,false,fmt,fold,groups,head,hostid,hostname,id,kill,link,logname,mkdir,mkfifo,mknod,mktemp,mv,nice,nl,nohup,nproc,paste,pathk,pinky,printenv,ptx,pwd,readlink,relpath,rm,rmdir,seq,shred,shuf,sleep,stdbuf,sum,sync,tac,tee,timeout,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,users,who,wc,whoami,yes"
}

package() {
  # Install uutils-coreutils, skip the buggy parts
  cd $_pkgname-$__pkgver
  make \
      DESTDIR="$pkgdir" \
      PREFIX=/usr \
      MANDIR=/share/man/man1 \
      PROG_PREFIX= \
      install

  # Install GNU coreutils over the uutils-coreutils
  cd $srcdir && cd $_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
  
  # Clean conflicts, Arch ships these in other apps
  cd $pkgdir/usr/bin
  rm groups hostname kill more uptime

  rm $pkgdir/usr/share/bash-completion/completions/*
  rm $pkgdir/usr/share/man/man1/{groups.1,hostname.1,kill.1,more.1,uptime.1}
}
