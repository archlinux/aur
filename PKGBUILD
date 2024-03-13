# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>
# Code for pamac-cli is based on Zeph's work. Thanks a lot!

pkgname=('pamac-aur-git')
_pkgname=pamac
pkgver=11.7.1.r0.g73cef1d
_pkgver=11.7.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-git' 'libhandy' 'libadwaita' 'gtk4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc' 'git')
options=(!emptydirs)
# Only for Manjaro users who should not use it...
provides=('pamac')
conflicts=('pamac' 'pamac-all' 'pamac-aur' 'pamac-all-git')
# End of Manjaro users section
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git
	git+https://gitlab.manjaro.org/applications/pamac-cli.git
)
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # adjust version string
  cd $_pkgname
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
  cd $srcdir/$_pkgname-cli
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
  # patches here
}

build() {
  cd $_pkgname
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc --buildtype=release -Denable-fake-gnome-software=true
  # build
  ninja
  
  cd $srcdir/$_pkgname-cli
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc --buildtype=release
  meson compile
}

package() {
  conflicts=('pamac-aur')
  install=pamac.install
  cd $_pkgname
  cd builddir
  DESTDIR="$pkgdir" ninja install
  # removed pamac-mirrorlist-timer, useless for Archlinux
  # remove pamac-gnome-integration
  rm "$pkgdir/usr/bin/gnome-software"
  rm "$pkgdir/usr/share/applications/org.gnome.Software.desktop"
  rm "$pkgdir/usr/share/dbus-1/services/org.gnome.Software.service"
  
  install -Dm644 "$srcdir/$_pkgname/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "$srcdir/$_pkgname-cli/builddir"
  meson install --destdir "$pkgdir"

}

#vim:set ts=2 sw=2 et:
