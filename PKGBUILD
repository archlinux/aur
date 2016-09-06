# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Previous Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Adapted for dp1 version by Semyon Maryasin <simeon@maryasin.name>
# Adapted for beta12/release by Adam Goldsmith <contact@adamgoldsmith.name>
# vim: ft=sh

pkgname=pebble-sdk
pkgver=4.4
pkgrel=1
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.getpebble.com/2/getting-started/"
arch=('i386' 'x86_64')
license=('MIT')
install='pebble-sdk.install'
depends=('python2'
		 'python2-libpebble2-git'
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
source_i386=("https://s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux32.tar.bz2")
source_x86_64=("https://s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux64.tar.bz2")
source=('phonesim_path.patch')
sha1sums=('231b04c03ea4ec1f49eee94ac0caa84021210caa')
sha1sums_i386=('8eec737d27a16e50ea25a7fb9db7fa6e798a6ae0')
sha1sums_x86_64=('61a2f3487bb073e3385ca8f443ef02a91d05645d')

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
