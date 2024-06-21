# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Andrew Rabert <ar@nullsum.net>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>

_pkgname="xboxdrv"
pkgname="$_pkgname-git"
pkgver=0.8.11.r0.gf3dfdc6
pkgrel=1
pkgdesc="Userspace Xbox gamepad driver and input remapper"
url="https://github.com/xiota/xboxdrv"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'python'
  'dbus-glib'
  'dbus-python'
  'libusb'
  'libx11'

  # implicit
  #bash
  #dbus
  #glib2
  #systemd-libs
)
makedepends=(
  'git'
  'glib2-devel'
  'pkg-config'
  'scons'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

backup=("etc/default/xboxdrv")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "xboxdrv.default"
  "xboxdrv.service"
)
sha256sums=(
  'SKIP'
  '68a286300d28bbfc97eb694c6cc413776f0bc16e35de6d1969f13ef1e7d1cac5'
  'd631a8c3af7e2b4ef22f1494ded5d7a8029a8dd9756ef8907f909ef6aa0afc2b'
)

pkgver() {
  cd "$_pkgsrc"

  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"

  printf '%s' "$pkgver" > VERSION

  scons \
    LINKFLAGS="$LDFLAGS" \
    CXXFLAGS="$CPPFLAGS $CXXFLAGS" \
    "$MAKEFLAGS"
}

package() {
  cd "$_pkgsrc"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/$_pkgname.default" "$pkgdir/etc/default/$_pkgname"
  install -Dm644 README.md NEWS PROTOCOL -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$_pkgname/examples/"
  install -Dm644 data/org.seul.Xboxdrv.conf -t "$pkgdir/etc/dbus-1/system.d/"
}
