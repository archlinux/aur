# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Patrick Eigensatz <patrick.eigensatz@gmail.com>
pkgname=qjournalctl
pkgver=0.6.4
pkgrel=2
pkgdesc="Qt-based graphical user interface for the journalctl command"
arch=('x86_64')
url="https://github.com/pentix/qjournalctl"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'libssh'
  'qt5-base'
)
makedepends=('imagemagick')
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("https://github.com/pentix/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8f456e599d5b54f8463e18e2880129393ba65a5e5dbdde19c893291f9ab92cb3')

prepare() {
  cd $pkgname-$pkgver
  sed -i '/^INSTALLS/ s/desktop-icon//' "$pkgname.pro"
}

build() {
  cd "$pkgname-$pkgver"
  magick "ui/$pkgname.png" +set date:create +set date:modify \
    -resize 64x64 -alpha on "ui/$pkgname-64x64.png"
  magick "ui/$pkgname.png" +set date:create +set date:modify \
    -resize 96x96 -alpha on "ui/$pkgname-96x96.png"

  qmake-qt5 \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}" \
    "$pkgname.pro"
  make
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "$pkgname.appdata.xml"
  desktop-file-validate "ui/$pkgname.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 "ui/$pkgname-64x64.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 "ui/$pkgname-96x96.png" \
    "$pkgdir/usr/share/icons/hicolor/96x96/apps/$pkgname.png"
}
