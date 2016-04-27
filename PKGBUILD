# Maintainer: TingPing tingping@tingping.se

pkgname=hexchat-git
pkgver=2.12.0.r1295.g823ef32
pkgrel=1
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64' 'armv6h')
url='https://hexchat.github.io'
license=('GPL')
options=('!libtool')
depends=('gtk2' 'openssl' 'dbus-glib' 'luajit'
         'libcanberra' 'libnotify' 'libproxy' 
         'hicolor-icon-theme' 'desktop-file-utils' 'sound-theme-freedesktop' 'iso-codes')
makedepends=('intltool' 'git' 'perl' 'python' 'autoconf-archive')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'python: for python plugin')
provides=('hexchat')
conflicts=('hexchat' 'hexchat-lua-git')
replaces=('hexchat-lua-git')
source=('git://github.com/hexchat/hexchat.git')
md5sums=('SKIP')
_gitname='hexchat'

prepare() {
  cd "$_gitname"

  # Needed for pkgver()
  aclocal
}

pkgver() {
  cd "$_gitname"

  # Development releases don't get tags, so pull it from configure.ac
  _ver=`autoconf -t 'AC_INIT:$2'`
  _rev=`git describe | sed 's/^v[^-]*-/r/; s/-/./'`
  echo "$_ver.$_rev"
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh --prefix=/usr --enable-textfe --enable-python=python3 --disable-debug
  make -s
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
