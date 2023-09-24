# Maintainer: xiota / aur.chaotic.cx
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>

_pkgname="xboxdrv"
pkgname="$_pkgname-stable-git"
pkgver=0.8.8.r18.g662952a
pkgrel=1
pkgdesc="XBox/XBox 360 userspace gamepad driver and emulator - git stable branch"
url='https://github.com/xboxdrv/xboxdrv'
arch=('i686' 'x86_64')
license=('GPL3')

depends=(
  'dbus-glib'
  'dbus-python'
  'libusb'
  'libx11'
  'systemd'
)
makedepends=(
  'boost'
  'git'
  'libx11'
  'pkg-config'
  'python'
  'scons'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

backup=("etc/default/xboxdrv")

source=(
  "$_pkgname"::"git+$url#branch=stable"
  fix-60-sec-delay.patch
  xboxdrv.default
  xboxdrv.service
)
sha256sums=(
  'SKIP'
  '0383f5bd248530c2b43f6e2aa591530da50bbea63846c55c04387e7cbe939af9'
  '68a286300d28bbfc97eb694c6cc413776f0bc16e35de6d1969f13ef1e7d1cac5'
  'd631a8c3af7e2b4ef22f1494ded5d7a8029a8dd9756ef8907f909ef6aa0afc2b'
)

prepare() {
  cd "$srcdir/$_pkgname"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  scons \
    LINKFLAGS="$LDFLAGS" \
    CXXFLAGS="$CPPFLAGS $CXXFLAGS" \
    "$MAKEFLAGS"
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm 644 "$srcdir/xboxdrv.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/xboxdrv.default" "$pkgdir/etc/default/$_pkgname"
  install -Dm 644 README.md NEWS PROTOCOL -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 examples/* -t "$pkgdir/usr/share/doc/$_pkgname/examples"
  install -Dm 644 data/org.seul.Xboxdrv.conf -t "$pkgdir/etc/dbus-1/system.d"
}
