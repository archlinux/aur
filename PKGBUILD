# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Previous Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Adapted for dp1 version by Semyon Maryasin <simeon@maryasin.name>
# Adapted for beta12/release by Adam Goldsmith <contact@adamgoldsmith.name>
# vim: ft=sh

pkgname=pebble-sdk
pkgver=4.5
pkgrel=2
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.rebble.io/developer.pebble.com/index.html"
arch=('i386' 'x86_64')
license=('MIT')
install='pebble-sdk.install'
depends=('python2'
		 'python2-libpebble2-git'
		 'python2-virtualenv'
		 'python2-enum34'
         'python2-httplib2'
         'python2-oauth2client'
         'python2-progressbar2-old'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pypng'
         'python2-pyqrcode'
         'python2-requests'
         'python2-rsa'
         'python2-pyserial'
         'python2-six'
         'python2-websocket-client'
         'python2-wheel'
         'python2-colorama')
optdepends=('python2-virtualenv: Required for installing SDK'
			'npm: Required for installing SDK'
            'arm-none-eabi-gcc: Required for installing SDK'
            'arm-none-eabi-newlib: Required for installing SDK'
			'libpng12: Emulator support'
            'dtc: Emulator support'
			'python2-pypkjs-git: Emulator support')
conflicts=('pebble-sdk-beta' 'pebble-tool-git')
source_i386=("https://developer.rebble.io/s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux32.tar.bz2")
source_x86_64=("https://developer.rebble.io/s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux64.tar.bz2")
source=('phonesim_path.patch')
sha1sums=('231b04c03ea4ec1f49eee94ac0caa84021210caa')
sha1sums_i386=('f5e9e3ba91811b1a486a14b6b2c8558d13a01982')
sha1sums_x86_64=('7bc45d4dc085e7ffb6a49c3ae1d263461051c7f5')

if [ "$CARCH" == "x86_64" ]
then
  folder="pebble-sdk-${pkgver}-linux64"
else
  folder="pebble-sdk-${pkgver}-linux32"
fi

prepare() {
  cd "$srcdir/${folder}"

  #Patch location of phonesim.py
  patch -p0 -i "$srcdir/phonesim_path.patch"

  #Disable strict dependency version checks
  cd "pebble-tool"
  sed -i 's/==.*$//' requirements.txt
  sed -i 's/==.*'\'',$/'\'',/' setup.py
  sed -i 's/==.*'\'')$/'\'')/' setup.py
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  cd "${folder}"
  install -m755 "bin/pebble" "bin/qemu-pebble" "$pkgdir/usr/bin"

  cd pebble-tool
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
