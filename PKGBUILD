# Maintainer: haoyuanli <lihaoyuan0506@gmail.com>

pkgname=browseros-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="An open-source agentic browser that runs AI agents locally"
arch=("x86_64")
url="https://github.com/browseros-ai/BrowserOS"
license=('AGPL-3.0')
depends=()
makedepends=('7zip')
provides=('browseros')
conflicts=('browseros')
options=('!strip')

source=("browseros.AppImage::https://github.com/browseros-ai/BrowserOS/releases/download/v0.30.0/BrowserOS_v0.30.0_x64.AppImage")
sha256sums=('8385e0aad2b04c60082c31ffc17efcf74572a53b5b559d5402143c05fc939c7c')

package() {
  7z x "$srcdir/browseros.AppImage" -o"$srcdir/squashfs-root" -y >/dev/null

  install -d "$pkgdir/opt"
  cp -r "$srcdir/squashfs-root/opt/browseros" "$pkgdir/opt/"

  # Fix path issue in AppRun
  cat > "$srcdir/AppRun-fixed" << 'EOF'
#!/bin/sh
# Assign /opt/browseros as $HERE
HERE="/opt/browseros"
export LD_LIBRARY_PATH="${HERE}":$LD_LIBRARY_PATH
export CHROME_WRAPPER="${0}"
exec "${HERE}"/browseros "$@"
EOF
  chmod +x "$srcdir/AppRun-fixed"

  install -Dm755 "$srcdir/AppRun-fixed" \
    "$pkgdir/usr/bin/browseros"

  install -Dm644 "$srcdir/squashfs-root/browseros.desktop" \
    "$srcdir/browseros-fixed.desktop"

  # Fix starter script issue
  sed -i 's/^Exec=AppRun %U/Exec=browseros %U/' "$srcdir/browseros-fixed.desktop"

  install -Dm644 "$srcdir/browseros-fixed.desktop" \
    "$pkgdir/usr/share/applications/browseros.desktop"

  install -Dm644 "$srcdir/squashfs-root/browseros.png" \
    "$pkgdir/usr/share/pixmaps/browseros.png"

  if [ -d "$srcdir/squashfs-root/usr/share/icons/hicolor" ]; then
    cp -r "$srcdir/squashfs-root/usr/share/icons/hicolor" \
      "$pkgdir/usr/share/icons/"
  fi

  # Clean up
  rm -rf "$srcdir/squashfs-root" \
         "$srcdir/AppRun-fixed" \
         "$srcdir/browseros-fixed.desktop"
}
