# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=empathy
pkgver=3.25.90+34+g78f4d4fda
pkgrel=3
pkgdesc="A GNOME instant messaging client using the Telepathy framework"
url="https://wiki.gnome.org/Apps/Empathy"
arch=(x86_64)
license=(GPL2)
depends=(clutter-gst clutter-gtk folks gcr iso-codes libcanberra libpulse webkit2gtk
         telepathy-farstream telepathy-glib telepathy-logger telepathy-mission-control geoclue2
         geocode-glib cheese libchamplain libgudev)
makedepends=(intltool itstool docbook-xsl python gnome-common git)
optdepends=('telepathy-gabble: XMPP/Jabber support'
            'telepathy-idle: IRC support'
            'telepathy-salut: Link-local XMPP support'
            'telepathy-haze: libpurple support')
_commit=78f4d4fdadd7da67e063c2905649f6a6015ef8f9  # master
source=("git+https://git.gnome.org/browse/empathy#commit=$_commit"
        "git+https://git.gnome.org/browse/telepathy-account-widgets"
        enchant-2.patch)
sha256sums=('SKIP'
            'SKIP'
            'f177f0dfc242018dd52e312637f513fd08f64aa991b45930cc3ea9a2576f795e')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^EMPATHY_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git config --local submodule.telepathy-account-widgets.url "$srcdir/telepathy-account-widgets"
  git submodule update

  patch -Np1 -i ../enchant-2.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  ./configure --prefix=/usr \
      --sysconfdir=/etc  \
      --libexecdir=/usr/lib/empathy \
      --disable-static \
      --disable-Werror
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
