# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
pkgname=tilix-git
pkgver=1.9.6.r20.g1405af0b
pkgrel=2
pkgdesc="A tiling terminal emulator for Linux using GTK+ 3"
arch=('x86_64')
url="https://gnunn1.github.io/tilix-web"
license=('MPL-2.0')
depends=(
  'dconf'
  'gsettings-desktop-schemas'
  'gtkd'
  'liblphobos'
  'libx11'
  'vte3'
)
makedepends=(
  'git'
  'ldc'
  'meson'
  'po4a'
)
checkdepends=(
  'appstream'
)
optdepends=(
  'python-nautilus: for "Open Tilix Here" support in nautilus'
  'libsecret: for the password manager'
  'vte3-notification: for desktop notifications support'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gnunn1/tilix.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
}

build() {

  # Build with LDC
  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto//')"
  export DFLAGS="--flto=full"

  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :

  appstreamcli validate --no-net build/data/com.gexperts.Tilix.appdata.xml || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
