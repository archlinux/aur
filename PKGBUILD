# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=oplnova-git
_commit=20ba1506d710da46454ac2b8b37e1a83b6414574
pkgver=1.7.1.r${_commit:0:7}
pkgrel=1
pkgdesc="A game manager for Open PS2 Loader (OPL) (cutting-edge version)"
arch=('x86_64')
url="https://code.weexnes.dev/oplnova"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/1/archives?revision=${_commit}&format=tgz")
sha256sums=('SKIP')

provides=('oplnova')
conflicts=('oplnova')

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
  # Install all build output into /opt/oplnova
  install -d "$pkgdir/opt/oplnova"
  cp -r "$srcdir/output_linux/"* "$pkgdir/opt/oplnova"

  # Symlink the main binary to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/oplnova/OPLNova "$pkgdir/usr/bin/oplnova"
}
