# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-hybrid
_pkgname=coreutils
__pkgname=uutils-coreutils
pkgver=8.32_0.0.4
_pkgver=8.32
__pkgver=0.0.4
pkgrel=1
pkgdesc='GNU Coreutils / uutils-coreutils hybrid package. Uses stable uutils programs mixed with GNU counterparts if uutils counterpart is unfinished'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
_url='https://github.com/uutils/coreutils'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
conflicts=('coreutils')
provides=('coreutils')
makedepends=('rust' 'cargo' 'python-sphinx')
source=("https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$_pkgver.tar.xz"{,.sig}
        "$__pkgname-$__pkgver.tar.gz::$_url/archive/$__pkgver.tar.gz")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname-$_pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  # Build GNU coreutils without the stable uutils programs counterparts
  cd $_pkgname-$_pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="groups,hostname,kill,uptime,arch,base32,base64,basename,cat,chgrp,chmod,chown,chroot,cksum,comm,csplit,cut,dircolors,dirname,du,echo,env,expand,factor,false,fmt,fold,groups,hashsum,head,hostid,hostname,id,kill,link,ln,logname,mkdir,mkfifo,mknod,mktemp,mv,nice,nl,nohup,nproc,paste,pathk,pinky,printenv,ptx,pwd,readlink,realpath,relpath,rm,rmdir,seq,shred,shuf,sleep,stat,stdbuf,sum,sync,tac,tee,timeout,touch,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,users,wc,who,whoami,yes"
  make
}

package() {
  # Install uutils-coreutils
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
  
  # Clean conflicts
  cd $pkgdir/usr/bin
  rm groups hostname kill more uptime
}
