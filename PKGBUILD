# $Id$
# See AUR interface for current maintainer
# Edited to include libxnvctrl dependancy
# Based on http://xfce.10915.n7.nabble.com/NVidia-data-td16172.html
# also based on arch bug report https://bugs.archlinux.org/task/25548

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

pkgname=xfce4-sensors-plugin-nvidia
pkgver=1.2.6
pkgrel=2
pkgdesc="A lm_sensors plugin for the Xfce panel with nvidia gpu support"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors' 'libnotify' 'hicolor-icon-theme' 'libxnvctrl')
makedepends=('intltool' 'hddtemp' 'gnu-netcat')
optdepends=('hddtemp: for monitoring the temperature of hard drives')
conflicts=('xfce4-sensors-plugin')
install=$pkgname.install
# _pkgname lets us rename the package without altering the script too much
_pkgname=xfce4-sensors-plugin
source=(http://archive.xfce.org/src/panel-plugins/$_pkgname/1.2/$_pkgname-$pkgver.tar.bz2)
sha256sums=('235ef842bd45e701bceebb21a384ab09f21afceea8ed95f91bb4c6cf3abe1bc0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Satisfy the check that hddtemp is queryable via netcat
  # (https://bugs.archlinux.org/task/28275)
  echo ohai | nc -l -p 7634 -s localhost -c &

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --datadir=/usr/share \
    --datarootdir=/usr/share \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
