# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=oplnova
pkgver=1.7.1
pkgrel=2
pkgdesc="A game manager for Open PS2 Loader (OPL)"
arch=('x86_64')
url="https://code.weexnes.dev/oplnova"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/1/archives?revision=refs/tags/${pkgver}&format=tgz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/OPLNova"
  dotnet publish ./OPLNova.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -o "$srcdir/output_linux"
}

package() {
  # Install full output to /opt/oplnova
  install -d "$pkgdir/opt/oplnova"
  cp -r "$srcdir/output_linux/"* "$pkgdir/opt/oplnova"

  # Symlink executable to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/oplnova/OPLNova "$pkgdir/usr/bin/oplnova"
}
