pkgname=archtoys
pkgver=0.1.6
pkgrel=1
pkgdesc="PowerToys-like color picker for Linux (Slint-based)"
arch=('x86_64')
url="https://github.com/Mujtaba1i/Archtoys"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git')
install=archtoys.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mujtaba1i/Archtoys/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Archtoys-$pkgver"
  cargo build --release --locked
}

package() {
  cd "Archtoys-$pkgver"

  install -Dm755 target/release/color-picker "$pkgdir/usr/lib/archtoys/archtoys-bin"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/archtoys" <<'WRAP'
#!/bin/sh
export SLINT_BACKEND=winit
exec /usr/lib/archtoys/archtoys-bin "$@"
WRAP

  if [[ -f packaging/archtoys.desktop ]]; then
    install -Dm644 packaging/archtoys.desktop "$pkgdir/usr/share/applications/archtoys.desktop"
  else
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/archtoys.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Archtoys
Comment=System-wide color picker
Exec=archtoys
Icon=archtoys
Terminal=false
StartupWMClass=archtoys-bin
Categories=Graphics;Utility;
DESKTOP
  fi

  if [[ -f packaging/archtoys.png ]]; then
    install -Dm644 packaging/archtoys.png "$pkgdir/usr/share/pixmaps/archtoys.png"
    ln -sf archtoys.png "$pkgdir/usr/share/pixmaps/archtoys-bin.png"
  fi
  for size in 16 22 24 32 48 64 128 256 512 1024; do
    if [[ -f "packaging/archtoys-${size}.png" ]]; then
      install -Dm644 "packaging/archtoys-${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
      ln -sf archtoys.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/archtoys-bin.png"
    fi
  done
  if [[ -f packaging/archtoys.png ]]; then
    install -Dm644 packaging/archtoys.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/archtoys.png"
    ln -sf archtoys.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/archtoys-bin.png"
  elif [[ -f image.png ]]; then
    install -Dm644 image.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/archtoys.png"
    ln -sf archtoys.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/archtoys-bin.png"
  fi
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
