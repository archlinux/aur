# Contributor: Hwkiller

pkgname="moltengamepad-git"
_pkgroot="moltengamepad"
pkgver=v1.1.0.r36.g95b0d47
# pkgver=1.1.0
pkgrel=1
pkgdesc="Flexible Linux input device translator, geared for gamepads"
url="https://github.com/jgeumlek/MoltenGamepad"
arch=('x86_64')
license=('MIT')
source=("moltengamepad-git::git+https://github.com/jgeumlek/MoltenGamepad.git"
	"moltengamepad-sysusers.conf"
        "70-moltengamepad-uaccess.rules")
md5sums=('SKIP'
         'b298ff92e4d833ce2866c8dd9fb131ca'
         '1bb392d4b419d2d13bff837c6c7ce138')
depends=('scraw' 'scrawpp')
makedepends=('go-md2man')
provides=("moltengamepad")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -i '3 s/^#//' Makefile
  sed -i '5 s/^#//' Makefile
  sed -i '11 s|/usr/local/bin/|/usr/bin/|' installation/systemuser/systemd.service
  make eventlists
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/usr/lib/moltengamepad/udev/rules.d/
  mkdir -p $pkgdir/usr/lib/sysusers.d/
  # Binary
  install -Dm755 moltengamepad $pkgdir/usr/bin/moltengamepad
  # Systemd
  install -Dm644 installation/systemuser/systemd.service $pkgdir/usr/lib/systemd/system/moltengamepad.service

  # Udev rules and SDL2 profile (Note: These are not actually installed for use; they are just provided) 
  install -Dm644 ${srcdir}/70-moltengamepad-uaccess.rules "$pkgdir"/usr/lib/moltengamepad/udev/rules.d/70-moltengamepad-uaccess.rules
  install -Dm644 installation/systemuser/udev.rules "$pkgdir"/usr/lib/moltengamepad/udev/rules.d/72-moltengamepad-systemuser.rules
  install -Dm644 installation/singleuser/udev.rules.template "$pkgdir"/usr/lib/moltengamepad/udev/rules.d/90-moltengamepad-singleuser.rules
  install -Dm644 installation/systemuser/profile-sdl2.sh "$pkgdir"/usr/lib/moltengamepad/etc/profile.d/profile-sdl2.sh
  # Sys user
  install -Dm 644 ${srcdir}/moltengamepad-sysusers.conf $pkgdir/usr/lib/sysusers.d/moltengamepad.conf
  # Sys user tmp dir
  install -Dm644 installation/systemuser/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/moltengamepad.conf
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgroot/license
}
