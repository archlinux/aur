# $Id$
# Maintainer: Heine Pedersen <heinep at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
epoch=1
pkgver=1.2.0rcgit.18
pkgrel=1
pkgdesc="remote desktop client written in GTK+ (compiled with appindicator)"
arch=(i686 x86_64)
url="http://www.remmina.org/"
license=('GPL')
depends=('gtk3' 'zlib' 'libjpeg' 'libssh' 'avahi' 'vte3'
	 'libgcrypt' 'libxdmcp' 'libsecret' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('intltool' 'pkgconfig' 'cmake' 'libgnome-keyring'
             'avahi' 'libxkbfile' 'freerdp' 'telepathy-glib'
             'libvncserver')
optdepends=('libxkbfile'
            'freerdp'
            'telepathy-glib'
            'gnome-keyring'
            'nxproxy'
            'xorg-server-xephyr: XDMCP support'
            'libvncserver: VNC client/server support')
replaces=('remmina-plugins')
provides=('remmina-plugins', 'remmina')
conflicts=('remmina')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeRDP/Remmina/archive/v${pkgver/rc/-rc}.tar.gz"
	"fix-freerdp-name.patch"
    "fix-git-rev.patch")
sha256sums=('78b237e1178cc808f47ec6ca20f371894cd2b4c77f06ae560ede976eb3808faa'
            '70ada2cd680678ccaadf2c4e1e726e7d286550dc3cef19cf653f3e9908224a99'
            '228758734568340ad2fa78f3cbdf72186830e963bd8855eb70558d4469767290')

prepare() {
  cd "$srcdir"/Remmina-${pkgver/rc/-rc}/
#  patch -p1 <"$srcdir"/fix-freerdp-name.patch
#  patch -p1 <"$srcdir"/fix-git-rev.patch
}

build() {
  cd "$srcdir"/Remmina-${pkgver/rc/-rc}/
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON .
  make
}

package() {
  cd "$srcdir"/Remmina-${pkgver/rc/-rc}/
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/build
}
