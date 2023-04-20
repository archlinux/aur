# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
pkgname=tilix-git
pkgver=1.9.5.r66.g5bbd0fc6
pkgrel=1
pkgdesc="A tiling terminal emulator for Linux using GTK+ 3"
arch=('x86_64')
url="https://gnunn1.github.io/tilix-web"
license=('MPL2')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
makedepends=('appstream' 'git' 'ldc' 'po4a' 'meson')
checkdepends=('appstream-glib')
optdepends=('python-nautilus: for "Open Tilix Here" support in nautilus'
            'libsecret: for the password manager'
            'vte3-notification: for desktop notifications support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gnunn1/tilix.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
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
  meson test -C build --print-errorlogs

  appstream-util validate-relax --nonet build/data/com.gexperts.Tilix.appdata.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
