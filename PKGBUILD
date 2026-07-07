# Maintainer: Aixiao <aixiaoo@outlook.com>
pkgname=rssh-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="SSH connection manager with desktop GUI, terminal, SFTP, and port forwarding"
arch=('x86_64')
url="https://github.com/shihuili1218/rssh"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'librsvg' 'libsecret')
optdepends=('xterm: for terminal emulation')
conflicts=('rssh')
provides=('rssh')
source=("$pkgname-$pkgver.deb::https://github.com/shihuili1218/rssh/releases/download/v$pkgver/rssh-$pkgver-linux-x86_64.deb"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/shihuili1218/rssh/main/LICENSE")
sha256sums=('0d8c2e8594c4ac4fe1756c21716caa5b7834ddbc446d5ecd9021bf029e2ab1fa'
            '5ddb2b27c0605dc4c5b71c0766ed702c8a083dacd4868f329f6a9d2a4a1eeec8')
options=('!debug')

package() {
  # Extract deb package
  mkdir -p "$srcdir/deb"
  cd "$srcdir/deb"
  ar x "$srcdir/$pkgname-$pkgver.deb"
  tar xf data.tar.gz

  # Install binary
  install -Dm755 "$srcdir/deb/usr/bin/rssh" "$pkgdir/usr/bin/rssh"

  # Install desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rssh.desktop" <<EOF
[Desktop Entry]
Name=RSSH
Comment=SSH connection manager with desktop GUI, terminal, SFTP, and port forwarding
Exec=rssh %U
Icon=rssh
Type=Application
Categories=Network;
Terminal=false
StartupWMClass=rssh
Keywords=ssh;terminal;sftp;connection;remote;
EOF

  # Install icons
  for size in 32 128; do
    install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/${size}x${size}/apps/rssh.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/rssh.png"
  done

  # Install 256x256@2 icon (retina)
  install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/256x256@2/apps/rssh.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/rssh.png"

  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
