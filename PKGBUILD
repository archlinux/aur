# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
pkgname=tilix-git
pkgver=1.9.5.r42.g4173ed42
pkgrel=2
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
source=('git+https://github.com/gnunn1/tilix.git'
        'update-to-gtkd-3.10.0.patch'
        'nautilus-Don-t-import-a-specific-version.patch'
        'nautilus-Add-compatibility-with-Nautilus-43.patch')
sha256sums=('SKIP'
            'ee3136dfca40ddc9407b94d79d6ad664abee16aa770f161b5d07ae50293820c6'
            '05c8a4ca4b99aec457eaef7e4437862a111026f445f14148351b28be7b1f3c3e'
            'cac3bd721ca089c7526aed97c0fc7dd5da7fcdba965749a487b2a229a0fbe616')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Update to GtkD 3.10.0
  # https://github.com/gnunn1/tilix/pull/2100
  patch -Np1 -i ../update-to-gtkd-3.10.0.patch

  # Debian patches
  # https://salsa.debian.org/gnome-team/tilix/-/tree/debian/master/debian/patches
  patch -Np1 -i ../nautilus-Don-t-import-a-specific-version.patch
  patch -Np1 -i ../nautilus-Add-compatibility-with-Nautilus-43.patch
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
