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
pkgrel=5
pkgdesc='GNU coreutils / uutils-coreutils hybrid package. Uses stable uutils programs mixed with GNU counterparts if uutils counterpart is unfinished / buggy'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://www.gnu.org/software/coreutils/'
_url='https://github.com/uutils/coreutils'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
conflicts=('coreutils')
provides=('coreutils')
makedepends=('rust' 'cargo' 'python-sphinx')
source=("https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$_pkgver.tar.xz"{,.sig}
        "$__pkgname-$__pkgver.tar.gz::$_url/archive/$__pkgver.tar.gz")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha512sums=('1c8f3584efd61b4b02e7ac5db8e103b63cfb2063432caaf1e64cb2dcc56d8c657d1133bbf10bd41468d6a1f31142e6caa81d16ae68fa3e6e84075c253613a145'
            'SKIP'
            '5d5719a0362a20c3a5ee85683c436a1bfcf5b8bf922ebe60c58f620b93d3bdf67c658a987cb8281b160442bd98cb7b4b00bacd9e3814d1b0ae3b6dd1cd43ec83')

build() {
  # Build GNU coreutils without the stable uutils programs counterparts leaving out: stat, touch
  cd $_pkgname-$_pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="groups,hostname,kill,uptime,arch,base32,base64,basename,cat,chgrp,chmod,chown,chroot,cksum,comm,csplit,cut,dircolors,dirname,du,echo,env,expand,factor,false,fmt,fold,groups,head,hostid,hostname,id,kill,link,ln,logname,mkdir,mkfifo,mknod,mktemp,mv,nice,nl,nohup,nproc,paste,pathk,pinky,printenv,ptx,pwd,readlink,relpath,rm,rmdir,seq,shred,shuf,sleep,stdbuf,sum,sync,tac,tee,timeout,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,users,wc,who,whoami,yes"
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
}
