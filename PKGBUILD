

# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor
pkgver=4.1.1
pkgrel=1
_srcpath="Kryptor-$pkgver/src"
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
depends=('dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuel-lucas6/Kryptor/archive/v$pkgver.tar.gz")
sha512sums=('71d32295c0cd5a5ec3cc3c6a3c7092c5f87aac7b6f927d45216cf837722f6e142269cc653de2909290d10fdb6b9bff9e98a2241398c7b61080acf1cb34c6c087')
conflics=('kryptor-bin')
provides=('kryptor-bin')
# Important to disable binary strip, otherwise the artifact would be corrupted
options=(!strip)

build() {
  cd "$_srcpath"
  if [ $CARCH = 'aarch64' ]; then build_arch=linux-arm64;
  else build_arch=linux-x64; fi
  echo "Build for $build_arch"
  dotnet publish -c Release -r $build_arch -p:PublishSingleFile=true -p:PublishTrimmed=true -p:PublishReadyToRun=true -p:IncludeNativeLibrariesForSelfExtract=true --self-contained true
}

package() {
  cd "$_srcpath"
  if [ $CARCH = 'aarch64' ]; then build_arch=linux-arm64;
  else build_arch=linux-x64; fi
  install -Dm755 "Kryptor/bin/Release/net8.0/$build_arch/publish/kryptor" "$pkgdir/usr/bin/$pkgname"
}

