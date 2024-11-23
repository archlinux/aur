# Maintainer: Marcus Ben Spencer <marcus at marcusspencer dot xyz>
# Maintainer: runningpie <levi at levispencer dot com>
# Contributor: Hwkiller
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>

pkgname="moltengamepad-git"
_appname="moltengamepad"
pkgver=1.2.3.r0.g41202e1
pkgrel=1
pkgdesc="Flexible Linux input device translator, geared for gamepads"
url="https://gitlab.com/AllMeatball/moltengamepad"
arch=('x86_64')
license=('MIT')
source=("$pkgname::git+https://gitlab.com/AllMeatball/$_appname.git"
        "$_appname-sysusers.conf"
        "70-$_appname-uaccess.rules")
md5sums=('SKIP'
         'b298ff92e4d833ce2866c8dd9fb131ca'
         '1bb392d4b419d2d13bff837c6c7ce138')
depends=('scraw' 'scrawpp')
makedepends=('go-md2man' 'git' 'make' 'sed')
provides=("$_appname")
conflicts=("$_appname")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$pkgname"
  make eventlists
}

build() {
  cd "$srcdir/$pkgname"
  sed -i '3 s/^#//' Makefile
  sed -i '5 s/^#//' Makefile
  sed -i '11 s|/usr/local/bin/|/usr/bin/|' installation/systemuser/systemd.service
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/usr/lib/$_appname/udev/rules.d/
  mkdir -p $pkgdir/usr/lib/sysusers.d/
  # Binary
  install -Dm755 $_appname $pkgdir/usr/bin/$_appname
  # Systemd
  install -Dm644 installation/systemuser/systemd.service $pkgdir/usr/lib/systemd/system/$_appname.service

  # Udev rules and SDL2 profile (Note: These are not actually installed for use; they are just provided)
  install -Dm644 $srcdir/70-$_appname-uaccess.rules $pkgdir/usr/lib/$_appname/udev/rules.d/70-$_appname-uaccess.rules
  install -Dm644 installation/systemuser/udev.rules $pkgdir/usr/lib/$_appname/udev/rules.d/72-$_appname-systemuser.rules
  install -Dm644 installation/singleuser/udev.rules.template $pkgdir/usr/lib/$_appname/udev/rules.d/90-$_appname-singleuser.rules
  install -Dm644 installation/systemuser/profile-sdl2.sh $pkgdir/usr/lib/$_appname/etc/profile.d/profile-sdl2.sh
  # Sys user
  install -Dm 644 $srcdir/moltengamepad-sysusers.conf $pkgdir/usr/lib/sysusers.d/$_appname.conf
  # Sys user tmp dir
  install -Dm644 installation/systemuser/tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/$_appname.conf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_appname/license
}
