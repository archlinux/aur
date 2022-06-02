# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgbase=evolution-csd-git
pkgname=evolution-csd-git
pkgver=3.44.2+21+g1bd7f04bf7
pkgrel=1
pkgdesc="Manage your email, contacts and schedule"
url="https://wiki.gnome.org/Apps/Evolution"
arch=(x86_64)
license=(GPL)
depends=(gnome-desktop evolution-data-server libcanberra libpst libytnef
         dconf gspell libcryptui gnome-autoar)
makedepends=(intltool itstool docbook-xsl networkmanager
             highlight gtk-doc yelp-tools git cmake ninja)
options=(!emptydirs)
conflicts=(evolution)
replaces=(evolution)
provides=(evolution)
source=("git+https://gitlab.gnome.org/gnumdk/evolution.git#branch=archlinux")
sha256sums=('SKIP')

pkgver() {
  cd evolution
  git describe --tags | sed 's/^EVOLUTION_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd evolution
}

build() {
  cmake -S evolution -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBEXEC_INSTALL_DIR=/usr/lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DENABLE_SMIME=ON \
    -DENABLE_GTK_DOC=ON
  cmake --build build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package() {
  depends+=(libcamel-1.2.so libebook-1.2.so libebook-contacts-1.2.so
            libecal-2.0.so libedataserver-1.2.so libedataserverui-1.2.so)
  optdepends=('highlight: text highlight plugin'
              'evolution-spamassassin: Spamassassin spam check plugin'
              'evolution-bogofilter: Bogofilter spam check plugin')
  groups=(gnome-extra)

  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgdir"
  for x in bogofilter spamassassin; do
    _pick $x usr/lib/evolution/modules/module-$x.so
    _pick $x usr/share/metainfo/org.gnome.Evolution-$x.metainfo.xml
  done
}
