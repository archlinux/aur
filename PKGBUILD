# Maintainer: AkitaOnRails <akitaonrails@users.noreply.github.com>

pkgname=frank-geary
pkgver=46.0_frank.3
pkgrel=1
pkgdesc='GNOME Geary email client with FrankGeary workflow improvements'
arch=('x86_64')
url='https://github.com/akitaonrails/frank_geary'
license=('LGPL-2.1-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'dconf'
  'enchant'
  'folks'
  'gcr'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gmime3'
  'gnome-online-accounts'
  'gsound'
  'gspell'
  'gtk3'
  'hicolor-icon-theme'
  'icu'
  'iso-codes'
  'json-glib'
  'libgee'
  'libgoa'
  'libhandy'
  'libpeas-2'
  'libsecret'
  'libsoup3'
  'libstemmer'
  'libunwind'
  'libxml2'
  'libytnef'
  'org.freedesktop.secrets'
  'pango'
  'sqlite'
  'webkit2gtk-4.1'
)
makedepends=(
  'appstream'
  'desktop-file-utils'
  'git'
  'gobject-introspection'
  'itstool'
  'meson'
  'ninja'
  'pkgconf'
  'vala'
)
checkdepends=(
  'aspell'
  'dbus'
  'hspell'
  'libvoikko'
  'nuspell'
  'xorg-server-xvfb'
)
provides=('geary')
conflicts=('geary')
_tag="v${pkgver/_/-}"
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
  arch-meson FrankGeary build -Dprofile=release
  meson compile -C build
}

check() {
  xvfb-run -a dbus-run-session -- meson test -C build --print-errorlogs \
    vala-unit:tests \
    geary:desktop-file-validate \
    geary:org.gnome.Geary.metainfo.xml-validate \
    geary:mail-merge-test \
    geary:engine-tests
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
