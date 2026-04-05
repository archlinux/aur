# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils

pkgname=advcpmv
pkgver=9.5
pkgrel=4
pkgdesc="'cp' and 'mv' utilities with progress bar patches"
arch=('x86_64')
license=('GPL3-or-later')
url='https://github.com/jarun/advcpmv'

depends=('glibc' 'acl' 'attr')

provides=('acp' 'amv' 'advcp' 'advmv' 'cpg' 'mvg')

source=(
  "mirror://gnu/coreutils/coreutils-$pkgver.tar.xz"
  "mirror://gnu/coreutils/coreutils-$pkgver.tar.xz.sig"
  "advcpmv-9.5-2.patch"
)

validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9')

sha256sums=('cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a'
            'SKIP'
            'd89abdc9822c9dee3bafea12874dce952f0c9189f94b11337b5f1b5f1c8ef96c')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/advcpmv-9.5-2.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-no-install-program='[,b2sum,base64,base32,basenc,basename,cat,chcon,chgrp,chmod,chown,cksum,comm,csplit,cut,date,dd,dir,dircolors,dirname,du,echo,env,expand,expr,factor,false,fmt,fold,ginstall,groups,head,id,join,kill,link,ln,logname,ls,md5sum,mkdir,mkfifo,mknod,mktemp,nl,nproc,nohup,numfmt,od,paste,pathchk,pr,printenv,printf,ptx,pwd,readlink,realpath,rm,rmdir,runcon,seq,sha1sum,sha224sum,sha256sum,sha384sum,sha512sum,shred,shuf,sleep,sort,split,stat,sum,sync,tac,tail,tee,test,touch,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,vdir,wc,whoami,yes]'

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 src/cp "${pkgdir}/usr/bin/advcp"
  ln -s advcp "${pkgdir}/usr/bin/acp"
  ln -s advcp "${pkgdir}/usr/bin/cpg"

  install -Dm755 src/mv "${pkgdir}/usr/bin/advmv"
  ln -s advmv "${pkgdir}/usr/bin/amv"
  ln -s advmv "${pkgdir}/usr/bin/mvg"
}
