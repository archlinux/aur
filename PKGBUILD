# Maintainer: kelon

pkgname=wingpanel-indicator-namarupa
pkgver=1.0.3
pkgrel=1
pkgdesc="Wingpanel indicator for managing system tray icons (Ayatana compatibility)"
arch=('x86_64')
url="https://github.com/GalileoNio/wingpanel-indicator-namarupa"
license=('LGPL2.1')
depends=(
  'glib2'
  'gtk3'
  'granite'
  'wingpanel'
  'libayatana-indicator'
)
makedepends=('git' 'meson' 'vala' 'ninja')
optdepends=('ayatana-indicator-application: bridge StatusNotifierItems to Ayatana indicators')
source=("$pkgname::git+https://github.com/GalileoNio/$pkgname.git#commit=d9fc4e47d58c72e0cf08aa11246910ce84fcef50")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  # Ayatana provides ayatana-indicator3-0.4.pc but meson looks for indicator3-0.4.pc
  local pc_path=$(pkg-config --variable=pcfiledir ayatana-indicator3-0.4)
  ln -sf "$pc_path/ayatana-indicator3-0.4.pc" indicator3-0.4.pc

  # Fix VAPI: use libayatana-indicator header paths instead of libindicator
  sed -i 's|libindicator/|libayatana-indicator/|g' vapi/indicator3-0.4.vapi

  # Fix IndicatorFactory: look for libayatana-application.so instead of libapplication.so
  sed -i 's|libapplication.so|libayatana-application.so|g' src/IndicatorFactory.vala
}

build() {
  cd "$srcdir/$pkgname"
  PKG_CONFIG_PATH="$srcdir/$pkgname:$PKG_CONFIG_PATH" \
    arch-meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" PKG_CONFIG_PATH="$srcdir/$pkgname:$PKG_CONFIG_PATH" \
    ninja -C build install
}
