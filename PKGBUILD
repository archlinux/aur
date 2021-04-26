# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=pamac-cli
pkgver=10.1.0
pkgrel=1
_pkgfixver=$pkgver

_commit='8f6327c00b2303f88ff637a831aa7a049f1a4ec3'
sha256sums=('c046479e265d5093ba80f0ff40697ab776853fb9b17f6a2572cd2e9a28ab6250'
            '13159694127c05fdc41f1ad83aa20e6d1c7c44d73b15046c62613d7f8e522c22')

pkgdesc="Pamac cli frontend for libalpm"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'pacman>=5.2' 'dbus-glib' 'desktop-file-utils' 'appstream-glib' 'gnutls' 'archlinux-appstream-data' 'git')
optdepends=('')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'meson' 'asciidoc' 'ninja' 'gobject-introspection')
conflicts=('pamac' 'pamac-aur' 'pamac-aur-git')
provides=('pamac')
replaces=('pamac')
options=(!emptydirs)
install=

define_meson=''
if [ "${ENABLE_FLATPAK}" = 1 ]; then
  depends+=('flatpak')
  define_meson+=' -Denable-flatpak=true'
fi

if [ "${ENABLE_SNAPD}" = 1 ]; then
  depends+=('snapd' 'snapd-glib')
  define_meson+=' -Denable-snap=true'
fi


source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/pamac-$_commit.tar.gz" "meson.build")

prepare() {
  cd "$srcdir/pamac-$_commit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cp -f "$srcdir/meson.build" "$srcdir/pamac-$_commit/src/meson.build"
  cd "$srcdir/pamac-$_commit"
  mkdir -p builddir
  cd builddir
  meson --buildtype=release \
        --prefix=/usr \
        --sysconfdir=/etc $define_meson
  # build
  ninja
}

package() {
  cd "$srcdir/pamac-$_commit/builddir"
  DESTDIR="$pkgdir" ninja install
  # clean graphic files
  rm -rf "$pkgdir/etc/xdg"
  rm -rf "$pkgdir/usr/share/applications"
  rm -rf "$pkgdir/usr/share/dbus-1/services"
  rm -rf "$pkgdir/usr/share/gnome-shell"
  rm -rf "$pkgdir/usr/share/icons"
}
