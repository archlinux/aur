# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=$_pkgname-nosnap
pkgver=10.4.3
pkgrel=3

pkgdesc="A Gtk3 frontend from Manjaro Linux for libalpm with AUR, flatpak, and appindicator support."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-nosnap>=11.4.0' 'libhandy' 'appstream-glib')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'fwupd: support firmware updates'
            'git: use git repositories as package sources'
            'svn: use svn repositories as package sources'
            'mercurial: use mercurial (hg) repositories as package sources')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-all' 'pamac-gtk' 'pamac-cli' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome' 'gnome-software' 'gnome-software-git')
provides=('pamac')
options=(!emptydirs)
install=pamac.install
source=("$_pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.bz2")
sha512sums=('011af395092c27c4e73f50b5f43e662b5fb5cd7ae920176c3702479fb05df958fa7ceaf206bfcdad016103d0fc9d6b94e0d94d27701e5afcad2ae92024c90e5c')

prepare() {
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" $srcdir/pamac-v$pkgver/src/version.vala
}

build() {
  arch-meson --buildtype=release -Denable-fake-gnome-software=true $srcdir/pamac-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
