# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.22.0+19+g5f615ff
pkgrel=1
pkgdesc="A VNC Client for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Vinagre"
arch=(x86_64)
license=(GPL)
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi dconf spice-gtk3 gnutls freerdp)
makedepends=(docbook-xsl intltool openssh itstool spice-protocol vala gnome-common appstream-glib git)
optdepends=('openssh: SSH plugin')
_commit=5f615ff250186b6d3156d99d9d22e84259a1119b  # master
source=("git+https://git.gnome.org/browse/vinagre#commit=$_commit"
        freerdp2017.diff)
sha256sums=('SKIP'
            'fbf3ecc4126f1090e4979c4921bd52b8fa3d5c31330457d98c4df384d0cdcf34')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Fixup missing tag for pkgver()
  git tag -f 3.22.0 272163645240debe41620f3bff84af8cb475f742

  patch -Np1 -i ../freerdp2017.diff

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
