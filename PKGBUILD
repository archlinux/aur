# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>
# Contributor: Christian Assfalg <ch.assfalg_at_gmx_dot_de>
# Patch by Jan Holthuis
# Also Maintainers and Contributors of the ›mutter‹ package, this package is based on

_realname=mutter
pkgname=$_realname-catalyst
pkgver=3.20.3
pkgrel=1
pkgdesc="A window manager for GNOME with patch for catalyst compatibility"
url="https://git.gnome.org/browse/mutter"
arch=(i686 x86_64)
license=('GPL')
depends=('clutter'
  'dconf'
  'gobject-introspection-runtime'
  'gsettings-desktop-schemas'
  'libcanberra'
  'startup-notification'
  'zenity'
  'libsm'
  'gnome-desktop'
  'upower'
  'libxkbcommon-x11'
  'gnome-settings-daemon'
  'libgudev'
)
makedepends=('intltool'
  'libxkbcommon-x11'
  'gobject-introspection'
  'python2'
)
conflicts=('mutter')
provides=("mutter=${pkgver}")
groups=('gnome')
options=('!emptydirs')
source=(https://download.gnome.org/sources//$_realname/${pkgver:0:4}/$_realname-$pkgver.tar.xz
        catalyst-workaround.patch)
sha256sums=('142c5271df4bde968c725ed09026173292c07b4dd7ba75f19c4b14fc363af916'
            'cf6c54cf23dc5898ab105d8bde2d60fd3f6671b319ffef12b0584544bfb23655')

prepare() {
  cd "$_realname-$pkgver"

  #https://bugzilla.gnome.org/show_bug.cgi?id=741581
  echo "Commenting out call to function with XRRChangeOutputProperty to fix issue with catalyst"
  patch -Np1 < ../catalyst-workaround.patch
  echo "Patch applied"
}

build() {
  cd "$_realname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/mutter \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
