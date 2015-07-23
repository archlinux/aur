# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.40.2
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf')
url="http://www.gnome.org"
source=(http://download.gnome.org/sources/vte/${pkgver::4}/vte-$pkgver.tar.xz
        vte291-command-notify.patch
	add-zsh-notfication-support.patch)
sha256sums=('9b68fbc16b27f2d79e6271f2b0708808594ac5acf979d0fccea118608199fd2d'
            'c1d6be7fab5997a6908aac9f5864335293c4c1052847fdf10f406b54aacdc650'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a')

prepare () {
  cd vte-$pkgver

  patch -p1 -i ../vte291-command-notify.patch
  patch -p1 -i ../add-zsh-notfication-support.patch
}

build() {
  cd "vte-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection --enable-gnome-pty-helper
  make
}

package_vte3-notification(){
  depends=('gtk3' 'vte-notification-common')
  provides=(vte3=$pkgver)
  conflicts=(vte3)
  cd "vte-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/lib/vte/gnome-pty-helper
  rm "$pkgdir"/etc/profile.d/vte.sh
}

package_vte-notification-common() {
  pkgdesc="Common files used by vte and vte3"
  depends=('glibc')
  provides=(vte-common=$pkgver)
  conflicts=(vte-common)
  cd "vte-$pkgver"

  make -C gnome-pty-helper DESTDIR="$pkgdir" install
  install -Dm644 src/vte.sh "$pkgdir"/etc/profile.d/vte.sh
}
