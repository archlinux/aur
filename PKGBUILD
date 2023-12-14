# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-hybrid-git
_pkgname=coreutils
__pkgname=uutils
pkgver=0.0.23.r221.g60fbf1db8
pkgrel=1
pkgdesc='GNU coreutils / uutils-coreutils hybrid package. Uses stable uutils programs mixed with GNU counterparts if uutils counterpart is unfinished / buggy'
arch=('x86_64')
license=('GPL3' 'MIT')
url='https://www.gnu.org/software/coreutils/'
_url='https://github.com/uutils/coreutils'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
conflicts=('coreutils' 'coreutils-hybrid')
provides=('coreutils' 'coreutils-hybrid')
makedepends=('git' 'rust' 'cargo' 'gperf' 'rsync' 'wget')
source=("coreutils::git+https://git.savannah.gnu.org/git/coreutils.git"
        "uutils::git+https://github.com/uutils/coreutils.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$__pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  # Check incompatible file
  if [ -e /usr/share/man/man1/groups.1.gz ] || [ -e /usr/share/man/man1/kill.1.gz ] || [ -e /usr/share/man/man1/more.1.gz ]; then
  # Define color variables
  yellow='\033[1;33m'
  red='\033[1;31m'
  NC='\033[0m' # No Color

  # Echo red colored text
  echo -e ""${yellow}"WARNING :
  "${red}"DELETE INCOMPATIBLE FILES MANUALLY ${NC}"
  ls "/usr/share/man/man1/"{groups,kill,more}".1.gz"
  exit
  fi

}

build() {
  # Build GNU coreutils without the stable uutils programs counterparts leaving out: stat, touch, realpath (genfstab broken), ln (no -s option)
  cd "$_pkgname"
  ./bootstrap
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program="arch,base32,base64,basename,cat,chgrp,chmod,chown,chroot,cksum,comm,csplit,cut,dircolors,dirname,du,env,echo,expand,factor,false,fmt,fold,groups,head,hostid,hostname,id,kill,link,logname,mkdir,mkfifo,mknod,mktemp,mv,nice,nl,nohup,nproc,paste,pathk,pinky,printenv,ptx,pwd,readlink,relpath,rm,rmdir,seq,shred,shuf,sleep,stdbuf,sum,sync,tee,timeout,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,users,who,wc,whoami,yes"
}

package() {
  # Install uutils-coreutils, skip the buggy parts
  cd "$__pkgname"
  make \
      DESTDIR="$pkgdir" \
      MANDIR=/share/man/man1 \
      PREFIX=/usr \
      PROFILE=release \
      PROG_PREFIX= \
      install

  # Install GNU coreutils over the uutils-coreutils
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  
  # Clean conflicts, Arch ships these in other apps
  cd "$pkgdir/usr/bin/" && rm groups hostname kill more uptime
  rm -r "$pkgdir/usr/share/bash-completion/completions/"
}
