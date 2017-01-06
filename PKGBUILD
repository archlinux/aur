# Maintainer: Madotsuki <madotsuki@national.shitposting.agency>

_pkgname=synergy
pkgname=$_pkgname-stable
pkgver=1.8.6
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('avahi' 'curl' 'libxinerama' 'libxrandr' 'libxtst' 'qt5-base')
makedepends=('cmake' 'git' 'libxt' 'qt5-base' 'unzip')
optdepends=('openssl: encryption support')
source=(
  "https://github.com/symless/synergy/archive/v1.8.6-stable.tar.gz"
  "$_pkgname.png"
  "${_pkgname}s_at.socket"
  "${_pkgname}s_at.service"
  'SerialKey.patch'
)
install=$pkgname.install
md5sums=('81cd9396a7dd9afb46d124527bd87bcc'
         '46dcd5d0b5751fae904ef4fd447f9959'
         'ac296db26fb856cba5c161d0f010cbf9'
         'd9c40f541e0c89e8d1fbffad0ab2e3a6'
         'd5fb43d055c6338220825d4047ed020f')

prepare() {
  cd $srcdir/$_pkgname-$pkgver-stable
  patch src/lib/shared/SerialKey.cpp ../SerialKey.patch
  sed -i 's|/usr/share/icons/synergy.ico|/usr/share/pixmaps/synergy.png|' res/synergy.desktop
  cd ext
  rm -rf gmock-1.6.0 gtest-1.6.0
  unzip gmock-1.6.0.zip -d gmock-1.6.0
  unzip gtest-1.6.0.zip -d gtest-1.6.0
}

build() {
  # Build Synergy
  cd $srcdir/$_pkgname-$pkgver-stable
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make

  # Build Synergy GUI
  cd src/gui
  qmake
  make
}

package() {
  # Install systemd service and socket
  install -Dm644 ${_pkgname}s_at.service "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.service"
  install -Dm644 ${_pkgname}s_at.socket "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.socket"

  # Install icon (extracted from synergy.ico)
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/synergy.png"

  # Install binary
  cd $srcdir/$_pkgname-$pkgver-stable
  install -Dm755 bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 bin/${_pkgname}c "$pkgdir/usr/bin/${_pkgname}c"
  install -Dm755 bin/${_pkgname}d "$pkgdir/usr/bin/${_pkgname}d"
  install -Dm755 bin/${_pkgname}s "$pkgdir/usr/bin/${_pkgname}s"
  install -Dm755 bin/syntool "$pkgdir/usr/bin/syntool"
  install -Dm755 bin/u$_pkgname "$pkgdir/usr/bin/u$_pkgname"

  # Install config
  install -Dm644 doc/$_pkgname.conf.example "$pkgdir/etc/$_pkgname.conf.example"
  install -Dm644 doc/$_pkgname.conf.example-advanced "$pkgdir/etc/$_pkgname.conf.example-advanced"
  install -Dm644 doc/$_pkgname.conf.example-basic "$pkgdir/etc/$_pkgname.conf.example-basic"

  # Install manfiles
  install -Dm644 doc/${_pkgname}c.man "$pkgdir/usr/share/man/man1/${_pkgname}c.1"
  install -Dm644 doc/${_pkgname}s.man "$pkgdir/usr/share/man/man1/${_pkgname}s.1"

  # Install desktop/icon stuff
  install -Dm644 res/$_pkgname.ico "$pkgdir/usr/share/icons/$_pkgname.ico"
  install -Dm644 res/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  echo "Make sure to \"Activate\" this!"
}
