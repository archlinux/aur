# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.22.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Vinagre"
arch=(i686 x86_64)
license=(GPL)
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi dconf spice-gtk3 gnutls freerdp)
makedepends=(docbook-xsl intltool openssh itstool spice-protocol vala gnome-common appstream-glib git)
optdepends=('openssh: SSH plugin')
groups=(gnome-extra)
_commit=272163645240debe41620f3bff84af8cb475f742  # master
source=("git://git.gnome.org/vinagre#commit=$_commit"
        freerdp2.patch)
sha256sums=('SKIP'
            '17282b64a78f92f317d62c98a5650595745e9dec93b4b223f1bb89747094b75c')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Fixup missing tag for pkgver()
  git tag -f 3.22.0 272163645240debe41620f3bff84af8cb475f742

  patch -Np1 -i ../freerdp2.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
    --enable-rdp --enable-spice --enable-compile-warnings=minimum
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
