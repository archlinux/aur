# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>
# Contributor: Christian Assfalg <ch.assfalg_at_gmx_dot_de>
# Also Maintainers and Contributors of the ›mutter‹ package, this package is based on

pkgname=mutter-catalyst
pkgver=3.16.2
pkgrel=1
pkgdesc="A window manager for GNOME with patch for catalyst compatibility"
arch=(i686 x86_64)
license=('GPL')
depends=('clutter'
  'dconf'
  'gobject-introspection'
  'gsettings-desktop-schemas'
  'libcanberra'
  'startup-notification'
  'zenity'
  'libsm'
  'gnome-desktop'
  'upower'
  'libxkbcommon-x11'
)
makedepends=('intltool'
  'gnome-doc-utils'
  'libxkbcommon-x11'
)
conflicts=('mutter-wayland'
  'mutter'
)
replaces=('mutter-wayland')
provides=("mutter=${pkgver}")
url='http://www.gnome.org'
groups=('gnome')
options=('!emptydirs')
install=mutter-catalyst.install
source=("http://ftp.gnome.org/pub/gnome/sources/mutter/${pkgver:0:4}/mutter-$pkgver.tar.xz"
        'catalyst-comment.patch' )
sha256sums=('4a2b752f0b3aa59f50563190222623324f5154acbb6bf174213f5849e77d0763'
            'fe058744aadcf87cb92a9268beddbb1a501631e02b335a58c593b36c8b47d7d9')

build() {
  cd "mutter-$pkgver"

  #https://bugzilla.gnome.org/show_bug.cgi?id=741581
  echo "Commenting out call to function with XRRChangeOutputProperty to fix issue with catalyst"
  patch -p1 < ../catalyst-comment.patch
  echo "Patch applied"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/mutter \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "mutter-$pkgver"
  make DESTDIR="$pkgdir" install
}
