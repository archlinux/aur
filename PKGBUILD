

# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor
pkgver=4.1.0
pkgrel=1
_srcpath="Kryptor-$pkgver/src"
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
depends=('dotnet-sdk-6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuel-lucas6/Kryptor/archive/v$pkgver.tar.gz")
sha512sums=('95a2a74499bd2e3d0729bc2b78aa68e8d1c12a7ead3acf57a626d646c9a4de474f06a09912a773c7ff4849cb5039513a26d7daeb0bdc874ea19104a6f27b6521')
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
  install -Dm755 "Kryptor/bin/Release/net6.0/$build_arch/publish/kryptor" "$pkgdir/usr/bin/$pkgname"
}

