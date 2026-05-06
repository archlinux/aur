# Maintainer: MaximGun <maximgun69@proton.me>
pkgname=tbamud-git
_pkgname=tbamud
pkgver=r642.a049fdd
pkgrel=1
pkgdesc="A DikuMUD derivative, multiplayer text-based RPG server (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/tbamud/tbamud"
license=('LicenseRef-custom')
makedepends=('git' 'gcc' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+https://github.com/tbamud/tbamud.git"
  "$_pkgname.service"
  "$_pkgname.install"
  "$_pkgname.tmpfiles"
  "$_pkgname.sysusers"
  "configure-implicit-int.patch"
)
md5sums=('SKIP'
         '914641699bef561360256677ccc34217'
         '232761a54e402c49810bec5f99deb52d'
         'a0763e3f1001849bd633bf161541aa67'
         '024dd6d75c54d7a63a819d7d5f8bf0f4'
         '71fb0be440b453ce669559dfa64bbf62')
install=$_pkgname.install

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  patch -Np0 < "$srcdir/configure-implicit-int.patch"

  # Accept license preemptively
  touch src/.accepted

  # Force a pre-C23 standard so 'bool' and 'false' are not keywords
  export CFLAGS+=" -std=gnu17"

  ./configure --prefix=/usr
  cd src
  make
}

package() {
  cd "$srcdir/$_pkgname"

  # Install binary
  install -Dm755 "$srcdir/$_pkgname/bin/circle" "$pkgdir/usr/bin/$_pkgname"

  # Install stock runtime data. Upstream expects the runtime root to contain
  # lib/, log/, syslog, and changelog, then chdir(3) into lib/.
  install -d "$pkgdir/usr/share/$_pkgname"
  cp -r lib "$pkgdir/usr/share/$_pkgname/"
  cp -r log "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 changelog "$pkgdir/usr/share/$_pkgname/changelog"
  : > "$pkgdir/usr/share/$_pkgname/syslog"

  # Install docs
  install -Dm644 "$srcdir/$_pkgname/doc/README" "$pkgdir/usr/share/doc/$_pkgname/README"

  # Install systemd service
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  # Install tmpfiles and sysusers
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

  # Install license
  install -Dm644 "$srcdir/$_pkgname/doc/license.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
