# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.13.1
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo>=0.11.0' 'garcon' 'libxfce4ui>=4.13' 'libnotify' 'libxklavier'
         'gnome-icon-theme' 'gtk-engines' 'dbus-glib')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(${_pkgname}-$pkgver::git://git.xfce.org/xfce/xfce4-settings#commit=3effeb4908b8d3ed00b11b5fcac27b745500c9f4
        #"http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        'xfconf_4.13.patch::https://git.xfce.org/xfce/xfce4-settings/patch/?id=6a5930fb1050f99b6e494eedcca977e74cba7f62')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Reverse the patch that requires xfconf > 4.13
  patch -uRp1 -i ../xfconf_4.13.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  #./configure
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP' #'01b9e9df6801564b28f3609afee1628228cc24c0939555f60399e9675d183f7e'
            '7229829a88251676308a6fdd8100eae13a1c0228308074f0d8b983efba2a14b3')
