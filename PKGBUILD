# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=ps2_manager-git
_commit=542c940bfa9862d11edc83b6817ba956025ed9c6
pkgver=1.6.1.r${_commit:0:7}
pkgrel=1
pkgdesc="A game manager for Open PS2 Loader (OPL) (cutting-edge version)"
arch=('x86_64')
url="https://code.weexnes.dev/ps2_manager"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/18/archives?revision=${_commit}&format=tgz")
sha256sums=('SKIP')

provides=('ps2_manager')
conflicts=('ps2_manager')

build() {
  cd "$srcdir/PS2_Manager"
  dotnet publish ./PS2_Manager.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -o "$srcdir/output_linux"
}

package() {
  # Install all build output into /opt/ps2_manager
  install -d "$pkgdir/opt/ps2_manager"
  cp -r "$srcdir/output_linux/"* "$pkgdir/opt/ps2_manager"

  # Symlink the main binary to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/ps2_manager/PS2_Manager "$pkgdir/usr/bin/ps2_manager"
}
