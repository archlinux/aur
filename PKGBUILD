# Maintainer: Jason Go <jasongo@jasongo.net>

_fedora_pkgname='libutempter'
pkgname="lib32-$_fedora_pkgname-bin"
pkgver=1.2.1_19_43
_pkgver=( ${pkgver//_/ } )
_upver="${_pkgver[0]}"
_buildver="${_pkgver[1]}"
_fcver="${_pkgver[2]}"
pkgrel=1
pkgdesc='Interface for terminal emulators to record user sessions to utmp and wtmp files (32-bit)'
arch=('x86_64')
url='https://github.com/altlinux/libutempter'
license=('LGPL-2.1-or-later')
depends=('lib32-glibc')
provides=(
  'lib32-libutempter'
  'lib32-libutempter0'
  'lib32-libutempter1'
  'lib32-utempter'
  'lib32-utempter0'
  'lib32-utempter1'
  'lib32-utempter_1.1'
  'libutempter.so=0'
  'libutempter.so=1'
)
conflicts=(
  'lib32-libutempter'
  'lib32-libutempter0'
  'lib32-libutempter1'
  'lib32-utempter'
  'lib32-utempter0'
  'lib32-utempter1'
  'lib32-utempter_1.1'
)
options=(staticlibs !buildflags !makeflags !strip !debug)
source=("https://kojipkgs.fedoraproject.org/packages/$_fedora_pkgname/$_upver/$_buildver.fc$_fcver/i686/$_fedora_pkgname-$_upver-$_buildver.fc$_fcver.i686.rpm")
sha256sums=('be2444b05a96d73f99440ac5f1a69eecbe78fc1026434816f75b278f0ba53713')

package() {
  mv "$srcdir/usr" "$pkgdir"

  # Move 32-bit libraries accordingly
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"

  # Move utempter to lib32 just like how extra/libutempter places utempter under /usr/lib
  mv "$pkgdir/usr/libexec/utempter" "$pkgdir/usr/lib32"

  # Create a premission configuration similar to extra/libutempter
  mkdir "$pkgdir/usr/lib32/tmpfiles.d"
  echo "z /usr/lib32/utempter/utempter 2755 root utmp" > "$pkgdir/usr/lib32/tmpfiles.d/libutempter.conf"

  mv "$pkgdir/usr/share/doc/$_fedora_pkgname" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/share/licenses/$_fedora_pkgname" "$pkgdir/usr/share/licenses/$pkgname"

  # Not needed in Arch Linux
  rm -rf "$pkgdir/usr/libexec"
  rm -rf "$pkgdir/usr/lib32/.build-id"
  rm -rf "$pkgdir/usr/lib32/sysusers.d"
}
