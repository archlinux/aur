# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.3.4
pkgrel=1
pkgdesc='remote desktop client written in GTK+ (compiled with appindicator)'
arch=(x86_64)
url=https://www.remmina.org/
license=(GPL)
depends=(
    avahi
    libappindicator-gtk3
    libgcrypt
    libssh
    vte3
)
optdepends=(
    'freerdp: RDP plugin'
    'libsecret: Secret plugin'
    'libvncserver: VNC plugin'
    'libxkbfile: NX plugin'
    'nxproxy: NX plugin'
    'spice-gtk: Spice plugin'
    'telepathy-glib: Telepathy plugin'
    'xorg-server-xephyr: XDMCP plugin'
)
makedepends=(
    cmake
    freerdp
    libvncserver
    spice-gtk
    spice-protocol
    telepathy-glib
)

replaces=(
    remmina-plugins
    remmina
)
provides=(
    remmina-plugins
    remmina
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/FreeRDP/Remmina/archive/v${pkgver/rc/-rc}.tar.gz")
sha256sums=('a99a46f6d17d621c68561d30cbb30df7767cc42861a55a0daa2e836dd732900c')

prepare() {
  cd Remmina-${pkgver/rc/-rc}
  sed -e 's|ssh_threads|ssh|' -i cmake/FindLIBSSH.cmake # Fix build with libssh 0.8
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
}
