# vim:set ts=2 sw=2 et:
#
# Maintainer: Tblue <tilman (AT) ax86 (DOT) net>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=notifyconf
pkgver=7
pkgrel=4
pkgdesc="GUI for configuring notify-osd-customizable"
url="https://launchpad.net/notifyconf"
arch=('i686' 'x86_64')
depends=('notify-osd-customizable' 'qt4')
makedepends=('bzr')
license=(GPL)
source=('notifyconf.desktop')

# Not using lp: handler because it makes bzr use pubkey auth which in turn
# prompts me for my privkey password every time I build this package.
_bzrtrunk='http://bazaar.launchpad.net/~amandeepgrewal/notifyconf/trunk'
_bzrmod=notifyconf

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"

  install -D -m 644 not.png "$pkgdir/usr/share/notifyosdconf/not.png"
  install -D -m 644 default.def "$pkgdir/usr/share/notifyosdconf/default.def"
  install -D -m 644 "$srcdir/notifyconf.desktop" "$pkgdir/usr/share/applications/notifyconf.desktop"
  install -D -m 755 NotifyOSDConfiguration "$pkgdir/usr/bin/notifyconf"
}

md5sums=('06b1fbde2b18edbe3e152797063a9306')
