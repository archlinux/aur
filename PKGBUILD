pkgname=kakele
pkgver=latest
pkgrel=1
pkgdesc="Kakele Online is a Cross Platform, 2D open world massive multiplayer online role playing game"
arch=('x86_64')
url="https://kakele.io"
license=('custom')
depends=()
source_url=$(curl -s $url | grep -oP 'href="\Khttps://kakele\.nyc3\.cdn\.digitaloceanspaces\.com/[^"]+' | head -n 1)
md5sums=('SKIP')
pkgver() {
    version=$(echo $source_url | awk -F '/' '{print $(NF-1)}')
    echo "${version}"
}
pkgver=$(pkgver)
source=("https://kakele.nyc3.cdn.digitaloceanspaces.com/$pkgver/kakele-$pkgver-linux.zip")

package() {
  mkdir -p "$pkgdir/opt/$pkgname/screenshots"
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  chmod -R 777 "${pkgdir}/opt/$pkgname/screenshots"
  bsdtar -xOf "kakele.jar" "image/icon.png" > "$srcdir/kakele.png"
  cp "$srcdir/kakele.png" "${pkgdir}/usr/share/pixmaps/"
  echo "[Desktop Entry]
Name=kakele
Comment=kakele mmorpg
Exec=kakele
Icon=kakele
Terminal=false
Type=Application
Categories=Game;" > "$srcdir/kakele.desktop"
  rsync -av --exclude="kakele-$pkgver-linux.zip" --no-owner "$srcdir/" "$pkgdir/opt/$pkgname"
  chmod -R 775 "${pkgdir}/opt/$pkgname"
  chgrp -R games "${pkgdir}/opt/$pkgname"
  install -Dm664 "$srcdir/kakele.desktop" "$pkgdir/usr/share/applications/kakele.desktop"
  ln -s "/opt/$pkgname/kakele" "$pkgdir/usr/bin/kakele"
}
