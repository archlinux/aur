

# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor
pkgver=4.0.1
pkgrel=1
_srcpath="Kryptor-$pkgver/src"
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
depends=('dotnet-sdk-6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuel-lucas6/Kryptor/archive/v$pkgver.tar.gz")
sha512sums=('b3391c10991f4d5f917c0aad9ddb225621fa038d5b2282c34c57602b71c0df6dccf56b28b0cf793178a0399c145dc5efd9e27645038f087549e9a489a53922de')
conflics=('kryptor-bin')
provides=('kryptor-bin')
# Important to disable binary strip, otherwise the artifact would be corrupted
options=(!strip)

build() {
  cd "$_srcpath"
  if [ $CARCH = 'aarch64' ]; then build_arch=linux-arm64;
  else build_arch=linux-x64; fi
  echo "Build for $build_arch"
  dotnet publish -c Release -r $build_arch --self-contained -p:PublishReadyToRun=true -p:PublishSingleFile=true
}

package() {
  cd "$_srcpath"
  if [ $CARCH = 'aarch64' ]; then build_arch=linux-arm64;
  else build_arch=linux-x64; fi
  install -Dm755 "Kryptor/bin/Release/net6.0/$build_arch/publish/kryptor" "$pkgdir/usr/bin/$pkgname"
}

