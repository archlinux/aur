# Maintainer: Aixiao <aixiaoo@outlook.com>
pkgname=ssh-at-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop GUI tool for managing SSH keys, hosts, and configurations"
arch=('x86_64')
url="https://github.com/baerwang/ssh-at"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'librsvg')
conflicts=('ssh-at')
provides=('ssh-at')
source=("$pkgname-$pkgver.deb::https://github.com/baerwang/ssh-at/releases/download/v${pkgver}/SSH-AT_${pkgver}_amd64.deb"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/baerwang/ssh-at/main/LICENSE")
sha256sums=('7d81d359693c428244ab87ad95bd3db34db494d84763520024167336c320630a'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
options=('!debug')

package() {
  # Extract deb package
  mkdir -p "$srcdir/deb"
  cd "$srcdir/deb"
  ar x "$srcdir/$pkgname-$pkgver.deb"
  tar xf data.tar.gz

  # Install binary
  install -Dm755 "$srcdir/deb/usr/bin/ssh-at" "$pkgdir/usr/bin/ssh-at"

  # Install desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ssh-at.desktop" <<EOF
[Desktop Entry]
Name=SSH-AT
Comment=Desktop GUI tool for managing SSH keys, hosts, and configurations
Exec=ssh-at %U
Icon=ssh-at
Type=Application
Categories=Network;Utility;System;
Terminal=false
StartupWMClass=ssh-at
Keywords=ssh;key;config;manager;
EOF

  # Install icons
  for size in 32 128; do
    install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/${size}x${size}/apps/ssh-at.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ssh-at.png"
  done

  # Install 256x256@2 icon (retina)
  install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/256x256@2/apps/ssh-at.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/ssh-at.png"

  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
