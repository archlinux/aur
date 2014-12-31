# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

pkgname=ejabberd-git
_pkgname='ejabberd'
pkgver=20120322
pkgrel=2
pkgdesc='An Erlang Jabber server (git HEAD)'
url='http://www.ejabberd.im/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('erlang' 'expat' 'net-tools'
  'openssl' 'pam' 'zlib')
makedepends=('git')
conflicts=('ejabberd' 'ejabberd-svn')

install=$pkgname.install
source=('ejabberd.rc.d')
md5sums=('c49bb73bdcb50ea7fcf411bbfed7629a')

_gitroot="git://git.process-one.net/$_pkgname/mainline.git"
_gitname="$_pkgname"

build() {
  cd "${srcdir}"

  msg 'Updating source from GIT server...'
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "$srcdir/$_gitname"{,-build}
  cd "${srcdir}/${_gitname}-build/src"

  autoreconf -i; ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-odbc --enable-pam
  make; make DESTDIR=$pkgdir install

  install -Dm755 $srcdir/ejabberd.rc.d $pkgdir/etc/rc.d/ejabberd
}
