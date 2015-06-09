# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-session
pkgver=12.10.4
pkgrel=5
pkgdesc='Indicator showing session management, status and user switching'
arch=('i686' 'x86_64')
url='https://launchpad.net/indicator-session'
license=('GPL')
groups=('pantheon' 'pantheon-unstable')
depends=('libdbusmenu-gtk3' 'libindicator-gtk3')
makedepends=('intltool')
install='indicator-session.install'
source=("https://launchpad.net/indicator-session/${pkgver%.*}/${pkgver}/+download/indicator-session-${pkgver}.tar.gz"
        'remove-unused-deps.patch'
        'gdbus-port.patch'
        'fix-build.patch'
        'fix-fallback-icon.patch'
        'support-reboot.patch'
        'systemd-support.patch')
sha256sums=('6b640f936273f709a2a67d1edfebbf342a6a899a53d9791747c899faa0fcd384'
            'bbc3fed2c7d5311caaea56bd424f3ffea45afbaf53c9f0700b377f3858ffd9f7'
            'd65b661a52e68abf745a169e1a8518d1450f439b5cd314f5fee3f883ba0f7747'
            '2dda11ce7c7a7877de1b163ee13439fdb0885d63b34cefde81af2e09be3b83e5'
            '55099631308aa044399fb959ac4b03f11b7e961415ee74487935a9360553896e'
            '6412b10212e97c6c828af8025ce36b609b58a77126c639d8b28a33c5b9490c79'
            '98da140123c78e648311e6d2350a5405916e1b59f97694b4fc71af1f7df716eb')

prepare() {
  cd indicator-session-${pkgver}

  patch -Np0 -i ../remove-unused-deps.patch
  patch -Np0 -i ../gdbus-port.patch
  patch -Np1 -i ../fix-build.patch
  patch -Np0 -i ../fix-fallback-icon.patch
  patch -Np1 -i ../support-reboot.patch
  patch -Np0 -i ../systemd-support.patch
  sed -i 's/gnome-control-center credentials/credentials-preferences/' src/online-accounts-mgr.c
  sed -i 's/Ubuntu Help/Desktop Help/' src/session-menu-mgr.c
}

build() {
  cd indicator-session-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  autoreconf -fi
  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/indicator-session' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-gtklogouthelper \
    --disable-schemas-compile \
    --disable-static
  make
}

package() {
  cd indicator-session-${pkgver}

  make DESTDIR="${pkgdir}" install

# Remove guest session
  rm -r "${pkgdir}"/usr/share/indicators
}

# vim: ts=2 sw=2 et:
