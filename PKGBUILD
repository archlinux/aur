# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='monochrome'
pkgver=2.2.0
pkgrel=4
pkgdesc="Monochrome is a lightweight, privacy-focused music streaming client designed for high-fidelity audio playback. Built with modern web technologies, it provides a clean, distraction-free listening experience."
arch=('x86_64')
url=https://github.com/SamidyFR/monochrome
license=('HIPPOCRATIC LICENSE')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=(
  "$pkgname-$pkgver.zip::https://downloads.samidy.com/out_delivery/monochrome-linux.zip"
  "icon.png::https://raw.githubusercontent.com/SamidyFR/monochrome/refs/heads/main/public/assets/96.png"
)
sha256sums_x86_64=("SKIP" "SKIP")

package() {
  # Install full app to /opt
  install -d "$pkgdir/opt/$pkgname"
  rsync -a --no-links "$srcdir"/* "$pkgdir/opt/$pkgname"

  # Wrapper script
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd /opt/$pkgname
./Monochrome
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Desktop entry
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Monochrome
GenericName=Music streaming player
Comment=Lossless music streaming
Icon=$pkgname.png
Exec=/usr/bin/$pkgname
Terminal=false
Categories=Audio;Music;Player;
EOF
}
