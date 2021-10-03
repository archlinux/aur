# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-hybrid
_pkgname=coreutils
__pkgname=uutils-coreutils
pkgver=9.0_0.0.7
_pkgver=9.0
__pkgver=0.0.7
pkgrel=1
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
        "$__pkgname-$__pkgver.tar.gz::$_url/archive/$__pkgver.tar.gz"
        "01-fix-fs72253.patch")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha512sums=('9be08212891dbf48e5b22e7689dc27dac50df4631ebf29313470b72b7921f0b2aa5242917d05587785358495ca56e3b21f5b3ca81043d53cab92354da6c53a03'
            'SKIP'
            'b9f14f02dd485b5816bdbad2210f7436aff599f84f7c6f42827ef1050969dbdf8e112f7866a80c736a9b3114ab5b6d923df5537ce5e38f57ba8167179fd39041'
            '10313ecc918de8ee007c3bc9a57a96372a537b7b1653577daa5609f1026bcc7e6ef4907b75243b37cef305c5c9b45eb446e49649059f667009a2b1fdf6ef3dc3')

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
}
