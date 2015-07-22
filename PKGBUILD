# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.40.0
pkgrel=6
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf')
url="http://www.gnome.org"
source=(http://download.gnome.org/sources/vte/${pkgver::4}/vte-$pkgver.tar.xz
        vte291-command-notify.patch
	add-zsh-notfication-support.patch)
sha256sums=('54d96181626f2641c78e30ccf991ea124b8713646231e52a973dea3adf02d852'
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
