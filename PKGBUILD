# Maintainer: Lex Black (autumn-wind at web.de)
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=smuxi
pkgbase=${_pkgbase}-git
pkgname=('smuxi-server-git' 'smuxi-git')
pkgver=1.2.1.r0.g6692e128
pkgrel=1
pkgdesc="free, distributed and user-friendly IRC / Twitter / XMPP / Campfire / JabbR client for GNOME/GTK+"
arch=('any')
url="https://www.smuxi.im/"
license=('GPL')
makedepends=('intltool' 'git' 'notify-sharp' 'log4net' 'nini' 'gtkspell' 'stfl' 'sqlite')
#options=('!emptydirs')
source=('git+https://gitlab.gnome.org/GNOME/smuxi.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  git submodule init
  git submodule update
}

build() {
  cd $srcdir/$_pkgbase

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--enable-engine-irc \
	--enable-engine-xmpp \
	--disable-engine-twitter \
	--disable-engine-campfire \
	--disable-engine-jabbr \
	--enable-frontend-gnome \
	--enable-frontend-stfl \
	--with-vendor-package-version="Arch Linux Git-$pkgver-$pkgrel (master)"

  make -j1
}

package_smuxi-server-git() {
  pkgdesc+=" (common files and server)"
  depends=('log4net' 'nini')
  optdepends=('sqlite: alternative for persistent message storing')
  conflicts=('smuxi-server')
  provides=('smuxi-server=1.1')


  cd "$srcdir/$_pkgbase"

  make DESTDIR="$pkgdir" install

  # Split frontend
  [[ -d $srcdir/frontend ]] && rm -r "$srcdir/frontend/"
  mkdir "$srcdir"/frontend
  mv "$pkgdir"/usr/bin/smuxi-frontend-{gnome,stfl} \
     "$pkgdir"/usr/lib/pkgconfig/smuxi-frontend.pc \
     "$pkgdir"/usr/lib/smuxi/smuxi-frontend* \
     "$pkgdir"/usr/share/{applications,icons} \
     "$pkgdir"/usr/share/man/man1/smuxi-frontend* \
     "$srcdir/frontend/"
}

package_smuxi-git() {
  pkgdesc+=" (frontends)"
  depends=('smuxi-server' 'notify-sharp' 'gtkspell' 'stfl' 'desktop-file-utils' 'gtk-update-icon-cache' 'xdg-utils')
  conflicts=('smuxi')
  provides=('smuxi=1.1')


  cd "$srcdir/frontend"

  mkdir -p "$pkgdir"/usr/{bin,lib/{pkgconfig,smuxi},share/man/man1}
  mv smuxi-frontend-{gnome,stfl} "$pkgdir/usr/bin"
  mv smuxi-frontend.pc "$pkgdir/usr/lib/pkgconfig"
  mv smuxi-frontend*.1 "$pkgdir/usr/share/man/man1"
  mv smuxi-frontend* "$pkgdir/usr/lib/smuxi"
  mv {applications,icons} "$pkgdir/usr/share"
}
