# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
pkgname=tilix-git
pkgver=1.9.6.r42.gd25ded8
pkgrel=1
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
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gnunn1/tilix.git'
        "https://github.com/gnunn1/tilix/pull/2222.patch")
sha256sums=('SKIP'
            'e56da87ae09124a229b5641de5a477351db9656063def9ad07f42b51735bd826')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Patch Align to GtkAlign, due to conflicting symbols
  sed -i 's/(Align\./(GtkAlign./g' source/gx/tilix/prefeditor/prefdialog.d
  sed -i 's/(Align\./(GtkAlign./g' source/gx/tilix/terminal/terminal.d

  # Remove unneeded libunwind dep
  patch -Np1 -i ../2222.patch
}

build() {

  # Build with LDC
  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto//')"
  export DFLAGS="--flto=full --allinst"

  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
