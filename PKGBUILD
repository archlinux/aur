# Maintainer: Elliot Hatch <elliot.hatch@gmail.com>
pkgname=dug-git
pkgver=r288.18e4280
pkgrel=1
pkgdesc="A global DNS propagation checker that gives pretty output."
arch=(x86_64)
url="https://dug.unfrl.com/"
license=('MIT')
depends=(zlib gcc-libs glibc)
makedepends=(git 'dotnet-runtime>=6.0.0' 'dotnet-sdk>=6.0.0', 'dotnet-host>=6.0.0')
provides=(dug)
options=(!strip)
source=($pkgname::git+https://github.com/unfrl/dug.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish \
    --configuration Release \
    --runtime linux-x64 \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -p:PublishReadyToRun=true \
    --self-contained true \
    ./cli
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m644 "./LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m755 "./cli/bin/Release/net6.0/linux-x64/publish/dug" -t "$pkgdir/usr/bin" 
}
