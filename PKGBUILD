# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.22.0+35+gadcb63c
pkgrel=1
pkgdesc="A VNC Client for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Vinagre"
arch=(x86_64)
license=(GPL)
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi dconf spice-gtk3 gnutls freerdp)
makedepends=(docbook-xsl intltool openssh itstool spice-protocol vala gnome-common appstream-glib git)
optdepends=('openssh: SSH plugin')
_commit=adcb63cfad988a92126a751b6e8f7cfef0762955  # master
source=("git+https://gitlab.gnome.org/GNOME/vinagre.git#commit=$_commit"
        freerdp2017.diff)
sha256sums=('SKIP'
            'fbf3ecc4126f1090e4979c4921bd52b8fa3d5c31330457d98c4df384d0cdcf34')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

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
