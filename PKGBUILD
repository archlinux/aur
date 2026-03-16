# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='monochrome'
pkgver=2.2.0.41
pkgrel=1
pkgdesc="Lossless music streaming"
arch=('x86_64')
url=https://github.com/monochrome-music/monochrome
license=('HIPPOCRATIC LICENSE')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=(
  "$pkgname-$pkgver.zip::https://downloads.samidy.com/out_delivery/monochrome-linux.zip"
  "icon.png::https://raw.githubusercontent.com/monochrome-music/monochrome/refs/heads/main/public/assets/96.png"
)
sha256sums_x86_64=('c831c2b089610363e76e5d7d7a1a7e9ed55f0433bade74f2180f8c8364b9643c'
                   'c9551cf8f13846e1d330d408dc1c39b9b9d98448f57d9c722bfddab5bd905084')

package() {
  # Install full app to /opt
  install -d "$pkgdir/opt/$pkgname"
  find "$srcdir"/* ! -type l -exec cp -r -t "$pkgdir/opt/$pkgname" {} +

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
