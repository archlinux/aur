# $Id: PKGBUILD 232955 2015-03-06 22:10:32Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

_pkgname=xfce4-settings
pkgname=xfce4-settings-blank-screen-fix
conflicts=('xfce4-settings')
pkgver=4.12.0
pkgrel=4
pkgdesc="Settings manager for xfce with fix for blank screen bug"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libnotify' 'libxklavier'
         'gnome-icon-theme' 'gnome-themes-standard')
makedepends=('intltool' 'xf86-input-libinput')
optdepends=('libcanberra: for sound control')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        default-xsettings-xml.patch
        blank-screen-fix.patch)
sha256sums=('04becef105c19d0266cfe8dbf42619e7233c3b9fa99b43dbfc9c6a5959501f81'
            '1c4110fd5ce0f17564cda892b72d59a87b515fdb4580c7154bbb4c1979f5ade7'
            'e6adaa6fe558b4b999db2efe5be32ff5128f03030fdf6888de4012d4b2ea94b7')
prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Enable GNOME icon theme, Adwaita theme and font hinting by default
  patch -Np1 -i "$srcdir/default-xsettings-xml.patch"

  # Fix blank screen after monitor is power cycled: https://bugzilla.xfce.org/show_bug.cgi?id=11107
  # Thanks to jkampe68 for the patch
  patch -Np1 -i "$srcdir/blank-screen-fix.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
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
    --disable-upower-glib \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
