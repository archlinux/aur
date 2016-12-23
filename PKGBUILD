# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

######
# NOTE TO THE NOTE: I have found out why the build failed and will update the package in the near future. Until then this package should work.
######
# NOTE: This should eventually be replaced by the official Riot Desktop Client (/Electron wrapper), but there are major problems building it so this is a replacement until the "official one" gets working. See https://riot.im/desktop.html and https://github.com/vector-im/riot-web#running-as-a-desktop-app for more details.
# The current solution uses nativefier which is also mentioned as "possible" on the GitHub repo linked above.
######

# TODO: Add .desktop file

pkgname=riot-web
#pkgver=0.9.2 # Current official version is 0.9.2 so the current pkgver should be kept under that.
pkgver=0.1
pkgrel=1
pkgdesc="A simple and elegant collaboration environment that gathers all of your different conversations and app integrations into one single app."
arch=("x86_64" "i686")
license=("Apache2")
#source=("git+https://github.com/vector-im/riot-web.git#tag=v$pkgver")
url="https://riot.im"
makedepends=("npm")
#sha512sums=("SKIP")

build() {
  cd $srcdir
  npm install nativefier
  node_modules/.bin/nativefier https://riot.im/app/
}

package() {
  _bits=ia32 ; [ "$CARCH" == "x86_64" ] && _bits=x64 # Thanks limabean
  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/bin/

  cp -R $srcdir/riot-linux-$_bits/ $pkgdir/usr/lib/riot-web
  ln -s /usr/lib/riot-web/riot $pkgdir/usr/bin/riot
  
  chmod -R 644 $pkgdir/usr/lib/riot-web/resources/app
  chmod -R a+rX $pkgdir/usr/lib/riot-web/resources/app # Fix directory permissions
}

# vim:set ts=2 sw=2 et:
