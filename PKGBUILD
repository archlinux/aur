# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=controlcenter-daemon
pkgver=1.0.0
pkgrel=1
pkgdesc="ControlCenter Daemon (standalone C# service)"
arch=('x86_64')
url="https://code.weexnes.dev/ControlCenter/ControlCenter.Daemon"
license=('GPL3')
depends=('glibc' 'zlib')
makedepends=('dotnet-sdk')
provides=('controlcenter-daemon')
conflicts=('controlcenter-daemon-git')
options=('!strip')
install=controlcenter-daemon.install
source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/74/archives?revision=${pkgver}&format=tgz"
        "controlcenter-daemon.service")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  dotnet publish ControlCenter.Daemon.csproj -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -o "$srcdir/output"
}

package() {
  install -d "$pkgdir/opt/controlcenter-daemon"
  cp -r "$srcdir/output/"* "$pkgdir/opt/controlcenter-daemon/"

  # Make executable
  chmod +x "$pkgdir/opt/controlcenter-daemon/ControlCenter.Daemon"

  # Link to /usr/local/bin (Actually /usr/bin is better for AUR packages, but sticking to standard /usr/bin)
  install -d "$pkgdir/usr/bin"
  ln -s /opt/controlcenter-daemon/ControlCenter.Daemon "$pkgdir/usr/bin/controlcenter-daemon"

  # Install systemd service
  install -Dm644 "$srcdir/controlcenter-daemon.service" "$pkgdir/usr/lib/systemd/system/controlcenter-daemon.service"
}
