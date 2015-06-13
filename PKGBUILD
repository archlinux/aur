# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=adobe-air-sdk
pkgver=2.6
pkgrel=10
pkgdesc='Adobe Air Software Development Kit and Runtime Environment'
arch=('i686' 'x86_64')
url='http://get.adobe.com/air'
license=('custom')
options=('!strip' 'staticlibs')
depends=('gcc-libs' 'libxml2' 'nss' 'gtk2' 'libxslt')
depends_x86_64+=('lib32-gcc-libs' 'lib32-libxml2' 'lib32-nss' 'lib32-gtk2' 'lib32-libxslt')
install=$pkgname.install
source=("http://airdownload.adobe.com/air/lin/download/$pkgver/AdobeAIRSDK.tbz2")
sha512sums=('8185db9749f05bd60f3e52bf12de779c9f22da73142aca41326f57e24ef9b62c8f4bd9b7ba28cd110c7c4288d61870a8a9b8806bd51ae5cfd860aa57745d4527')
noextract=('AdobeAIRSDK.tbz2')
_air_root='/opt'

prepare() {
  install -d $pkgname
  tar jxf AdobeAIRSDK.tbz2 -C $pkgname
}

package() {
  # Install profile script
  install -dm755 "$pkgdir/etc/profile.d"
  printf '%s\n%s\n' "export AIR_HOME=$_air_root/$pkgname" 'export PATH="$PATH:$AIR_HOME/bin"' \
    > "$pkgdir/etc/profile.d/$pkgname.sh"
  printf '%s\n%s\n' "setenv AIR_HOME $_air_root/$pkgname" 'setenv PATH "$PATH:$AIR_HOME/bin"' \
    > "$pkgdir/etc/profile.d/$pkgname.csh"
  chmod 755 "$pkgdir/etc/profile.d/$pkgname."{sh,csh}

  # Install directories
  install -dm755 "$pkgdir$_air_root" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname"

  # Install main folder
  cp -r --no-preserve=ownership $pkgname "$pkgdir$_air_root"

  # Explicitly set permissions of the binaries
  chmod 755 "$pkgdir$_air_root/$pkgname/bin/ad"{l,t}

  # Create a link to the license in the licenses folder
  ln -s "$_air_root/$pkgname/AIR SDK license.pdf" "$pkgdir/usr/share/licenses/$pkgname"

  # Create links to the readme, samples and templates in the docs folder
  ln -s "$_air_root/$pkgname/AIR SDK Readme.txt" "$pkgdir/usr/share/doc/$pkgname"
  ln -s "$_air_root/$pkgname/samples" "$pkgdir/usr/share/doc/$pkgname"
  ln -s "$_air_root/$pkgname/templates" "$pkgdir/usr/share/doc/$pkgname"
}
