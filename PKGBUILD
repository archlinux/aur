# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.2.0
pkgrel=2
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libgnome-keyring' 'gtk-vnc' 'vte3' 'telepathy-glib' 'avahi' 'desktop-file-utils' 'dconf' 'shared-mime-info' 'gnome-icon-theme')
optdepends=('openssh: SSH plugin'
            'rdesktop: RDP plugin')
makedepends=('gnome-doc-utils' 'intltool' 'rdesktop' 'openssh')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('9ba0d13000d81d0e47f456b138f52ef2cb7a603c71381993952acc87c25e2e61')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  #building with as-needed breaks rdp
  #https://bugzilla.gnome.org/show_bug.cgi?id=653558
  export LDFLAGS="$LDFLAGS,--no-as-needed"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
      --libexecdir=/usr/lib/vinagre --enable-rdp --disable-spice
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
