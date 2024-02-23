# Maintainer: Thaodan <AUR+me@thaodan.de>
pkgname=warcraftlogsuploader
pkgdesc='Warcraft Logs Uploader'
_electron=electron
pkgver=8.2.6
pkgrel=1
arch=('any')
url='https://github.com/RPGLogs/Uploaders-warcraftlogs'
license=('custom')
makedepends=('asar')
depends=($_electron sh)
source=("$url/releases/download/v$pkgver/warcraftlogs-v$pkgver.AppImage" "warcraftlogsuploader.desktop")
sha512sums=('7aa680f94516eccb2c691130ce92d0fd1151f5d2daa565fbfbbdf123d23c11a9392c2f82cc57a5625a16f5637424b3c8bf3d33197d97a2eba9c318f842296353'
            '2362bd563e08e20a75d7c8942574d43fe08ae04d68ddc4f20b64d6e6fc315c6b106b78cb3fb07e2361930584353e3a23b69322939c94edef075af8a74ba26086')

prepare() {
  :
}

build() {
  local _source0=${source[0]##*/}
  chmod +x $_source0
  ./$_source0 --appimage-extract
  asar extract squashfs-root/resources/app.asar $pkgname


  sed -e 's/showDevTools: true/showDevTools: false/' -i $pkgname/js/main.js

  cat > warcraftlogsuploader.sh <<EOF
#!/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOF
  chmod +x warcraftlogsuploader.sh
}

package() {
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  install -dm755 "$pkgdir"/usr/share/icons/hicolor

  cp --archive --no-preserve=ownership \
     $pkgname "$pkgdir"/usr/lib

  install -Dm644 $pkgname/LICENSE.md \
          "$pkgdir"/usr/share/licenses/$appname/LICENSE.md
  rm "$pkgdir"/usr/lib/$pkgname/LICENSE.md

  cp --archive \
     --no-preserve=ownership \
     squashfs-root/usr/share/icons/hicolor/* "$pkgdir"/usr/share/icons/hicolor
  # fix permissions
  find "$pkgdir"/usr/share/icons/hicolor -type d -exec chmod 755 {} \;

  install -Dm755 warcraftlogsuploader.sh "$pkgdir"/usr/bin/warcraftlogsuploader
  install -Dm644 warcraftlogsuploader.desktop \
          "$pkgdir"/usr/share/applications/warcraftlogsuploader.desktop
}
