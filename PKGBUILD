# Maintainer: bs mt <bsmt at bsmt dot me>
pkgname=socketcand-git
pkgver=0.4.2.r6.gdf7fb4f
pkgrel=1
pkgdesc="Provide access to CAN interfaces on a machine via a network interface."
arch=('i686' 'x86_64')
url="https://github.com/dschanoeh/socketcand"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'autoconf' 'libconfig')
provides=('socketcand')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/dschanoeh/socketcand.git
_gitname=socketcand

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  autoconf
  ./configure --prefix=/usr --disable-init-script --disable-rc-script --mandir=/usr/share/man/man1
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/etc/rc.d
  make DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/etc/rc.d
}

# vim:set ts=2 sw=2 et:
