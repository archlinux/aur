pkgname=vulpidl-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='sample grabber and modification tool'
arch=('x86_64')
url='https://github.com/d-ord/vulpidl'
license=('MIT')
depends=('electron' 'yt-dlp' 'ffmpeg')
provides=('vulpidl')
conflicts=('vulpidl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/d-ord/vulpidl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5631fda12fecc1ad6e84238747eb9e853bc592c782f30478f82c12b4c1ee3c84')

package() {
  cd "vulpidl-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/vulpidl"
  install -Dm644 main.js renderer.js preload.js index.html styles.css package.json \
    -t "${pkgdir}/usr/lib/vulpidl"
  install -Dm644 icon.png "${pkgdir}/usr/lib/vulpidl/icon.png"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/vulpidl" <<LAUNCHER
#!/bin/bash
exec electron /usr/lib/vulpidl "\$@"
LAUNCHER

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/vulpidl.desktop" <<DESKTOP
[Desktop Entry]
Name=VulpiDL
Comment=Sample grabber and modification tool
Exec=vulpidl %U
Icon=vulpidl
Type=Application
Categories=Audio;Music;AudioVideo;
MimeType=x-scheme-handler/vulpidl;
DESKTOP

  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "build/icons/${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/vulpidl.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
