# Maintainer: Elliot Hatch <elliot.hatch@gmail.com>
pkgname=dug-git
pkgver=r186.220fc87
pkgrel=1
pkgdesc="A powerful global DNS progagation checker that can output in a variety of formats."
arch=(x86_64)
url="https://git.kaijucode.com/matt/dug"
license=('custom:ANTI-CAPITALIST SOFTWARE LICENSE v1.4')
depends=(dotnet-runtime-bin)
makedepends=(git dotnet-host-bin dotnet-sdk-bin)
provides=(dug)
source=($pkgname::git+https://git.kaijucode.com/matt/dug.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish \
    --configuration Release \
    ./cli
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m644 "./cli/LICENSE" -t "$pkgdir/usr/share/licenses/dug"

  mkdir -p "$pkgdir/usr/lib/dug"
  install -D -m644 ./cli/bin/Release/net5.0/publish/*[^dug] "$pkgdir/usr/lib/dug"
  install -D -m755 "./cli/bin/Release/net5.0/publish/dug" -t "$pkgdir/usr/lib/dug" 

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/dug/dug" "$pkgdir/usr/bin/dug"
}
