# Maintainer: maot <me@maot.dev>
pkgname=mapwizard-git
pkgver=v2.0.0
pkgrel=1
pkgdesc="MapWizard - An open-source osu! mapping toolset (Git version)"
arch=('x86_64')
url="https://github.com/maotovisk/MapWizard"
license=('MIT')
depends=('dotnet-runtime>=10.0')
makedepends=('dotnet-sdk>=10.0' 'git')
source=("git+https://github.com/maotovisk/MapWizard.git"
        "mapwizard.desktop"
        "mapwizard.png")
sha256sums=('SKIP'
            '00fe2d035637266874b2f986ff4ba2093ba6d287c348780026228ed5ec9c2607'
            '47c200402dd7ba247e29b945e4367b4f126951cb0d3456e44ab2707dfc268215')

pkgver() {
  cd "$srcdir/MapWizard"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/MapWizard/MapWizard.Desktop"
  dotnet publish -c Release -r linux-x64 --self-contained false -o "$srcdir/out"
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/out/"* "$pkgdir/opt/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mapwizard" <<EOF
#!/bin/sh
exec dotnet "/opt/$pkgname/MapWizard.Desktop.dll" "\$@"
EOF

  install -Dm644 "$srcdir/mapwizard.desktop" "$pkgdir/usr/share/applications/mapwizard.desktop"
  install -Dm644 "$srcdir/mapwizard.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mapwizard.png"
}
