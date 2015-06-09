# Maintainer: TingPing tingping@tingping.se

pkgname=hexchat-git
pkgver=2.11.0.9b2c560
pkgrel=1
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64' 'armv6h')
url='https://hexchat.github.io'
license=('GPL')
options=('!libtool')
depends=('gtk2' 'openssl' 'dbus-glib'
         'libcanberra' 'libnotify' 'libproxy' 
         'hicolor-icon-theme' 'desktop-file-utils' 'sound-theme-freedesktop' 'iso-codes')
makedepends=('intltool' 'git' 'perl' 'python')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'python: for python plugin')
install='hexchat.install'
provides=('hexchat')
conflicts=('hexchat')
source=('git://github.com/hexchat/hexchat.git')
md5sums=('SKIP')
_gitname='hexchat'

pkgver() {
  cd "$_gitname"

  # Development releases don't get tags, so pull it from configure.ac
  _ver=`gawk 'match($0, /AC_INIT\(.*,\[(.*)\]/, matches) { print matches[1] }' configure.ac`
  _rev=`git rev-parse --short HEAD`
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

  # Fix opening irc:// links
  desktop-file-edit \
    --set-key=Exec --set-value="hexchat -e %U" \
    "$pkgdir/usr/share/applications/hexchat.desktop"
}
