# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gnome-flashback-git
_gitname=gnome-flashback
pkgver=3.17.2.r8.g89fdc86
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="GNOME Flashback session (development version)"
url="https://wiki.gnome.org/Projects/GnomeFlashback"
# Note: Dependencies from gnome-panel onwards are flashback session dependencies and are not required for building the flashback module
depends=('gnome-desktop' 'libcanberra' 'libpulse' 'upower' 'gnome-panel' 'gnome-screensaver' 'gnome-session' 'metacity' 'nautilus' 'notification-daemon' 'polkit-gnome')
optdepends=('compiz: required for the GNOME Flashback (Compiz) session')
makedepends=('git' 'gnome-common' 'intltool')
provides=('gnome-flashback')
conflicts=('gnome-flashback')
install=$_gitname.install
source=(git://git.gnome.org/gnome-flashback
        session-components.patch)
sha256sums=('SKIP'
            '046121b5fbb185c4736a62b909e74985f52c0f0ff4b8a17c5a26d84576bfa4c0')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"

  # Add extra components to the Flashback sessions
  patch -Np1 -i "$srcdir/session-components.patch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/"$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

